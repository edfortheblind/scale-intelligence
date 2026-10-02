# C29 matching search detail and inbound QC guidance

Outcome: DONE_WITH_CONCERNS

Delivery state: The bounded help changes, source integration and verification are complete. Independent review and normal private publication are recorded separately before delivery.

Product state: Search cards expose their existing matched source passage on demand. Inbound QC guidance now explains sample quantities, rounding and the receipt-once limitation. The 48 article search misses remain unresolved.

Gate/authority state: No new acceptance, configuration change or warehouse operation. Acquisition/display/JAWS acceptance stays closed; deployment and correlated timing remain frozen at 0/34. The six mobile source gaps remain owner-deferred.

## Search result detail

Search already returned a source-bound `matching_detail`, but the page displayed only the general article answer. Each applicable result now has a collapsed **Matching detail and source** disclosure with the exact passage, source name and source qualification. The primary explanation and article link remain first. Text is HTML-escaped; results without both a passage and source retain their existing presentation.

For example, the retained `ISNUMERIC` query finds the labor consolidation article. Its disclosure explains why the SQL numeric check does not guarantee integer conversion, unique inserted IDs or deterministic ordering of equal start times. This is captured-source behavior, not an installed configuration or current warehouse finding. No ranking logic, API contract, index entries, query aliases or expected answers were added.

Actual keyboard checks passed for opening and closing the disclosure with retained focus. A real long token in an existing matching passage initially overflowed at a 320 px viewport: document client/scroll widths were 305/559 px. Adding `overflow-wrap:anywhere` to the result list reduced that to 305/305 px without changing the passage. Desktop and narrow screenshots were inspected; no screenshot artifact was saved. This is bounded browser evidence, not a fresh JAWS session or full accessibility matrix.

## Inbound quality control

The existing Quality Control article now cites **Routing Items To Inbound Quality Control (RF & Non-RF)**, retained AIM article `c6089bfdf08efe3ac6a16c83b96391e741f356ccb5010f2fa89d32487f885eae`, nodes `n62`, `n77`, `n79`, `n81`, `n82`, `n84`, `n97` and `n103`.

- A percentage uses the total open receipt quantity for the item. Fixed quantities and computed percentages are converted to the lowest unit of measure; an omitted fixed-quantity unit is treated as the lowest unit.
- Rounding uses the unit second from the top of the storage-template hierarchy. It rounds down to a whole increment, but a sample below one increment remains in the base unit.
- The source's 20-each case example gives 30 eaches becoming 20, and 10 remaining 10. These are illustrations, not configuration defaults.
- The source says each receipt is checked once for eligible items. A short partial check-in does not cause later quantities on that receipt to be checked again; the next receipt containing the item is checked for the full inspection quantity.

The returns/damage article now links to this QC explanation. Existing check-in-created license-plate, inspection-status and source-diagram qualifications remain intact. The original article hash and all eight cited node texts were verified. The browser followed the related link, displayed the new guidance and expanded the exact source nodes successfully.

## Accepted article preservation

The standard integration exposed a stale owning-batch record for `packing-replacement-lp-context`. It would have restored older replacement-LPN wording and two superseded questions over the accepted canonical article. The batch was synchronized to the exact accepted canonical record from base commit `a6cb1dba48a216e758bc8e8854c80fdb2b710eeb`. The resulting canonical Packing topic is unchanged from that base; this is not a reopened extension review.

A regression now checks that contributing batch articles preserve the reviewed canonical articles during reintegration. All 340 topic identities, 856 ordered step records, evaluation records and 130 documentary refinements are preserved. The stale authored-case coverage counter was corrected from 717 to the actual 716 per-topic cases; adding the seven existing cross-topic cases still gives 723. No question was removed or rewritten.

## Verification and remaining work

- Two renderer regressions failed against the old renderer, then passed with the correction. The batch-preservation regression failed on the stale Packing record, then passed after its repair.
- `python -m unittest tests.test_help_guides tests.test_help_app tests.test_help_articles tests.test_retrieval tests.test_functional_knowledge tests.test_integrate_functional_batches tests.test_reviewed_sdd_source tests.test_scale_reference`: exit 0; **109 passed, 0 failed, 0 skipped**.
- `python tools/integrate_functional_batches.py` and `python tools/render_functional_docs.py`: exit 0; affected canonical sources and the existing help reading copy synchronized.
- `python tools/build_help_guides.py --check`: exit 0; seven guides, 87 cited sources and three evidence files remain current.
- `python tools/evaluate_help.py --serve --output .aekr/work/continuation29/article-evaluation-final.json`: exit 0; **723/723 selected-topic contracts, 675 top-eight matches, 419 first matches and 48 misses**. The canonical [evaluation](../help_app/evaluation.json) contains the fresh served results. Exact unchanged-case comparison is in the [C29 receipt](continuation29-20261002.json).
- `python tools/verify_db_docs.py`: exit 0; PASS, no errors; 1,493 source bindings, 69 cited vendor articles and 16,536 local links. This checked local evidence and performed no database query.
- The temporary loopback preview was stopped, its listener removed, its browser tab closed and the viewport override reset. The owner's PROD tab was untouched.

On the same 723 questions, 710 ordered article result lists and 709 complete search payloads are unchanged. Thirteen lists changed after the QC prose addition; one additional payload changed its selected matching detail without changing topic order. There are zero recovered misses, zero new misses and no first-place changes. One expected topic moved from rank 7 to 8 (`operations-container-pane:1`); that small regression remains explicit. All 24 guide search payloads are identical, preserving 24 top-six guide matches, 23 first, 15 exact anchors and 14 exact anchors first. These guide comparisons used the current local search engine, not a new served guide evaluation.

The older [section completion report](COMPLETION_REPORT.md) and its scenario acceptance remain historical C21 evidence; they were not rehashed to claim a fresh semantic review. Use this checkpoint and current evaluation for C29 results. The central reference/PDF, source originals, mobile catalog, guide content and acquisition receipts remain unchanged.

Continue only with another concrete source or usability concern supported by evidence. Do not repeat completed ranking experiments or rewrite expected questions. SRC230, SRC280, SRC340, SRC350, SRC360 and SRC400 remain deferred, not resolved or prerequisites for unrelated work. For any later configuration inspection, **always Cancel or X; never OK**. Preserve the frozen deployment/timing workstream and untracked `Video Rec/`.
