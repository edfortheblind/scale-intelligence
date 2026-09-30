# Help question research and answer-quality checks

The owner requested an agent-derived sample focused on configuration, work/container completion, Packing, and Work Insight versus Warehouse Mobile. The resulting 24 questions were frozen before app evaluation. This is a qualitative scenario sample from official workflow documentation, not measured chatbot popularity or a survey of real users.

The evaluator inherited project context. The questions were formulated without searching the app in that subtask, but this is not a fresh-context or statistical holdout. After the baseline findings were used to improve help, any later score measures known-scenario remediation. Questions remain outside the search index and separate from authored regression cases.

Microsoft, Oracle and Manhattan Active documentation inspired questions only. SCALE answers require retained SCALE sources; other products’ configuration rules are not transferred.

Baseline: **5/24 adequate (20.83%), 13 partial, 6 missing**. All 136 actual local HTTP requests succeeded. Adequacy includes complete returned topic content and expandable details; it is not a guarantee that the initial snippet is sufficient. No unsupported current-state diagnosis was observed in this bounded review.

| ID | Question |
| --- | --- |
| QS-01 | What is the difference between Work Insight and Warehouse Mobile, and where should I start when a task is stuck? |
| QS-02 | I can see the work in Work Insight, but it does not appear on my handheld. What should I check? |
| QS-03 | Why does a work unit still show open after I picked everything? |
| QS-04 | I cannot close this work unit. Which incomplete step or status should I look at first? |
| QS-05 | Can I cancel this stuck work, or will that leave inventory in the wrong place? |
| QS-06 | Where do I find the reason a pick failed, instead of just trying the same action again? |
| QS-07 | How do I configure which work a user can receive on Warehouse Mobile? |
| QS-08 | The location has fewer units than my work says to pick. What should I check before reporting a short pick? |
| QS-09 | What settings decide which putaway location SCALE recommends? |
| QS-10 | Why is this pallet going to an exception location when another location looks empty? |
| QS-11 | How do I set a different receiving process for damaged goods and returns? |
| QS-12 | Why is receiving asking for a lot or serial number for this item? |
| QS-13 | How do I stop users receiving more than the expected quantity? |
| QS-14 | How do I configure the packing station so workers get the right container choices? |
| QS-15 | I scanned the shipment at Packing, but no items appeared. What should I check? |
| QS-16 | What does Close Container actually do, and what happens to the container afterward? |
| QS-17 | I packed all the items, but the container will not close. How do I find what is missing? |
| QS-18 | Why does Packing reject a replacement LPN even though the item looks the same? |
| QS-19 | Can I move an item from one container to another after packing has started? |
| QS-20 | How do I configure whether packing happens on a workstation or on a mobile device? |
| QS-21 | What information should I give you when I report that a work unit or container cannot close? |
| QS-22 | Can you explain this setting in plain language and show where the explanation comes from? |
| QS-23 | How do I configure when labels print during packing, and what should I check if closing a container prints nothing? |
| QS-24 | How do I configure which items may share a container and which must stay separate? |

## Sources

- [Manhattan SCALE product overview](https://www.manh.com/solutions/supply-chain-management-software/manhattan-scale) — Manhattan Associates. Work visibility and mobile-oriented operations; no detailed Work Insight procedure.
- [Work with location directives](https://learn.microsoft.com/en-us/dynamics365/supply-chain/warehousing/create-location-directive) — Microsoft Learn. Pick/put steps, rule sequencing, location search and failure behavior.
- [View and manage the work exceptions log](https://learn.microsoft.com/en-us/dynamics365/supply-chain/warehousing/work-exceptions-log) — Microsoft Learn. Pick/pack exceptions, short picks and diagnostic logs.
- [Cancel warehouse work for exception handling](https://learn.microsoft.com/en-us/dynamics365/supply-chain/warehousing/cancel-warehouse-work) — Microsoft Learn. Blocked work, incomplete put operations and distinct cancellation paths.
- [Inbound Process](https://docs.oracle.com/cd/E26401_01/doc.122/e48828/T210618T210768.htm) — Oracle. Receipt routing, item controls, inspection and excess-receipt tolerance.
- [Pack containers for shipment](https://learn.microsoft.com/en-us/dynamics365/supply-chain/warehousing/packing-containers) — Microsoft Learn. Packing setup, closing/release choices and completion information.
- [Example scenario: Pack containers with the Warehouse Management mobile app](https://learn.microsoft.com/en-us/dynamics365/supply-chain/warehousing/warehouse-app-pack-containers-scenario) — Microsoft Learn. Worker setup, packing menus, station context and container steps.
- [Packing](https://docs.oracle.com/en/cloud/saas/warehouse-management/26a/owmol/packing.html) — Oracle. LPN substitution examples involving inventory attributes.
- [Packing Workbench implementation considerations](https://docs.oracle.com/cd/E26401_01/doc.122/e48828/T210618T210726.htm) — Oracle. Station requirements, pack/unpack and closing/printing.
- [Manhattan Active base agents](https://www.manh.com/en-sg/our-solutions/manhattan-active-platform/ready-to-deploy-ai-agents) — Manhattan Associates. Explanation with citations and contextual associate guidance.

[Frozen questions and method](help-question-research.json) · [Baseline judgments and bindings](help-question-baseline.json).

No browser, screen-reader, representative-user or live warehouse acceptance is inferred from these checks.

## Prior follow-up

**18/24 adequate (75%), 5 partial, 1 missing.** The adequate outcomes comprise **17 substantive content answers and one appropriate clarification (QS-22)**. The unspecified-setting question now asks for the setting name, screen and intended outcome; it does not yet return a named-setting explanation or citation. The baseline remains 5/24 adequate, 13 partial and 6 missing.

The same 24 frozen questions were sent unchanged through actual loopback HTTP. All **137/137 requests returned HTTP 200**: 24 searches, 99 distinct topic answers, 12 cited source-detail responses and two status reads. The local server was stopped. The compact [frozen follow-up judgments and source bindings](help-question-followup.json) contain each returned top eight, selected evidence and the exact missing subquestion; complete response snapshots remain private.

Fourteen cases improved to adequate and **QS-10 regressed from adequate to partial**. Its baseline returned the locating-process topic at rank six; the follow-up top eight omit the ordered locating evaluation and Process History guidance. Capacity and movement restrictions alone do not provide that decision-history triage.

| Case | Baseline | Follow-up |
| --- | --- | --- |
| QS-01 | Partial | Adequate |
| QS-02 | Adequate | Adequate |
| QS-03 | Partial | Adequate |
| QS-04 | Partial | Adequate |
| QS-05 | Partial | Partial |
| QS-06 | Missing | Adequate |
| QS-07 | Partial | Adequate |
| QS-08 | Partial | Adequate |
| QS-09 | Adequate | Adequate |
| QS-10 | Adequate | Partial (regression) |
| QS-11 | Partial | Adequate |
| QS-12 | Partial | Partial |
| QS-13 | Missing | Adequate |
| QS-14 | Partial | Partial |
| QS-15 | Partial | Adequate |
| QS-16 | Adequate | Adequate |
| QS-17 | Adequate | Adequate |
| QS-18 | Missing | Missing |
| QS-19 | Partial | Partial |
| QS-20 | Missing | Adequate |
| QS-21 | Partial | Adequate |
| QS-22 | Missing | Adequate (clarification only) |
| QS-23 | Partial | Adequate |
| QS-24 | Missing | Adequate |

The remaining content or retrieval gaps are:

- **QS-05 (partial):** How to identify the applicable authorized cancellation path and reconcile physical movement already completed before deciding whether this particular work may be cancelled.
- **QS-10 (partial):** How to inspect the effective ordered locating rule, rejected candidates and Process History decision that led this pallet to an exception location. The relevant process-locating answer returned in the baseline is absent from this top eight.
- **QS-12 (partial):** Which item tracking or receiving-check-in template/preference field triggers this particular lot or serial prompt, and the corresponding screen-specific check. Packing or mobile-pick rules cannot establish that receiving trigger.
- **QS-14 (partial):** How to configure the actual eligible container-type choices for the packing station/user, including company/warehouse authorization and the distinction from wave Container Group selection. The returned preference answer does not establish those choices.
- **QS-18 (missing):** The Packing-specific replacement-LPN action, validation constraints and required error/context checks. A separately authored Override Pick topic is outside this top eight and would not by itself prove Packing behavior.
- **QS-19 (partial):** Whether this source/destination container pair permits an authorized item move or repack after packing starts, including open/closed state, quantity and application-action constraints.

Adequacy uses complete returned topics and expandable details, with useful bounded checks for questions requiring current state. No unsupported current-state diagnosis was observed. Several adequate cases still require lower-ranked answers or multiple expansions; this result does not establish the quality of the first snippet, an installed configuration procedure or accessible screen navigation.

This is **known-scenario remediation**: baseline findings informed the new content. It is not an untouched holdout, measured popularity, a real-user survey or real-user acceptance. No browser, keyboard, screen-reader or live warehouse workflow was tested. The evaluator inherited project context; a fresh-context audit remained unavailable. The owner's current-replica attestation does not establish unseen operational states or erase source-specific limits.

Frozen follow-up SHA256: `11448f16ef7ca4420c6bc8d64d792bb04a0e86746504683575ea4c1f2838d79c`.

Binding scope: the follow-up's `frozen_question_file_sha256` identifies the retained private questionnaire file. Its `frozen_questions_sha256` identifies the canonical 24-question set and matches `canonical_question_sha256` in the public [research artifact](help-question-research.json); the compact public file has a separate whole-file hash.

## Continuation 3 independent follow-up

**23/24 adequate (95.83%), one partial, none missing.** The adequate outcomes comprise **22 substantive bounded answers and one appropriate unspecified-setting clarification**. The same 24 questions remain unchanged and outside search. A fresh-context reviewer assessed only the returned top eight after known-scenario repairs; this is independent review of a known sample, not an untouched holdout or real-user acceptance.

The final capture made **152/152 successful HTTP requests**: 24 searches, 99 distinct topic answers, 27 cited operator-source responses and two status reads. The server stopped after capture. [Exact judgments and source bindings](help-question-continuation3.json) preserve the returned topic identities, evidence, limitations and comparison.

Five previously partial cases (QS-05, QS-10, QS-12, QS-14 and QS-19) now meet the original bounded-triage rubric. QS-18 improved from missing to partial: the answer identifies Packing error/context checks and distinguishes Override Pick, but the actual Packing replacement-LPN action and validation contract remain unsupported. Closed-source unpack/reopen eligibility and actual physical/configuration state are not inferred.

The reviewer found blank source excerpts for nested cited nodes. The source loader now includes the complete cited subtree, retaining its original identity and readable block boundaries. The regression test failed before the repair and passed afterward; the final review binds the repaired implementation and recaptured responses.

No browser, keyboard, screen-reader, installed workflow or representative-user acceptance is claimed. The prior baseline and follow-up JSON receipts remain byte-identical historical evidence.

## Continuation 4

The [current independent review](help-question-continuation4.json) retains 23/24 adequate (95.83%), one partial and zero missing. Twenty-two cases reuse exactly unchanged semantic results; two cases with changed incidental returned answers were manually rechecked. Top-eight topic ranks are identical for all 24 known questions. The current snapshot contains 152 successful actual HTTP requests. The Packing-specific replacement-LPN contract remains absent from retained evidence and cannot be inferred from Override Pick or item substitution.

Five source-bound summary additions improve the separate authored retrieval set to 686/725 (94.62%), four recoveries and zero regressions from the prior 725 cases. The original questions, expected results and ranking algorithm remain unchanged and questions remain outside search. See [exact retrieval comparison](retrieval-change-continuation4.json).

## Continuation 5

Owner clarification directs documentation of AIM base Warehouse Mobile Close Container and Insight Packing, while distinguishing a possible DB extension. One existing topic now describes those workflows and their source-specific conditions, plus the documented scale interface exit point. That hook does not prove an installed extension or an inventory-LPN replacement rule.

The [current independent review](help-question-continuation5.json) retains 23/24 adequate, one partial and zero missing on the frozen known questions. The current snapshot has 152 successful HTTP requests; changed results receive manual review and exact-result reuse is identified explicitly in that receipt. QS-18 remains partial because its replacement-action contract is still absent. The separate 725 authored cases remain 686 top-eight, with zero new misses or recoveries from continuation 4. See [the current retrieval comparison](retrieval-change-continuation5.json). Original questions, expected results and ranking implementation remain unchanged.

## Continuation 7

A focused source review examined 16 previously identified retrieval cases across 14 topics. Thirteen needed no content edit; three existing short answers received 83 additional words explaining work-profile detail selection, independently aggregated work-order summary values, and the distinction between receipt batch marking and external delivery. Source contracts, frozen questions, expected results and ranking implementation remain unchanged.

Fresh actual HTTP evaluation passes all 725 selected-topic checks and retains 686 top-eight matches, 419 first-place matches and 39 misses. There is no new expected-topic miss or recovery from the preceding 725-case evaluation. Eight returned-topic lists or orders changed while expected-topic ranks remained unchanged. These additions address explanation clarity; no ranking gain is claimed. See [the current retrieval comparison](retrieval-change-continuation7.json).

The [current independent scenario review](help-question-continuation7.json) retains **23/24 adequate (95.83%), one partial and zero missing**, including 22 substantive bounded answers and one appropriate ambiguity clarification. All **152/152 current HTTP requests succeeded**. The review binds all 24 unchanged questions to those responses and records 14 complete-payload reuses, six metadata-only revalidations and four rank/content reviews. This remains known-scenario remediation, without real-user or assistive-technology acceptance. The fresh full test suite passed 368 tests with zero failures or skips; exact checks are recorded in the [current verification receipt](continuation7-20260930.json).

The owner-requested AIM base Mobile Close Container and Insight Packing explanation remains intact. QS-18's replacement-LPN action and validation contract still need applicable source evidence; a documented desktop scale-interface hook does not establish an installed DB extension.

## Continuation 9 current HTTP and unchanged answers

Fresh HTTP capture returned 152/152 successful responses. All24 complete search, answer and cited-source payloads match C7; the current renderer identity is revalidated separately. The [independent C9 receipt](help-question-continuation9.json) preserves 23 adequate and 1 partial with exact-payload reuse, not a new semantic or user-acceptance score. Requested AIM base Packing is complete; the historical replacement-LPN subquestion remains unsupported.

The [39-case retrieval diagnosis](retrieval-diagnosis-continuation9.json) preserves every miss and rejects four regressing ranking alternatives. A persistent subject-naming hint is associated with the search input; ranking, questions and expected topics are unchanged. No browser or screen-reader acceptance is claimed.

## Continuation 14 owner-scoped SCALE base help

The owner directed the help section to cover SCALE base behavior and excluded the installed replacement-LPN extension from that scope. The Packing/mobile Close Container topic now retains seven AIM base steps. The two extension-oriented authored questions were replaced with two base questions; the other 723 authored questions are unchanged. Fresh HTTP checks pass 725/725 selected-topic contracts, with 686 top-eight, 420 first and 39 misses. The unchanged 723-question subset retains 684 top-eight and 418 first-place results, with no recovered or lost top-eight case. [Exact comparison](retrieval-change-continuation14.json).

The original 24-question known set remains frozen as historical evidence: 23 adequate and one partial QS-18. QS-18 is now outside SCALE base-help completion and is **excluded, not passed or repaired**. Fresh HTTP search preserved selected evidence for all 23 in-scope questions; the current base denominator is 23/23 adequate. This is a scope change and bounded evidence reuse, not a new independent user review. [Current scenario receipt](help-question-continuation14.json) and [owner decision](owner-scope-continuation14.json).
