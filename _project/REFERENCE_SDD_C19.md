# Central SCALE functionality reference

The active SDD is [SCALE Functionality Reference SDD](../SDD/SCALE_FUNCTIONAL_REFERENCE.md). It contains **86 entries in 14 chapters**, synthesized from **181 selected reviewed records across seven SCALE sources**. The [printable PDF](../output/pdf/SCALE%20Functionality%20Reference%20SDD.pdf) is the same reference in a second format, not a separate design. The [source-binding register](../SDD/derived/scale-functional-reference.json) retains exact original hashes, extraction hashes, retained nodes and contributing record identities.

Implementation documents supply functional context. Their selected values, proposed extensions and local operating arrangements do not establish universal defaults or a current deployment. Neutral source codes replace client names. Material belonging to another product is excluded entirely from the new reference and its active help bindings. Original sources and historical receipts remain unchanged.

The chapters cover applicability, master data, receiving, putaway and replenishment, inventory and counting, outbound orders and waves, allocation, work management, picking, packing and shipping, interfaces, documents and labels, administration and Insight configuration, and labor visibility. Local limits retain release qualifications, within-source disagreements, prerequisites and evidence gaps.

## Review and verification

Three author packets were checked by a separate reviewer against the retained source records and selected raw passages. One inventory-status sentence was corrected to preserve the source's restrictive logic without implying that either condition independently permits mixed statuses. Final content review passed all 86 entries. This is bounded source review, not full product or deployment acceptance.

All **41/41 PDF pages** were rendered and visually inspected. The review found no clipping, overlap, illegible text or client/product leakage. Whole-entry pagination intentionally leaves space on some chapter-ending pages. All 14 contents links point to the corresponding chapter starts; all 86 entry titles are present. Text and metadata checks passed. The PDF is untagged; accessible-PDF certification is not claimed. The Markdown is available as a structured text counterpart.

The renderer verifies original/extraction hashes, contributing record hashes, allowed sources and exact node bindings before generating output. Negative tests reject a client name, an excluded source and an unreviewed citation. Regeneration uses `python tools/render_scale_reference.py --pdf` with ReportLab and Windows Arial fonts; a non-authoring consistency check uses `python tools/render_scale_reference.py --check`.

## Scope and continuation

The 181 selected records are a synthesis denominator, not a claim that all 661 retained SCALE claim/setting records were newly reviewed or that unselected records are duplicates. Historical collection counts remain separate. The reference does not establish installed settings, current permissions, printer support, verified screen navigation or elapsed process timing.

The subsequent local help task now uses neutral sections of this reference in four existing boundary topics. The [C19 concern dispositions](CONCERNS_C19.md) and [retrieval comparison](retrieval-change-continuation19.json) report that completed task separately from SDD completion. The historical 39 search misses are not resolved merely by creating or reviewing this document.
