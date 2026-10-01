# C21 search repair and remaining concerns

C21 improves four ambiguous questions by requesting their missing subject. It does **not** resolve the 39 raw expected-topic misses. All 723 authored questions and expected IDs, indexed content, ranking rules, answer text and source bindings are unchanged. The implementation only extends the existing clarification step before search.

Fresh local HTTP evaluation: **684/723 top-eight (94.61%), 417/723 first (57.68%), 39 misses, 723/723 selected-topic contracts**. Relative to the frozen C20 baseline, **719 result lists are identical**, with zero recoveries, zero new losses and zero first-place demotions. [Exact comparison and remaining cases](retrieval-change-continuation21.json).

## Delivered behavior

| Existing case | Missing context now requested |
| --- | --- |
| `inventory-adjustment:2` — Does an error guarantee all earlier changes are rolled back? | Operation or routine whose transaction behavior is meant. |
| `awr-capacity-precedence:1` — Does no row return 0 and100 automatically? | Operation or routine defining the missing-row result. |
| `shipping-qc-context:3` — Are these settings confirmed for the current warehouse? | Setting or field name and screen. Current warehouse alone does not identify it. |
| `fn-available-quantity:1` — Are all no-match outputs0? | Operation or routine defining the outputs. |

These four were already misses. The three previous missing-referent clarifications remain; seven of the 19 recorded missing-referent cases now automatically request context. The other 12 still need a better subject/intent distinction. Numeric suffixes do not become invented subjects, while identifiers such as SKU12 and SCI23 remain searchable.

Independent review caught an initial collision between generic result vocabulary and the named Returns process, including demonstrative queries such as “this Returns error.” The final design preserves the earlier explicit-reference rule and applies the broader result rule separately, exempting canonical named processes. Named Work, Returns, Packing, identifiers and the literal WAREHOUSE field retain search behavior. All 12 independent boundary challenges pass. The regression evidence also executes the immutable baseline: the new generic-error and current-warehouse tests fail their intended clarification requirement before the change and pass afterward.

## Evaluated changes not integrated

Each ranking trial used the same 723 cases. Aggregate improvement alone was insufficient; individual losses and changed answers were inspected. No trial changed public ranking or added question-to-topic rules.

| General ranking experiment | Top-eight | First | Recovered / newly lost | Disposition |
| --- | ---: | ---: | ---: | --- |
| Passage body weights 4/4/2 | 680 | 424 | 7 / 11 | Rejected: new losses. |
| Partial term-coverage factor | 683 | 433 | 5 / 6 | Rejected: new losses. |
| Ten-percent second-passage support | 683 | 421 | 0 / 1 | Rejected: no recovery and a loss. |
| Full-query coverage in one passage before partial matches | 681 | 430 | 0 / 3 | Rejected: no recovery and three losses. |

Two source-supported prose candidates were tested using normal index construction. An inventory reservation clarification caused one top-eight loss and recovered none (683/417); a shipment fallback clarification recovered none (684/417, three changed result lists). Neither was integrated. A fixed-row diagnostic was kept separate because normal construction changes passage deduplication; its results are not production validation.

The seven specific-subject cases retain full-list expected-topic ranks of 27, 16, 10, 12, 11, 13 and 28 respectively, in their existing report order. Source review found six precise distinctions absent from returned answers and one existing useful alternative for receipt selection versus upload delivery. That alternative does not recover its designated topic. No new source resolution is claimed. The [historical case report](SEARCH_MISSES_AND_NEXT_STEPS.md) preserves questions and owner-note fields; C21's receipt supplies current returned lists.

## Verification and limits

A fresh independent reviewer authored 12 source-grounded probes before seeing the baseline evaluation or candidate. They concern selected affected and neighboring subjects, not a random holdout. Baseline and final actual HTTP results both returned **11/12 expected topics in the first eight and 7 first**. All 12 result lists, designated answers and first answers were unchanged. The serial-row/overcount probe still misses its designated topic; selected-topic availability does not establish successful discovery.

All [23 in-scope known scenarios](help-question-continuation21.json) retained their selected answer or clarification and evidence. This is preservation, with **zero new semantic acceptance credit**; QS-18 remains excluded, not passed. The [checkpoint](continuation21-20261001.json) records command results, exact evidence fingerprints and the final audit. Selected-topic presentation, retrieval, semantic usefulness and owner acceptance remain distinct.

No source text, question expectations, reference/PDF, original source, archive payload or authority prompt 01/02 was changed. Source purity and active-source hashes were independently checked. No archive payload, warehouse connection, database query, PDF render or collection retry occurred. C20 lifecycle metadata remains authoritative for retired artifacts. Closed collection/display/JAWS acceptance and the final deployment/timing freeze at **0/34** remain unchanged.

**Delivery:** this bounded clarification repair and experiment record are ready for normal private publication after final audit. Commit and local/origin/live parity are verified separately. **Product:** search repair and the knowledge foundation remain incomplete. **Gate authority:** existing owner acceptance and freeze remain controlling; C21 does not close the remaining search work.

Next work requires source/intent evidence for unresolved cases or a distinct, justified retrieval design. Do not repeat these rejected tuning families, infer an unstated subject, import evaluation text into search or rewrite a question to report a recovered miss.
