# Resume SCALE Intelligence

## Database assessment and supporting documents — 2026-09-29

The owner separately authorized a full metadata-only SCALE replica assessment and documentation plan, then accepted the delivered scope with its documented gaps and authorized commit/push in `owner-acceptance-DB.json`. Start at `DB Architecture/README.md`, `ASSESSMENT.md`, `PLAN.md` and `evidence/summary.json`. Snapshot `20260929T214106Z` contains 3,022 visible objects and all 1,142 SQL modules. Structural documentation and existing runtime aggregates are captured; exhaustive per-routine semantic review, active application configuration and end-to-end process timings remain explicitly incomplete. No application records were selected and no routines were executed.

Credentials were subsequently moved under explicit owner instruction to `%LOCALAPPDATA%/TAB/SCALE-Intelligence/private/credentials/replica.connection.txt`, with a verified current-user-only ACL. `tools/assess_db.py` defaults to that private file. Never put credentials back in the repository. Raw definitions remain in the separate private `db-assessment` directory. Consult `DB Architecture/OPERATIONS.md` before refreshing; the builder prevents mixed-generation/stale output. Read `evidence/verification.json` and `evidence/REVIEW.md` for current verification/audit limits.

The owner also requested `SDD/README.md` be prepared and obsolete prompts archived. SDD now inventories nine supplied documents and defines their intake/reconciliation method; document-body extraction is not yet performed. The active `01_AIM_MASTER_PROMPT.md` and `02_SDK_MASTER_PROMPT.md` remain because collector/policy/tests consume them. Obsolete kickoff material has a local ignored archive with restoration metadata. This does not reopen accepted AIM/SDK collection or start the interactive application.

Private main delivery of the DB/SDD generation is verified at content commit `920c2aa50afeed5030b8ff9eef7e48026831c3a0`; `_project/db-delivery-checkpoint.json` records the clean clone, all 5,971 artifact hashes, nine source-document originals and 12 passing clone tests. The receipt itself is published in a subsequent metadata commit. Documented semantic/runtime gaps remain unchanged.

## Owner-closed collection

AIM is accepted complete at 99.71% (2,446/2,453 known article originals). SDK is accepted complete at 95.53% (363/380). Both use OWNER_ACCEPTED_COMPLETE_WITH_EXCEPTIONS. Read owner-acceptance-AIM.json, owner-acceptance-SDK.json, collection-closure.json and COLLECTION_CLOSURE.md. No acquisition is pending, and no routine retries or repeated approval are required.

Do not rerun collection merely because the preserved historical audit says DISCOVERY_INCOMPLETE or the SDK pilot says FAILED. Missing originals and source-format diagnostics remain actual technical facts; they do not reopen the owner's closed work disposition. Do not change denominators, fabricate content, infer deprecation or mark missing resources saved. Reopen only when the owner requests work on specified gaps.

## Existing foundation and delivery

Verified corpus: d52f0ddc661afb35f54a93d36f708afb7f425b2d. Historical clean-clone receipt: 89bc99247d7639b0926b1894433dc83d4f05683f. The private repository remains edfortheblind/scale-intelligence. Verification covered 16,787 artifacts and 236 passing tests, with LFS pull/fsck passed and zero required LFS objects. Originals, JSON, readings, manifests, source gaps, search database and technical reports stay unchanged by this closure. The search database contains 2,809 articles and retains its provisional/incomplete flags.

Closure changes are metadata only; verify their Git/clone parity separately without claiming a new corpus acquisition or browser run. Retain the historical corpus receipt and hashes.

## Next phase

The interactive SCALE consultation app is not implemented. Next work is MVP discovery and design, followed by implementation, accessibility/retrieval testing and private deployment. Confirm the intended users, core workflows, access model and hosting destination during that phase. The current collection instruction does not start a chatbot, RAG pipeline, embeddings or a replacement WMS UI.

## Continuing controls

Keep this existing project and repository. Preserve one active writer and atomic checkpoints. Use the owner-authorized Stage Edge session with normal SSO only if collection is explicitly reopened. Credentials and runtime profiles stay outside Git and OneDrive. C:/Apps/AEKR remains read-only; do not copy its private assets. English applies to authored material; source text, code, images and attachments remain intact. The original root master prompts remain authoritative except where the later recorded owner acceptance supersedes their work-closure requirements.
