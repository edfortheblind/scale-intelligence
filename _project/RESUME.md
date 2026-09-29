# Resume SCALE Intelligence

1. Read the two supplied root master prompts in full, revision STAGE-CHATGPT-EN-2.0, this file, and STATE.json. The expected `prompts/` paths are absent; the root copies are authoritative workspace inputs.
2. Use the existing desktop chat and already-open Stage tabs. Do not create a browser profile or copy authentication state. Recheck capabilities before acquisition.
3. Run `.\tools\scale-int.ps1 preflight`, then `.\tools\scale-int.ps1 verify`. Only saved-byte integrity is currently verified. `resume` exits 2 with BLOCKED_CAPABILITY until the original-body adapter is implemented and verified.
4. Resolve the original-body export capability below. Continue with a byte-preserving adapter through the same authorized browser session. Do not replace originals with DOM serialization. Do not use undocumented debugging endpoints or a different session.
5. Complete AIM navigation/index/search discovery, preserve original bodies, implement faithful inert reading copies and all documentary states, pass a representative five-article pilot, then continue AIM without another GO. SDK follows verified AIM local completion. Reconcile cross-module links and audit both corpora before final private delivery.

## Current blocker

The exposed browser API provides read-only DOM evaluation, page asset bundles for images/fonts/stylesheets/video, and download controls. It does not expose general authenticated HTML/XML/JavaScript response bodies, HTTP status, or redirect chains. A download attempt on the published AIM Copyright Notice link timed out after 20 seconds. A PNG asset bundle succeeded and the exported file was accessible to local execution. This is BLOCKED_CAPABILITY, not an MFA failure.

Required: a supported original-resource byte export with response metadata in this existing authorized browser context. Do not ask the owner for cookies, tokens, or manual article transcription. No alternate browser or local HTTP session has been created.

## Actual commands

```powershell
.\tools\scale-int.ps1 preflight
.\tools\scale-int.ps1 status
.\tools\scale-int.ps1 verify
.\tools\scale-int.ps1 capture -Bundle '<browser-export-manifest-path>'
.\tools\scale-int.ps1 discover -References '<machine-produced-reference-json-path>'
.\tools\scale-int.ps1 resume
python -m unittest discover -s tests -v
```

Reference input is an array of objects with `module`, `href`, `base`, `discovery_source`, and optional `kind`. Only actually observed references may enter it. Discovering references is not proof of exhaustive navigation. The importer accepts pageAssets bundle files and never claims complete transport metadata when the exporter omits it.

Each invocation obtains an OS file lock beneath `%LOCALAPPDATA%\TAB\SCALE-Intelligence\runtime\<workspace-id>`. The OS releases ownership on process exit. An owner record includes process identity and acquisition/release timestamps. Do not delete a lock to take ownership. Snapshot and source writes use flushed, hash-checked sibling temporary files followed by atomic replacement. An interrupted body without a manifest is not counted and can be imported again idempotently.

The original workspace contained only four instruction files and empty AIM/SDK directories. No existing Git repository, state, collector, or corpus was found. Existing files were retained. The directory's reparse tag is a OneDrive cloud tag; no junction/symlink target was reported.

GitHub identity: edfortheblind. The new repository is `edfortheblind/scale-intelligence`, explicitly PRIVATE, with ADMIN permission. Verify privacy again before every publication. Root origin is its HTTPS URL. Source attributes disable text conversion and filters. Final corpus completion requires a clean clone with all original hashes and required LFS objects, in addition to coverage/fidelity checks.

No background collector is running. Safe manifests and STATE.json are the durable recovery source. The independent final audit and final project acceptance have not occurred.
