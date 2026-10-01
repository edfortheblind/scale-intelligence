# SDD extraction coverage and fidelity

All nine original filenames, byte lengths and SHA-256 values are recorded in [inventory.json](inventory.json). Eight unique bodies are extracted; the LAND duplicate points to the canonical content record. Originals are preserved. Content IDs combine the source hash and structural/page/slide location, so IDs are valid only for that exact source generation.

## Extracted coverage

| Source | Nodes | Tables or candidate grids | Assets | Page or slide extent |
| --- | ---: | ---: | ---: | --- |
| [Manhattan SCALE - Labels.pptx](reading/sdd-56008a31665dcc23.md) | 209 | 0 | 43 | 45 slides |
| [SCALE Work and Picking Functionality.docx](reading/sdd-61bfda888fe30365.md) | 995 | 1 | 13 | DOCX body plus ancillary parts |
| [LAND MAWM Solution Design Document v2.11.docx](reading/sdd-de62bfaf88f5d35b.md) | 4605 | 280 | 37 | DOCX body plus ancillary parts |
| [SCALE Configuration Walkthrough - HADDAD.docx](reading/sdd-f46806ef53e15f07.md) | 758 | 2 | 220 | DOCX body plus ancillary parts |
| [MA Documentation - Insight Architect Configuration.pdf](reading/sdd-d4675a92502c23f4.md) | 20 | 0 | 0 | 2 PDF pages |
| [J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final).pdf](reading/sdd-1c25f20de1eafc3e.md) | 1608 | 172 | 90 | 119 PDF pages |
| [Covetrus - Manhattan Active SCALE Implementation Solution Design Document v1.4  2023-08-31 (Final)(2).docx](reading/sdd-c4c7e01f8ccad48a.md) | 2450 | 25 | 137 | DOCX body plus ancillary parts |
| [Grupo Julio - Manhattan Active SCALE Implementation Solution Design Document - v1.5 - Final - 2024-09-03.pdf](reading/sdd-d50ca4a96095c930.md) | 973 | 47 | 74 | 110 PDF pages |

Table counts mix exact OOXML table containers with heuristic PDF candidates. PDF page borders produce false positives, so these counts are not verified logical-table coverage. PDF textless-page check found no page without extractable text. An independent pypdf reader agreed on all three PDF page counts, but that is not an independent layout or semantic audit.

## Fidelity limits

- JSON retains ordered source text and tables with source locators. DOCX cells retain horizontal grid span and vertical merge markers. Nested or content-control structures may be flattened into an enclosing node.
- DOCX visible text includes cached fields, textboxes and both alternative OOXML fallback branches; duplicate cover text can result. Numbering and field calculations are not rebuilt. Tracked insertions and deletions are preserved together, never silently accepted.
- DOCX headers, footers, comments and note parts are separate ancillary records. They are not all body instructions or accepted decisions. Embedded non-image files and SmartArt semantics have not been extracted.
- PDF pages are one-based physical pages, with text block bounding boxes. Table candidates remain heuristic. Raster text and vector diagrams require page inspection; no OCR completeness is claimed.
- PPTX slide order follows presentation relationships; shape and note text is retained. Later native PowerPoint 16.0 export and visual review covered all 45 static slides at the original 4:3 ratio. XML shape order, animations, notes completeness and exact font/substitution fidelity remain unverified. Master/layout text is not separately transcribed.
- Media assets preserve source bytes for OOXML and extracted PDF image streams, with hashes. Current descriptions and their exact asset identities are maintained in [review coverage](REVIEW_COVERAGE.md). Asset descriptions and full-page/slide inspections have separate denominators. Extraction-time asset flags remain UNREVIEWED_VISUAL; later evidence belongs to the overlay.
- PDF visual checks cover 231/231 pages. Exact page lists appear in [review-coverage.json](review-coverage.json). All 219 detected table candidates have dispositions: 93 support reviewed logical tables and 126 are rejected layout/fragment artifacts. The reviewed table register also contains three Grupo Julio page-8 raster tables, whose image hashes bind their authority separately from the text anchor. Undetected/raster table completeness remains unknown; candidate closure does not establish an exhaustive logical-table denominator.
- No bundled workspace dependency loader or LibreOffice/Poppler renderer was available. Native Word export did not finish and produced no PDF; full DOCX page fidelity remains unverified. Five selected EMF assets were rendered with local Windows GDI+ and inspected independently. PyMuPDF rendered selected PDF pages privately.

## Source-specific exceptions

### Manhattan SCALE - Labels.pptx

- Slide shape order is XML order, not a verified visual or assistive-technology reading order.
- All 45 static slide layouts were later rendered and inspected. Animations, exact fonts, notes completeness and master/layout text transcription remain unverified. Source code screenshots on several slides are clipped; embedded SQL/ZPL examples are not executable validation evidence.
- Images preserved by exact bytes; embedded objects, SmartArt relationships and image text require separate visual review.

### SCALE Work and Picking Functionality.docx

- DOCX page layout not rendered; cite XML body nodes and headings, not pages.
- Numbering/field instructions and layout are not reconstructed; cached visible text is retained.
- Nodes with tracked editing markup: 0; source_text_state, revision_runs and deleted_text_fragments preserve unresolved revisions. Do not use their merged text as an accepted claim.
- Images preserved by exact bytes; embedded objects, SmartArt relationships and image text require separate visual review.

### LAND MAWM Solution Design Document v2.11.docx

- DOCX page layout not rendered; cite XML body nodes and headings, not pages.
- Numbering/field instructions and layout are not reconstructed; cached visible text is retained.
- Nodes with tracked editing markup: 0; source_text_state, revision_runs and deleted_text_fragments preserve unresolved revisions. Do not use their merged text as an accepted claim.
- Images preserved by exact bytes; embedded objects, SmartArt relationships and image text require separate visual review.

### SCALE Configuration Walkthrough - HADDAD.docx

- DOCX page layout not rendered; cite XML body nodes and headings, not pages.
- Numbering/field instructions and layout are not reconstructed; cached visible text is retained.
- Nodes with tracked editing markup: 0; source_text_state, revision_runs and deleted_text_fragments preserve unresolved revisions. Do not use their merged text as an accepted claim.
- Images preserved by exact bytes; embedded objects, SmartArt relationships and image text require separate visual review.

### MA Documentation - Insight Architect Configuration.pdf

- PDF text uses positional blocks; reading order and table cells require visual confirmation.
- Table detection is heuristic; candidate grids are not fidelity-certified.
- Vector diagrams and text inside raster images are not OCR-transcribed; inspect cited page renders.

### J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final).pdf

- PDF text uses positional blocks; reading order and table cells require visual confirmation.
- Table detection is heuristic; candidate grids are not fidelity-certified.
- Vector diagrams and text inside raster images are not OCR-transcribed; inspect cited page renders.

### Covetrus - Manhattan Active SCALE Implementation Solution Design Document v1.4  2023-08-31 (Final)(2).docx

- DOCX page layout not rendered; cite XML body nodes and headings, not pages.
- Numbering/field instructions and layout are not reconstructed; cached visible text is retained.
- Nodes with tracked editing markup: 0; source_text_state, revision_runs and deleted_text_fragments preserve unresolved revisions. Do not use their merged text as an accepted claim.
- Images preserved by exact bytes; embedded objects, SmartArt relationships and image text require separate visual review.

### Grupo Julio - Manhattan Active SCALE Implementation Solution Design Document - v1.5 - Final - 2024-09-03.pdf

- PDF text uses positional blocks; reading order and table cells require visual confirmation.
- Table detection is heuristic; candidate grids are not fidelity-certified.
- Vector diagrams and text inside raster images are not OCR-transcribed; inspect cited page renders.

## Review and use boundary

[Reviewed knowledge](reviewed-knowledge.json), [reviewed tables](reviewed-tables.json) and [review coverage](review-coverage.json) retain the current reviewed records, exact evidence and remaining denominators. Source bodies outside those evidence spans remain semantically unreviewed. Neither extraction nor the tests establish active configuration, complete SCALE behavior, application retrieval, screen-reader acceptance or an Insight SOP. Retained document JSON contains extraction-time exceptions; the review overlays record later visual evidence without changing source text.

The source material remains private, including named implementation examples and source notices. Production indexing and broader sharing require a separate suitability/audience decision. No search database was changed.

## Reproduction

Use Python 3 with PyMuPDF (this extraction used 1.28.2). The OOXML paths use only the standard library. One isolated PowerShell reproduction path is:

```powershell
$sddEnv = Join-Path $env:TEMP 'scale-sdd-extract-env'
python -m venv $sddEnv
& "$sddEnv/Scripts/python.exe" -m pip install 'PyMuPDF==1.28.2'
& "$sddEnv/Scripts/python.exe" tools/extract_sdd.py
& "$sddEnv/Scripts/python.exe" -m unittest tests.test_sdd_extraction tests.test_sdd_review
```

This does not require the author's private task path. The page-count cross-check separately used pypdf 6.19.0. Authored review files are retained during extraction. Re-extraction does not change original files or delete stale content. To change source generations, review and reconcile authored citations explicitly.
