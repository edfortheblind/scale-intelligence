# C23 article display and search checkpoint

Outcome: DONE_WITH_CONCERNS

Delivery state: The article display correction is implemented and verified locally. Publication evidence is recorded separately after commit.

Product state: Long identifiers wrap inside articles at narrow widths. Search retains 48 unresolved authored cases; two candidates were rejected because they introduced new losses.

Gate/authority state: The owner accepted all previously presented work and authorized continuation with agents. The owner subsequently queued Cross Application and thorough documentation of every Warehouse Mobile/RF flow. This authorizes the next documentation workstream; operational execution and correlated timing remain frozen.

## Display correction and verification

The existing article CSS now wraps otherwise unbreakable text. At a 320-pixel Brave viewport, the catch-weight/history article had a 305-pixel document width and 478-pixel content width. After the correction both measured 305 pixels. The full identifiers remained readable; the temporary viewport override was reset. No article wording, sources, search logic or API changed.

- `python -m unittest tests.test_help_app tests.test_help_articles tests.test_retrieval`: exit 0; 49 passed, zero failures/skips.
- Complete local navigation check: 341 routes (home plus 340 articles), seven configuration procedures, 1,428 links; zero missing routes, fragments, duplicate IDs or label/ARIA bindings. These are HTML/HTTP checks, separate from browser observations.
- Native Brave checks covered the home directory, configuration article, optional source disclosure, article keyboard focus, article search, search-result focus and the existing missing-operation rollback clarification. The observed named work-profile search returned its configuration guide second. These checks do not establish exhaustive visual or screen-reader acceptance.
- `python tools/evaluate_help.py --serve --output .aekr/work/continuation23/final-evaluation.json`: exit 0; 723/723 selected-topic contracts, 675/723 top-eight, 419 first, 48 misses. All 723 questions, expected IDs and returned lists are unchanged from C22. The complete evaluation object is identical to the retained canonical evaluation, so no replacement is needed.
- Sixteen independently authored, source-supported paraphrases retained 14 top-eight and four first results through actual local HTTP. All result lists are unchanged. The author had seen historical narrative and aggregate results; this is a selected challenge set, not a random or fully blind holdout. Two misses remain.
- `git diff --check`: exit 0.

## Rejected retrieval experiments

Both experiments used the unchanged 723 authored questions and expected IDs. Neither was integrated. No aliases, source edits or expected-topic rules were added.

| Candidate | Top-eight | First | Recovered / newly lost | Disposition |
| --- | ---: | ---: | ---: | --- |
| Index existing cited AIM/SDK passages | 677 | 419 | 5 / 3 | Rejected; new losses and corpus-wide scoring effects. |
| Put each article heading in one passage | 675 | 404 | 8 / 8 | Rejected; new losses and lower first-place retrieval. |

The source review retained missing-referent cases as ambiguous and did not identify a justified article omission requiring correction. Dataset output fields and routine identity can distinguish technical intent, but no general ranking change passed this cycle. Repeating these candidates without a different design or evidence is not the next task.

## Next authorized work

Document Cross Application and every discoverable Warehouse Mobile/RF flow, prioritizing the end-user sequence: entry, prompts, required inputs, decisions, validation/error paths, completion/cancel behavior and configuration dependencies. Reconcile live visible navigation with retained documentation. Record exact coverage and blocked branches rather than claiming every conditional path was executed. Preserve source qualifiers and avoid copying warehouse records into documentation. The prior freeze on deployed process timing remains in force.

No new database connection, transaction execution, configuration change, collection retry, archive read or PDF regeneration occurred in C23. The existing untracked Video Rec directory was preserved. The broader completion generator was not run for this CSS-only change; historical scenario/semantic receipts are not relabeled as new review.
