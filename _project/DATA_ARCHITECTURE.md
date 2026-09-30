# Data storage for the SCALE consultation app

The reusable app corpus has three layers. The originals are the fidelity authority; structured JSON is the portable app interface; SQLite FTS5 is a rebuildable local search index. Search indexes never replace the source or determine capture completeness.

| Layer | Files | Purpose |
| --- | --- | --- |
| Original evidence | `AIM/source/`, `SDK/source/` | Unchanged response bytes for HTML, navigation, images, attachments and support resources; SHA-256 and acquisition provenance in resource manifests. |
| App documents | Module `data/articles/<stable-id>.json` and `manifests/toc.json` | Ordered content tree, exact decoded text, headings, tables with spans, code whitespace, figures, documentary variants, links, hierarchy and source references. |
| Reading copies | Module `reading/<stable-id>.md` and HTML companions | Faithful human-readable copies with local links and inert content. Complex structures remain HTML rather than being flattened. |
| Search database | `_project/search.sqlite` | Rebuilt from validated structured documents. FTS5 indexes titles and article text; relational tables connect topics, navigation, links, assets and variants. |

Article IDs derive from the full source identity with case and query preserved and fragment separated. Titles are display data, never identifiers. Repeated navigation appearances remain separate TOC nodes pointing to the same resource. Parent-child paths and cross-references support browsing, related-topic navigation, and precise citations back to the article and its source hash.

Each article JSON carries a schema version, module, source URL and hash, conversion version, ordered content nodes, content inventory, dependencies, and validation state. Original terminology, qualifications, code, license notices and text remain intact. Newly authored metadata is separate from source content. Images and attachments are separate binary files referenced by their resource IDs and hashes; they are not embedded as base64 in article JSON.

Precise app citations use the resource ID, original SHA-256, and content node ID together. Node IDs identify a location within that source generation; they are not assumed to survive source edits. `content_text` retains decoded source whitespace, while `search_text` adds block boundaries for reliable keyword matching. The source content tree is data, including original attributes; applications render the sanitized reading representation or apply an equivalent allowlist, rather than injecting source attributes as live HTML.

The complete outgoing reference graph lives in each article JSON's `references` array and is indexed in SQLite. Resource manifests retain discovery evidence and point to that graph. This avoids rewriting a growing shared asset manifest for every article while retaining all original hrefs, effective bases, node locations and source hashes. Existing occurrence history remains intact.

Only verified reading documents enter the production search index. Incomplete discovery and failed resources remain visible in coverage and error reports. A provisional index, if generated before completion, is explicitly marked incomplete. The database is disposable and reproducible from JSON and manifests; the app can later import the same records into a server database without recollecting SCALE. Embeddings may be added as another derived index later, but are not required for exact keyword search and never replace the original text.

The acquisition sequence was AIM, SDK, cross-module reconciliation and private delivery verification. The separate local help prototype now consumes reviewed functional records while preserving the original corpus and its relationships.

## Replica architecture and supporting design evidence

The owner-authorized database assessment adds a separate generation under `DB Architecture/`: snapshot-scoped object records, catalog attributes, source-definition fingerprints, redacted SQL reading copies, static dependency edges, process-summary references and aggregate runtime observations. Its [intelligence contract](../DB%20Architecture/INTELLIGENCE_CONTRACT.md) defines claim types and joins to existing article IDs, original hashes and node IDs. Structural coverage, semantic review and observed process runtime remain independent measures. No operational rows enter the app corpus, and credentials/raw definitions stay in protected local storage outside OneDrive and Git.

`SDD/README.md` registers the supplied solution-design/configuration/training documents as another evidence class. Their product/version and implementation context must survive extraction. A design statement is not proof of current deployment behavior. Preserve all original AIM/SDK source records and accepted gaps when adding these derived relationships; the existing search database has not yet been extended or rebuilt for DB/SDD retrieval.


## Curated functional and SDD records

`DB Architecture/mappings/batches/` stores bounded reviewed SQL contracts and exact evidence references. The shared help, role, family, configuration and source-reconciliation ledgers remain distinct from the structural catalog. `object-review-ledger.json` preserves reviewed and unreviewed states for every eligible object; a generated identity row is not semantic review.

`SDD/derived/inventory.json` binds all nine originals to eight unique content records. Each document JSON preserves text, table/slide/page coordinates, media hashes and fidelity exceptions. `reviewed-knowledge.json` overlays only the cited product markers, claims, settings and diagram descriptions. A body extraction does not make every node reviewed or production-index eligible. The existing AIM/SDK search database remains unchanged.

## Local curated help implementation

`tools/serve_help.py` serves native HTML and bounded JSON APIs on loopback. `help_knowledge.py` loads one verified knowledge generation, uses a disposable FTS5 index for each search and excludes evaluation questions/answer keys. It serves authored answers, with no model, database connection or generated SQL.

SQL citations bind redacted-copy and original-definition hashes; vendor citations bind original bytes and content nodes. Four selected SDD claims additionally bind the exact reviewed record, original document and extracted node identities. Only their reviewed conclusions and locations enter the local prototype; raw SDD bodies remain outside production indexing. Retained configuration/runtime citations preserve their aggregate, temporal and replica boundaries.

`runtime-profiles.json` preserves historical object/replica/execution-type dimensions and every retained source-row position. `help_app/evaluation.json` separates actual HTTP retrieval from selected-topic integrity. Neither is evidence of historical SQL-definition identity, whole-process timing, production deployment or intended-user accessibility acceptance.
