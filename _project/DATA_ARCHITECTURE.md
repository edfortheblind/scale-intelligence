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

The acquisition sequence remains AIM, then SDK, then cross-module reconciliation and private delivery verification. Building the interactive app itself is a subsequent implementation task; this corpus preserves the data and relationships it will need.

## Replica architecture and supporting design evidence

The owner-authorized database assessment adds a separate generation under `DB Architecture/`: snapshot-scoped object records, catalog attributes, source-definition fingerprints, redacted SQL reading copies, static dependency edges, process-summary references and aggregate runtime observations. Its [intelligence contract](../DB%20Architecture/INTELLIGENCE_CONTRACT.md) defines claim types and joins to existing article IDs, original hashes and node IDs. Structural coverage, semantic review and observed process runtime remain independent measures. No operational rows enter the app corpus, and credentials/raw definitions stay in protected local storage outside OneDrive and Git.

`SDD/README.md` registers the supplied solution-design/configuration/training documents as another evidence class. Their product/version and implementation context must survive extraction. A design statement is not proof of current deployment behavior. Preserve all original AIM/SDK source records and accepted gaps when adding these derived relationships; the existing search database has not yet been extended or rebuilt for DB/SDD retrieval.
