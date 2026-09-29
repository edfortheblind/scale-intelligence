# SCALE Intelligence

Universal SCALE reference library: [AIM](AIM/README.md) and [SDK](SDK/README.md).

Status: **BLOCKED_CAPABILITY / DISCOVERY_INCOMPLETE**. This initial delivery contains the durable storage foundation and capability evidence, not completed documentation corpora. No pilot has passed. SDK acquisition waits for AIM local completion.

The owner defines one universal reference library. Stage is the acquisition environment only. Source qualifications must be retained verbatim. Newly authored project material is English.

## Authority and preservation

Ed Lopez reports that Manhattan Associates approved TAB's internal initiative using documentation available under TAB's license and confirmed TAB's partner status. He also reports TAB CTO authorization. This records the owner's statement, not an independently verified legal instrument.

Only published documentation under the authorized Stage AIM and SDK roots is in scope. Dashboard access is for normal SSO only. No operational examples may be executed. Original source notices remain applicable; this repository grants no new rights to the acquired material.

Current authoritative workspace prompts are `01_AIM_MASTER_PROMPT.md` and `02_SDK_MASTER_PROMPT.md`, revision **STAGE-CHATGPT-EN-2.0**. These are the supplied workspace copies; they have not been rewritten or duplicated.

## Operation

Python 3.14.7 standard library, PowerShell, Git 2.55.0 and Git LFS 3.7.1 were verified locally. No third-party runtime dependencies are installed.

```powershell
.\tools\scale-int.ps1 preflight
.\tools\scale-int.ps1 status
.\tools\scale-int.ps1 verify
python -m unittest discover -s tests -v
```

See [_project/RESUME.md](_project/RESUME.md) for the actual capability boundary and continuation steps. `verify` checks saved byte integrity only; it never certifies coverage or fidelity. `resume` checks saved bytes and reports the unresolved capability with exit 2. `publish` intentionally refuses final corpus publication while required completion evidence is absent. Publishing a clearly labeled foundation checkpoint is a separate authorized Git operation.

The collector currently supports explicit observed-reference registration and browser asset-bundle import. It does not yet implement full original-body acquisition, navigation parsing, reading-copy conversion, or automatic AIM-to-SDK handoff. Those cannot be represented as verified against unavailable source bodies.

Private runtime locks are outside OneDrive and Git. Resource manifests are reconstructable per-resource checkpoints; partial writes do not count as saved bodies. No AEKR runtime or private assets are included.
