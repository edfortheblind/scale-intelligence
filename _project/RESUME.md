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
```

Reference input is an array of objects with `module`, `href`, `base`, `discovery_source`, and optional `kind`. Only actually observed references may enter it. Discovering references is not proof of exhaustive navigation. The importer accepts pageAssets bundle files and never claims complete transport metadata when the exporter omits it.

Each invocation obtains an OS file lock beneath `%LOCALAPPDATA%\TAB\SCALE-Intelligence\runtime\<workspace-id>`. The OS releases ownership on process exit. An owner record includes process identity and acquisition/release timestamps. Do not delete a lock to take ownership. Snapshot and source writes use flushed, hash-checked sibling temporary files followed by atomic replacement. An interrupted body without a manifest is not counted and can be imported again idempotently.

The original workspace contained only four instruction files and empty AIM/SDK directories. No existing Git repository, state, collector, or corpus was found. Existing files were retained. The directory's reparse tag is a OneDrive cloud tag; no junction/symlink target was reported.

GitHub identity: edfortheblind. The new repository is `edfortheblind/scale-intelligence`, explicitly PRIVATE, with ADMIN permission. Verify privacy again before every publication. Root origin is its HTTPS URL. Source attributes disable text conversion and filters. Final corpus completion requires a clean clone with all original hashes and required LFS objects, in addition to coverage/fidelity checks.

Check the external OS lock, owner PID and STATE.json before declaring a worker active or starting another writer. Acquisition and discovery commands are bounded foreground operations; a running desktop tool session may still own the lock. Safe per-resource manifests are the recovery source even when a batch has not yet refreshed aggregate counts. Do not overlap commands after a tool returns a running session ID.

The owner specified that this corpus will support an interactive consultation app. Preserve `_project/DATA_ARCHITECTURE.md`: original bytes plus portable structured JSON and faithful reading copies, with SQLite FTS5 as a reproducible derived index. A provisional index does not grant pilot or corpus completion. Current selection is `_project/pilot-AIM.json`; expanding it requires a recorded representative-format reason, never a way to bypass the pilot.

The published `Data/BrowseSequences/Inventory.js` returns HTTP 404 and remains a source gap. Initial stylesheet-relative requests for `-pie-background` and `behavior` values were collector resolution mistakes: these are opaque legacy polyfill declarations, preserved in original CSS and excluded from execution. The corrected CSS parser records that distinction and retains the erroneous attempts as `INVALID_RESOLUTION` history; do not report those mistaken targets as missing source images.

The independent final audit and final project acceptance have not occurred.

`run_aim.py` is the continuous local AIM driver after pilot success. It captures the current article queue, follows discovered asset queues to a fixed point, rebuilds app data and search, and produces module and artifact audits. It stops on authentication/permission/transport blockers, source or fidelity gaps requiring review, or its bounded discovery limit; it does not mark incomplete work complete. Its log and controller lease are outside OneDrive/Git. Check `STATE.json.controller`, the recorded PID and the external lease before starting it again. SDK acquisition and final GitHub delivery remain subject to the original handoff and completion requirements.

The controller handles Ctrl+C by requesting shutdown after its current child exits safely. Article acquisition runs in batches of 100; every resource is checkpointed. Abrupt OS termination cannot finalize a state file: verify the recorded PID and external OS lease, then resume from resource manifests.
