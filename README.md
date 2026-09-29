# SCALE Intelligence

Universal SCALE reference library: [AIM](AIM/README.md) and [SDK](SDK/README.md).

Status: **AIM captured to the available-source boundary; source repairs required**. Byte-preserving acquisition through the owner's dedicated Edge session is verified. The local AIM checkpoint contains 2,446 articles and all currently discovered accessible assets and attachments. The corpora remain incomplete; SDK acquisition waits for AIM local completion or an explicit owner exception to collection order. Current counts and unresolved resources are recorded in `_project/STATE.json` and module reports.

The owner defines one universal reference library. Stage is the acquisition environment only. Source qualifications must be retained verbatim. Newly authored project material is English.

## Authority and preservation

Ed Lopez reports that Manhattan Associates approved TAB's internal initiative using documentation available under TAB's license and confirmed TAB's partner status. He also reports TAB CTO authorization. This records the owner's statement, not an independently verified legal instrument.

Only published documentation under the authorized Stage AIM and SDK roots is in scope. Dashboard access is for normal SSO only. No operational examples may be executed. Original source notices remain applicable; this repository grants no new rights to the acquired material.

Current authoritative workspace prompts are `01_AIM_MASTER_PROMPT.md` and `02_SDK_MASTER_PROMPT.md`, revision **STAGE-CHATGPT-EN-2.0**. These are the supplied workspace copies; they have not been rewritten or duplicated.

## Operation

Python 3.14.7, Playwright 1.62.0, Microsoft Edge, PowerShell, Git 2.55.0 and Git LFS 3.7.1 were verified locally. Acquisition uses the dedicated authorized Edge profile outside the repository and OneDrive; it does not export cookies or credentials.

```powershell
.\tools\scale-int.ps1 preflight
.\tools\scale-int.ps1 status
.\tools\scale-int.ps1 verify
python -m unittest discover -s tests -v
```

See [_project/RESUME.md](_project/RESUME.md) for continuation commands. `verify` checks saved byte integrity only; it never certifies coverage or fidelity. The legacy `resume` command checks storage and exits 2; active acquisition uses `tools/acquire.py`. `publish` refuses final corpus publication while required completion evidence is absent. Clearly labeled progress checkpoints may be published to the verified private repository.

The collector supports original response bytes and transport metadata, static TOC/index/search parsing, source-to-JSON conversion, inert reading copies, and a rebuildable SQLite full-text index. The [data architecture](_project/DATA_ARCHITECTURE.md) supports the future interactive SCALE consultation app. Original HTML and assets remain the fidelity authority; app JSON preserves structure and relationships. The search database is derived and explicitly provisional until corpus verification succeeds.

Pilot selection is durable. Its eight articles passed source-text, table, code, asset, expanded-state, offline browser, idempotent conversion and recovery tests. Corpus checks now compare the actual saved reading files against source node order, text, attributes and resource mappings. All 478 captured static state nodes and the linked popup passed offline browser checks. [Unresolved published URLs and anchors](AIM/reports/source-gaps.md) remain visible. Automatic module handoff and final corpus verification remain incomplete; this checkpoint does not claim completion.

Private runtime locks are outside OneDrive and Git. Resource manifests are reconstructable per-resource checkpoints; partial writes do not count as saved bodies. No AEKR runtime or private assets are included.
