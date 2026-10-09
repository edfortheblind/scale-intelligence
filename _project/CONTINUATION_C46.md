# C46 guide previews and retained Receiving binding search

October 9, 2026. The owner requested "continue with what we can advance" from C45 commit `b7fc14312eb3780299879929afa4d4c268707852`.

Outcome: DONE_WITH_CONCERNS

Delivery state: The bounded correction and retained-source findings are complete; commit and remote parity are verified separately at publication.

Product state: Guide results identify shortened previews and keep full-section navigation. Retrieval remains **677/723** article matches and **15/24** exact guide anchors. Receiving bindings remain **24/30** matched. These changes do not close the remaining knowledge or acceptance work.

Authority state: The continuation advances local help presentation and retained-source analysis. C45 owner closures, six mobile deferrals and frozen **0/34 deployment/timing** remain in force. No live SCALE inspection, database connection, warehouse action, source recapture or new accessibility/runtime acceptance occurred.

## Concrete preview concern resolved

Ordinary guide search returned the first 360 characters without identifying the result as an excerpt. The retained Over Pick probe displayed an instruction-quantity rule but omitted the later on-hand versus pick-quantity source conflict. Other snippets ended at "Skip," or split the word "enabled", hiding qualifications later in the same section. See [Over Pick](../SDD/RF/WAREHOUSE_MOBILE_WORK_FLOWS.md#over-pick-and-in-transit-quantities), [Partial pick](../SDD/RF/WAREHOUSE_MOBILE_WORK_FLOWS.md#partial-pick) and [Nest During Check In](../SDD/RF/WAREHOUSE_MOBILE_INVENTORY_RECEIVING_FLOWS.md#nest-during-check-in-and-receive-a-nested-parent).

Ordinary snippets now say **Section preview:**. When cut, the displayed text removes a potentially split final word and ends with an ellipsis. The introduction directs readers to the existing section-title link for the full procedure, parent context and source limits. Exact SRC results retain their entire catalog qualification. A preview can still omit necessary context; it is not a complete answer or procedure.

The API retains existing text, identity, order, provenance and scope fields and adds `text_truncated`. There is no ranking, guide/source, route, dependency, persistent-state or JavaScript change. The nine parent-anchor misses remain nine misses; navigation earns no retrieval or semantic-answer credit.

## Verification

- The three real-case regression subcases failed before implementation. **23 focused guide tests passed** after correction. The integrated **102-test** run passed with zero failures/skips.
- **223 loopback HTTP queries** preserve every existing response field and result order after excluding only additive `text_truncated`: 24 frozen guide probes, 154 distinct section-title queries and 45 exact SRC identifiers. Metadata correctly identifies 743 truncated and 370 untruncated result occurrences. These are overlapping query/occurrence counts, not independent acceptance samples.
- **212 full-page renderings** remain byte-identical: 106 guide/source/evidence/listing views without search context and 106 with it. Expected-guide retrieval stays **24/24**, first **23/24**; exact-anchor retrieval stays **15/24**, first **14/24**. [Verification receipt](guide-preview-verification-c46-20261009.json).
- Fresh served article evaluation is identical as a complete JSON object to the retained evaluation: **723/723 contracts**, **677/723 top-eight**, **433/723 first**, **46 misses**. The guide implementation is fingerprinted separately in this checkpoint because the article evaluator's existing implementation hash does not include the guide modules.
- In Brave, keyboard activation of the Over Pick result focused its exact heading and exposed the full source conflict. Return navigation restored the query with `results-heading` focus. At a **320 x 720** viewport, client and scroll widths were both **305 px** and preview text/focus remained readable. The viewport was reset, task tab closed, and identified preview PID **31644**, port **52893**, stopped and verified absent. This is bounded browser evidence, not JAWS or intended-user acceptance.
- Guide-manifest validation and whitespace checks passed. Independent review is recorded in the [checkpoint](continuation46-20261009.json). Historical receipts, source exports, evaluation inputs and unrelated `Video Rec/` remain untouched.

## Receiving binding follow-up

The bounded exact-name search of active retained SDK, AIM, Snapdragon and database text resolved **0/6** unmatched Form names. This advances the evidence disposition, not the match count or runtime mapping. [Evidence, fingerprints and search limits](receiving-binding-search-c46-20261009.json).

`ReceiptDetail` has three distinguishable contexts:

- The SDK attachment [ReceivingDownload.xsd](../SDK/source/downloads/c55be2095d27d79c830e9c7e1ee25cadc59d8a45261cb777c5db03ca07360332.xsd) defines an XML complex type. The retained [receipt-download interface](../SDK/reading/086f0362ee27d395b17215ee67a8f3beaaee220d9b6cf4ed3a7742052d7025b3.md) requires that schema for `xmlData`. This is an interface message definition, with no proven link to Form 3035's `UI_RCPTDTL` binding.
- AIM's retained interface-validation guidance uses `//ReceiptDetail//ItemClass//ItemClass` as an XML-path example. This also supplies no Form mapping.
- Captured `wm_RUReceiptHeader01`, `02` and `03` routines use `RECEIPT_DETAIL ReceiptDetail` as a query-local table alias. An alias is not a catalog object or application-model definition.

The other five names supplied no resolving definition in the searched retained text. Form 2780's `METADATA_RECEIPT_INSIGHT_VIEW` remains distinct from its grid's matched `METADATA_INSIGHT_RECEIPT_LINE_VIEW`; the captured grid reference does not establish binding precedence. Do not substitute a same-spelling XML type or SQL alias to close OI-01.

## Continuation

Use [OPEN_ISSUES.md](../OPEN_ISSUES.md) for pending decisions. The two concerns examined here are now either corrected or recorded with their evidence limits. Do not repeat the same retained-name search without new inputs. OI-01 still needs an authoritative installed model/object mapping or owner disposition; OI-07 still needs a named priority/acceptance decision before section-ranking work. The 46 article misses require distinct source/intent evidence or a justified design. Closed work, mobile deferrals and the deployment/timing freeze remain unchanged.

Git parity is separate from OneDrive upload, deployment and user acceptance.
