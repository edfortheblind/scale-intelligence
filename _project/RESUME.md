# Resume SCALE Intelligence

1. Read the two supplied root master prompts in full, revision STAGE-CHATGPT-EN-2.0, this file, and STATE.json. The expected `prompts/` paths are absent; the root copies are authoritative workspace inputs.
2. Use the existing desktop chat. The owner's 2026-09-29 exception authorizes the dedicated local Edge session described in AUTHORIZATION.md. Reuse that profile; do not copy authentication state or personal profiles. Recheck capabilities before acquisition.
3. Run `.\tools\scale-int.ps1 preflight`, then `.\tools\scale-int.ps1 verify`. The general verifier checks saved-byte integrity. The original capability blocker is resolved. The legacy `resume` command exits 2 after storage verification; use the acquisition and conversion commands below for actual progress.
4. Original-byte transport is now verified using the dedicated Edge session. `python tools/acquire.py --kind navigation --limit 12` resumes a bounded published-navigation batch. It holds the writer lock, uses one GET at a time, checks redirects before following, and checkpoints every resource. Normal SSO may be required again when the session expires. Never replace originals with DOM serialization.
5. Complete AIM navigation/index/search discovery, preserve original bodies, implement faithful inert reading copies and all documentary states, pass a representative five-article pilot, then continue AIM without another GO. SDK follows verified AIM local completion. Reconcile cross-module links and audit both corpora before final private delivery.

## Previous blocker and resolution

The exposed browser API provides read-only DOM evaluation, page asset bundles for images/fonts/stylesheets/video, and download controls. It does not expose general authenticated HTML/XML/JavaScript response bodies, HTTP status, or redirect chains. A download attempt on the published AIM Copyright Notice link timed out after 20 seconds. A PNG asset bundle succeeded and the exported file was accessible to local execution. This is BLOCKED_CAPABILITY, not an MFA failure.

Resolved by the owner's authorized dedicated Edge session: both supported response-body APIs returned identical original bytes after normal SSO. See AUTHORIZATION.md. The eight-article pilot subsequently passed. Full navigation, reading-copy fidelity, variants, assets and attachments remain required before declaring corpus completion. No cookies, tokens, or manual article transcription are required from the owner.

## Actual commands

```powershell
.\tools\scale-int.ps1 preflight
.\tools\scale-int.ps1 status
.\tools\scale-int.ps1 verify
.\tools\scale-int.ps1 capture -Bundle '<browser-export-manifest-path>'
.\tools\scale-int.ps1 discover -References '<machine-produced-reference-json-path>'
.\tools\scale-int.ps1 resume
python -m unittest discover -s tests -v
python tools/discover_aim.py
python tools/acquire.py --kind navigation --limit 100
python tools/acquire.py --kind article --limit 8
python tools/article_data.py
python tools/style_data.py
python tools/acquire.py --kind image --limit 100
python tools/build_search.py --provisional
python tools/run_aim.py
python tools/run_aim.py --offline
```

Reference input is an array of objects with `module`, `href`, `base`, `discovery_source`, and optional `kind`. Only actually observed references may enter it. Discovering references is not proof of exhaustive navigation. The importer accepts pageAssets bundle files and never claims complete transport metadata when the exporter omits it.

Each invocation obtains an OS file lock beneath `%LOCALAPPDATA%\TAB\SCALE-Intelligence\runtime\<workspace-id>`. The OS releases ownership on process exit. An owner record includes process identity and acquisition/release timestamps. Do not delete a lock to take ownership. Snapshot and source writes use flushed, hash-checked sibling temporary files followed by atomic replacement. An interrupted body without a manifest is not counted and can be imported again idempotently.

The original workspace contained only four instruction files and empty AIM/SDK directories. No existing Git repository, state, collector, or corpus was found. Existing files were retained. The directory's reparse tag is a OneDrive cloud tag; no junction/symlink target was reported.

GitHub identity: edfortheblind. The new repository is `edfortheblind/scale-intelligence`, explicitly PRIVATE, with ADMIN permission. Verify privacy again before every publication. Root origin is its HTTPS URL. Source attributes disable text conversion and filters. Final corpus completion requires a clean clone with all original hashes and required LFS objects, in addition to coverage/fidelity checks.

Check the external OS lock, owner PID and STATE.json before declaring a worker active or starting another writer. Acquisition and discovery commands are bounded foreground operations; a running desktop tool session may still own the lock. Safe per-resource manifests are the recovery source even when a batch has not yet refreshed aggregate counts. Do not overlap commands after a tool returns a running session ID.

The owner specified that this corpus will support an interactive consultation app. Preserve `_project/DATA_ARCHITECTURE.md`: original bytes plus portable structured JSON and faithful reading copies, with SQLite FTS5 as a reproducible derived index. A provisional index does not grant pilot or corpus completion. Current selection is `_project/pilot-AIM.json`; expanding it requires a recorded representative-format reason, never a way to bypass the pilot.

The published `Data/BrowseSequences/Inventory.js` returns HTTP 404 and remains a source gap. Initial stylesheet-relative requests for `-pie-background` and `behavior` values were collector resolution mistakes: these are opaque legacy polyfill declarations, preserved in original CSS and excluded from execution. The corrected CSS parser records that distinction and retains the erroneous attempts as `INVALID_RESOLUTION` history; do not report those mistaken targets as missing source images.

The independent final audit and final project acceptance have not occurred.

`run_aim.py` is the continuous local AIM driver after pilot success. It captures the current article queue, follows discovered asset queues to a fixed point, rebuilds app data and search, and produces module and artifact audits. It stops on authentication/permission/transport blockers or its bounded discovery limit. Source failures remain actionable external blockers while independent local verification continues. The `--offline` option rebuilds and verifies saved data without Stage acquisition; current immutable browser evidence is reused, and stale evidence is rechecked. Its log and controller lease are outside OneDrive/Git. Check `STATE.json.controller`, the recorded PID and the external lease before starting it again. SDK acquisition and final GitHub delivery remain subject to the original handoff and completion requirements.

The controller handles Ctrl+C by requesting shutdown after its current child exits safely. Article acquisition runs in batches of 100; every resource is checkpointed. Abrupt OS termination cannot finalize a state file: verify the recorded PID and external OS lease, then resume from resource manifests.

## Current continuation checkpoint

Owner review approval is recorded. The latest owner priority is AIM completion before SDK. Source recheck still found eight failures with a matching authenticated entry control. Live rendering of 17 target pages did not create any of the 21 unique missing fragments referenced by 23 article links. All 2,446 captured articles have converter v2 reading copies and pass reading-preservation checks; 2,420 pass all article checks including source links. The remaining 26 article findings are source-link gaps. See `AIM/reports/source-gaps.md` and `AIM/reports/live-source-gaps.json`.

No acquisition worker is running. Do not rerun unchanged failed requests blindly or convert source gaps into completion. The earlier collection-order question is superseded by the owner's AIM-first direction. Source repair or authoritative mappings in the allowed documentation roots are required before recollecting affected generations. SDK remains unacquired.

All 478 static documentary-state nodes plus the linked popup passed offline rendering across 421 pages; all 355 images decoded and 13 attachments passed format checks. The historical state report remains intact. Its separate binding proves all 5,659 original/reading/support/verifier inputs and the report itself exactly match immutable checkpoint `1dc23faedf2f350cf1591a48925914ae2e8c3211`. Eleven representative source/local screenshots cover extensive articles, tables, images, dropdowns, togglers, and a topic popup; their separate binding includes the same unchanged rendering inputs. This sampling supplements the per-node checks.

The final discovery replay is a fixed point for the known graph. Its closure proof binds parsed navigation, TOC hierarchy and labels, memberships, occurrence mappings, and article reference inventories. Eight uncaptured sources still prevent discovery closure. The 2,630-node local index is verified; four published navigation occurrences still reference the same unavailable `fibothc&s.htm` target. Known required inventory is 3,213 resources, of which 3,205 originals are saved. Complete-publication denominators remain unknown and are never inferred from successful captures.

Use `python -B tools/run_aim.py --offline` for the complete local pipeline. Targeted checks are `verify_resources.py`, `verify_bound_states.py`, `audit_module.py`, `report_source_gaps.py`, `build_navigation.py`, `build_search.py --provisional`, and `verify_delivery.py`. Changed rendering dependencies invalidate state/visual proof. Historical adoption is permitted only through `adopt_state_proof.py --commit <immutable-commit>` after byte-exact comparison; it never fabricates a new browser run.

Before publishing a progress checkpoint, finish all module artifact writes, then run `python tools/build_delivery_inventory.py` followed by `python tools/verify_delivery.py`. The inventory covers every module file, including manifests, reading CSS, navigation and the reading index. Any subsequent corpus or coverage change requires rebuilding this inventory. A clean clone must verify the same expected inventory, source and derivative hashes, search database, supplied prompts, and LFS objects. Empty or incomplete checkout roots fail verification. The inventory does not establish corpus completeness.

Historical delivery: the expanded AIM checkpoint at `1b9eb7e540de004733a41b7b74ab5c3777b1dc80` passed a GitHub clean-clone verification of 14,165 expected artifacts, 3,196 unique source files, 4,892 reading files, 2,446 app documents, both supplied prompts and the search database. Git LFS fsck passed with zero LFS objects; all 49 tests then passed. That receipt does not certify subsequent local changes. Current changes require a fresh private checkpoint and clean-clone verification. Atomic-write `.pending-*` leftovers are excluded from the artifact inventory and remain uncounted recovery material.

Current local verification now includes 60 regression tests and strict completion gates. Preserve all missing-source evidence and keep `MODULE_LOCAL_COMPLETE` false while source closure or link fidelity remains blocked. SDK preparation did not acquire SDK resources. Publication verification confirms delivery of the partial checkpoint only; it cannot establish corpus completeness.
