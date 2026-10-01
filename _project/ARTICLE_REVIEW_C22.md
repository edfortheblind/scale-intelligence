# C22 SCALE article and configuration review

Outcome: DONE_WITH_CONCERNS

Delivery state: 340 article revisions, seven configuration procedures, article navigation and reading copies implemented and verified. Normal private publication is recorded separately in Git and the final handoff.

Product state: The knowledge base presents the explanation first, configuration procedures as ordered steps, and optional technical sources. Search retrieval has 48 unresolved cases.

Gate/authority state: This work completes the requested article/configuration pass within the existing private repository. It does not reopen acquisition, deployment/timing work or constitute new usability acceptance.

## Article structure

All 340 primary articles were reviewed and edited. Summaries, steps, settings, results and troubleshooting each retain distinct information; unused sections are omitted. Related articles link to configuration procedures. Full source excerpts, identities and routine detail remain in the expandable technical reference. The root README now leads to the knowledge base and reference library.

The seven configuration articles cover work profiles, packing preferences, printing, receiving preferences, returns/damage status, packing classes/criteria, and container eligibility. Detailed actions and field labels were checked against retained AIM passages. The procedures describe documented SCALE behavior, not a recorded walkthrough of an installed warehouse.

Primary narrative changed from 72,464 to 34,004 words. An exact-text check found 367 repeated blocks before and zero after. That mechanical result does not prove every semantic overlap is absent. All 856 ordered steps retain their count, order and non-prose bindings; all 1,492 source records, evaluation questions, input context and immutable documentary refinements remain unchanged. The canonical topics and their 21 contributing batches were updated together.

## Verification

- `python -m unittest tests.test_help_app tests.test_help_articles tests.test_retrieval tests.test_functional_knowledge tests.test_integrate_functional_batches tests.test_reviewed_sdd_source tests.test_scale_reference`: exit 0; 85 passed, 0 failed, 0 skipped.
- HTTP requests to every `/topic/<id>` route: exit 0; 340/340 returned 200 with article text and unique element IDs.
- `python tools/evaluate_help.py --url http://127.0.0.1:8765`: exit 0; 723/723 selected-topic structure/citation checks. Same 723 questions and expected IDs as the baseline.
- `python tools/verify_db_docs.py`: exit 0; PASS with no errors, including source bindings and 16,535 local links.
- `git diff --check`: exit 0.

Bounded independent review checked all topic changes mechanically, preserved batch semantics, technical examples and seven configuration procedures against selected original passages. Four findings were corrected: punctuation encoding, an acceptance statement in generated source qualifications, missing mobile override field names, and the freight rollup's lack of a carrier-rating request.

One test had required the putaway release caveat in the introduction; it now verifies the same caveat in the article's introduction or Limits section. A separate tokenization test already failed at the baseline because the query `count` invokes the existing missing-subject clarification. It now checks the token directly and preserves that clarification behavior. The ranking algorithm was not changed.

Selected-topic integrity no longer requires a nonempty list of article-specific limitations when the common scope and source qualifications already apply. It verifies a limits list and common scope. This structural check is separate from semantic review.

## Search concern

The final comparison is **675/723 top-eight, 419 first, 48 misses**, versus **684/723 top-eight, 417 first, 39 misses**. There are **12 new misses and three recoveries**. The exact cases and unchanged question identities are recorded in [the receipt](article-review-c22.json); the current complete results are in [evaluation.json](../help_app/evaluation.json).

The article revisions changed indexed prose and result ranking. Review of the new misses identified two useful content omissions, which were restored before the final evaluation. Remaining retrieval losses must remain visible as an unresolved search concern; they are not successful retrieval merely because a related article is useful. No aliases or evaluation questions were inserted into the index to target the expected IDs.

## Limits and continuation

Browser tooling reported no enabled surfaces and no available in-app browser. HTML, HTTP and source checks passed; there was no fresh visual browser, screen-reader or installed SCALE test. Historical display acceptance is not new evidence for these changes.

The central functionality reference/PDF and original sources were not changed. No database was queried or configuration applied. Deployment mapping/timing remains frozen. This article pass does not automatically resume the earlier search-only workstream; retain the documented search concern for the next selected task.
