# C27 mobile workflow evidence and procedure context

Outcome: NEEDS_CONTEXT

Delivery state: This checkpoint records the continuation from C26. Normal private publication and exact Git parity are verified separately after the final content checks.

Product state: Child guide sections provide links to their parent procedure context. The six incomplete or ambiguous mobile workflows remain incomplete: the additional retained evidence reviewed in this continuation does not supply their missing contracts.

Gate/authority state: Documentation and local help work, plus one read-only attempt to reach the documented source viewer. Activity Architect denied access before displaying any flow. Existing acquisition/display/JAWS acceptance and the deployment/correlated-timing freeze at 0/34 remain unchanged. No warehouse operation, configuration edit, permission change, new database connection, acquisition retry or warehouse acceptance occurred. Untracked Video Rec is preserved.

## Concern and correction

A direct SRC or search link can land at a child procedure below shared prerequisites and conditions. For example, SRC440 opens Trailer ID-License Plate below the Receiving introduction, which explains preference selection, authorization and execution-method dependence. Parent titles in search results previously described the hierarchy but did not provide a direct route back to that context from the landing heading.

Child headings now provide descriptive links to their actual parent headings. These links come from the existing document hierarchy and target the existing focusable sections. They preserve the specific branch while making its broader procedure available immediately. Source prose, guide/index content, search scoring, result order, catalog destinations and SRC qualifications remain unchanged. This is a navigation correction, not a claim that missing instructions were recovered.

All nine frozen guide-anchor misses already return a child of the expected parent somewhere within their six primary matches. Their original primary-anchor misses remain misses. Parent navigation is a separate path to context; the evaluation questions and expectations are unchanged.

## Source gaps still requiring evidence

The owner clarified that the concern is **mobile workflow source gaps**. That concern is **not closed**. Four additional retained adjustment field definitions and a receiving process diagram provide bounded supporting context, without establishing the missing mobile sequences. Ten relevant article originals were also checked for media: Inventory Management, nesting procedures and both SRC registries provide no additional process images; the remaining assets are small interface icons. Related RF procedures, configuration fields and SRC labels do not establish equivalent Warehouse Mobile prompts.

| Flow | Evidence still needed to complete the procedure |
| --- | --- |
| SRC230 — adjustment by item/location | The negative-adjustment screen sequence, quantity/sign interpretation, required identifiers and reason prompts, submission/result and documented exit behavior. |
| SRC280 — adjustment by LP | The LP-specific negative-adjustment sequence, quantity/sign interpretation, item/container scope and completion behavior. |
| SRC340 — Nest | The exact menu-to-SRC association and flow definition establishing the intended container context, followed by its supported sequence. |
| SRC350 — blind receiving | Complete blind header/detail inputs, validations, prompt order and completion/locating behavior for the documented flow. |
| SRC360 — Remove | The exact menu-to-SRC association and flow definition establishing what is removed and its container context, followed by its supported sequence. |
| SRC400 — warehouse transfer by LP | A distinct LP-specific sequence, required origin/destination inputs, quantity/container handling, completion and exceptions. SRC390 and ordinary LP transfer are not proven substitutes. |

The catalog's 12 missing direct references are a separate source-availability measure: two articles and ten images. Their presence in the source graph does not establish that they contain any of these six missing procedures. Existing acquisition closure remains in force. Completing these contracts needs relevant additional documentation or a separately scoped walkthrough; no operational walkthrough is authorized or performed by this checkpoint.

## Source-file route and new source conflict

The retained [Warehouse Mobile Guide](../AIM/source/downloads/e8db29a94e4b6e826d7aa7183ec297379d7657706921d9e19c4c586096e484b4.pdf) has 71 physical pages. Physical page 6 (printed page 2) describes the default `Screen Flows` application folder. Physical pages 22–23 (printed pages 18–19) explain the JSON flow/page/control structure, transitions, validation and actions. Physical page 67 (printed page 63) describes custom overlays, so a base definition alone may not describe an effective customized flow. These are source-definition facts, not installed-behavior acceptance.

**The sources disagree on Blind Receiving's identifier.** The PDF's physical page 9 (printed page 5), in both prose and its configuration example, uses **330** and `ReceivingBlind.json`. The retained article registry uses **330 for Clear putwall location** and **350 for Receiving Blind** (`716ff5168b6f055fc5123a31137c7c9773f29a0ef92749e52b5a9abbe9f8e64b`, rows n259 and n273). No supported release ordering or installed mapping resolves that conflict. PDF copyright/metadata and the example's timestamp do not establish precedence. C27 preserves the existing registry-backed lookup; it does not relabel SRC330 or close SRC350.

The attachment inventory contains **185 references across 3,987 active AIM/SDK resource records**. Filename/path inspection found no base screen-flow JSON attachment candidate; selected API JSON examples contain request/entity shapes, not operator flows. This bounded review does not establish global source exhaustion.

The retained Activity Architect help explicitly documents **View** as read-only (`bb0fe7ffa381901b004add312d27d3427416173cea32aad7e94f1e5178c4d4de`, n81). An actual attempt through the existing configuration navigation returned: **“You do not have security to access the Activity Architect screen.”** No flow list, JSON, edit screen or warehouse task was accessed. No permission change or alternate access route was attempted. The existing Customer SOP Hub had no documents. Task-created inspection tabs were closed; original tabs remain.

**Needed to continue:** an accessible local copy or authorized export of the six relevant base definitions, their filename/SRC associations and any applicable overlay definitions, or an additional authoritative procedure source. For Blind Receiving, include the association that resolves the 330/350 discrepancy. Provide source/version context without warehouse transaction records. The owner was asked for the source location; access expansion or a warehouse walkthrough is not assumed.

## Verification and continuation

The article baseline remains **675/723 top-eight, 419 first, 48 misses; 723 selected-topic contracts passed**. The guide baseline remains **24/24 expected guides within six, 23 first; 15/24 exact anchors within six, 14 first**. No retrieval recovery is claimed.

Detailed final commands, counts, comparisons, source bindings and the changed-output manifest are recorded in [the C27 machine-readable checkpoint](continuation27-20261001.json). Browser checks cover the new context links and focus behavior separately from owner acceptance.

- `python -m unittest tests.test_help_guides tests.test_help_app tests.test_help_articles tests.test_retrieval`: **exit 0; 69 passed, zero failed or skipped**. The two new regressions failed before the correction and passed after it.
- `python tools/build_help_guides.py --check`: **exit 0**. Existing bindings remain unchanged: seven readable documents, 87 cited articles and three evidence records.
- `python tools/evaluate_help.py --serve --output .aekr/work/continuation27/article-evaluation-final.json`: **exit 0**. The entire evaluation equals C26, including all 723 question/expectation/result/contract records.
- Comparison against the immutable C26 renderer preserves every original rendered block across seven documents. The 177 new parent links target existing focusable headings: 84 in searchable guides and 93 in the central reference. The 24 guide result lists are unchanged.
- Actual Brave keyboard checks reached SRC440, then its new parent link, then the Receiving prerequisite section with focus preserved. At a 320-pixel viewport, document client and scroll widths both measured 305 pixels; the context link wrapped without overflow. The viewport was restored, the task tab closed, and the preview stopped with its listening port verified closed.
- Source checks verified four new article originals and 30 prose nodes, ten targeted media inventories, and the retained PDF hash. The five relevant PDF pages were rendered and inspected; no full 71-page visual review is claimed.
- `git diff --check`: **exit 0**. No full database/corpus regeneration, new DB connection, JAWS run, warehouse execution or deployment/timing check was run.

Continue with new evidence for the named contracts or a distinct source/intent-supported article retrieval design. Preserve the frozen 723 article cases and 24 guide probes; report losses as well as improvements. Do not repeat C21's rejected ranking experiments, infer negative quantities from positive-adjustment steps, treat a parent link as a recovered primary result, or reinterpret the six source gaps as closed.
