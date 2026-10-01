# C20 archive disposition and root prompt roles

The owner requested archiving unused SDD material and checking whether root prompts still have a current role. **52 files, totaling 91,572,429 bytes**, were moved into `archive/C20/` with their original relative paths and exact bytes preserved. Each source and destination was checked by byte length and SHA-256. No existing C17 archive payload was opened.

The [machine-readable manifest](archive-disposition-continuation20.json) maps every original path to its archive destination, hash, size and current old-path state. It also retains text-free node identities, asset identities, and exact fingerprints for the retired source's 39 historical review records. This active metadata is an archival attestation; ordinary validation does not reopen the archived source body.

| Archived material | Files | Disposition |
| --- | ---: | --- |
| Excluded-product originals, including duplicate | 2 | No active SCALE reference or help dependency |
| Excluded-product extraction and reading copy | 2 | Raw extraction retired; reading path now a short redirect |
| Excluded-product extracted images | 37 | Replaced in historical checks by frozen identity metadata |
| Earlier document PDF exports | 4 | C18 hashes and 541-page review retained as historical evidence |
| Superseded generated SDD guides | 5 | Old paths now direct readers to the central reference |
| Earlier extraction and DOCX layout reports | 2 | Original reports archived; old paths now short redirects |

The [central SCALE Functionality Reference](../SDD/SCALE_FUNCTIONAL_REFERENCE.md), its [equivalent PDF](<../output/pdf/SCALE Functionality Reference SDD.pdf>), technical register and **seven SCALE originals and extracted bodies remain active and unchanged**. Mixed historical review registers, intake inventory, coverage and C18 layout JSON remain unchanged because exact record identities support existing provenance. Keeping these records does not make excluded-product content part of the active reference.

## Root prompts checked

| Root file | Current role | Decision |
| --- | --- | --- |
| [01_AIM_MASTER_PROMPT.md](../01_AIM_MASTER_PROMPT.md) | Original acquisition authority and byte-integrity evidence | Keep exact bytes; do not resume closed collection from it |
| [02_SDK_MASTER_PROMPT.md](../02_SDK_MASTER_PROMPT.md) | Original acquisition authority and current SDK delivery revalidation input | Keep exact bytes; do not resume closed collection from it |
| [03_SCALE_INTELLIGENCE_MASTER_PROMPT.md](../03_SCALE_INTELLIGENCE_MASTER_PROMPT.md) | Current project master instructions | Keep active |
| [04_SCALE_ASTRA_RESTART_PROMPT.md](../04_SCALE_ASTRA_RESTART_PROMPT.md) | Current restart entry point | Keep active; start here |
| [04_SCALE_SOL_RESTART_PROMPT.md](../04_SCALE_SOL_RESTART_PROMPT.md) | Small compatibility redirect to the active restart prompt | Keep redirect; original was already archived in C17 |

The first two prompts are no longer operational collection instructions. They remain meaningful current dependencies: `tools/build_delivery_inventory.py` includes them, `tools/verify_delivery.py` requires and hashes them against preflight identities, and SDK delivery authority follows policy/revalidation bindings to their original hashes. Removing them would break the current delivery evidence. They are retained as active provenance, rather than moved into an archive that ordinary validators must not read. Their exact bytes were preserved.

## Consumer changes and restoration

`tools/sdd_lifecycle.py` confines active reads, distinguishes current hash verification from archival attestations, rejects identity drift and path collisions, and provides no archive-read fallback. SDD tests verify seven active originals and bodies physically; retired node, review-record, asset and coverage identities are checked against frozen metadata. The completion report labels historical counts and C18 page review accordingly. An extraction guard rejects regeneration when the historical inventory contains originals no longer present, preventing a silent rewrite of nine originals/eight bodies into seven/seven.

Ordinary discovery excludes `archive/` through `.ignore`; Git exports exclude it through `.gitattributes`. Archived payload retains exact bytes and is excluded from text normalization, diff and merge drivers. Current reporting, central-reference validation and local help are checked with an archive-read trap. Preservation verification is a separate, owner-authorized C20 operation restricted to the newly moved paths.

Restoration requires a later explicit request naming the needed archived material. Verify the manifest's size and SHA-256, preserve any current redirect, and restore the original bytes at the recorded path before deliberately updating consumers. Do not automatically restore archived material, silently overwrite active files, or use it as ordinary search context.

## Scope and remaining work

Validation passed **83 relevant tests, zero failures and zero skips**: SDD extraction/review/lifecycle (27), reporting (8), central reference (4), reviewed-source bindings (10), and local help (34). The archive-read trap passed. All 52 moved files match both the active manifest and their prior Git originals; 33 historical completion measures retain the same numerators and denominators. Independent review separately checks the retained active evidence and final staged bytes.

Archival changes do not alter functionality, the reviewed central PDF, help implementation or the 723-case evaluation. The historical 39 search misses remain open; the central reference did not resolve them. JAWS/current display owner acceptance stays closed, and deployed behavior with correlated timing stays frozen at 0/34. No database queries, new PDF rendering, full retrieval evaluation or OneDrive upload verification were required or performed for this archival change. The [C20 checkpoint](continuation20-20261001.json) records validation and delivery evidence.
