# TAB core SDD reconciliation - October 8, 2026

The two official owner-designated TAB SDDs now have preserved extraction packets and a [source-bound TAB design reference](../SDD/TAB_DESIGN_REFERENCE.md). The original Travis SDD is the base. The March 2025 TRAV3PL addendum changes or adds only its stated requirements; its assumption 18 preserves other original processes.

The earlier PO disposition and core-source registration were published to main as `0b9cc129a0fb2586fe8ac6f797c098c1c58e7691`. The owner explicitly authorized the existing PUBLIC repository after its visibility was identified; see [publication authority](publication-authority-20261008.json). Older private-only wording and the earlier intake hold are dated records, not a current delivery barrier. No separate branch merge was necessary for that main-branch delivery.

## Delivered source work

| Work | Verified coverage | Meaning and limits |
|---|---|---|
| Original identity and extraction | 2/2 sources, 100% | Original paths, byte sizes and SHA256 preserved. Historical derived inventory and neutral reference/PDF unchanged. |
| Extracted text review | 1,667/1,667 nodes, 100% | 1,403 DOCX nodes and 264 PDF nodes. Includes blank/ancillary nodes and overlapping PDF candidate tables; this is reading coverage, not a percentage of accepted business behavior. |
| DOCX tables and images | 21 tables/329 cells; 46/46 embedded assets reviewed | Original media bytes retained. Physical Word pages were not rendered. |
| PDF pages | 22/22 visually reviewed, 100% | Full-page source renders at 120dpi; 238 text blocks, 26 heuristic table candidates and 29 extracted image streams. |
| Documentary reconciliation | 69 source-bound topic claims; 12 cross-source dispositions | Exact node/text hashes, qualifiers and links; source interpretation only. |
| Help and runtime integration | No new credit | No help/search changes, installed SCALE changes, transactions, deployments, accessibility acceptance or timing observations. |

Read the [core-source register](../SDD/tab-core-sources.json), [claim register](../SDD/tab-core/reconciliation.json), [text ledger](../SDD/tab-core/text-review-coverage.json), [visual ledger](../SDD/tab-core/visual-review.json) and [verification receipt](tab-core-reconciliation-verification-20261008.json). Source filenames and the PDF's existing `derived/` location remain unchanged.

## Design conclusions and retained questions

- The 2022 one-company baseline and the 2025 Company-per-new-customer design have different scopes. Customer zones are recommended; customer-specific locating/allocation configuration and output folders are required by the addendum. No additional customer's deployment is asserted.
- The original receipt-container download exclusion is qualified by the addendum's optional customer-supplied container data. Shipping containers remain excluded from shipment downloads.
- Receipt confirmation repeatedly uses container-level **In Putaway**, but receipt/header, closure and appendix wording leave the exact trigger interaction unresolved.
- Receipt/shipment Company arrives at the header while locating/allocation criteria read detail Company. The mapping remains unverified.
- **Rule Assignment precedes Allocation**; **VAS Assignment follows Container Creation**. VAS and automatic QC assignment retain the wave-created-container condition. These dependencies do not supply the missing complete wave sequence.
- Warehouse Mobile Blind Receiving, Shipping Container QC and Status Change are planned tests in the 2025 source. They are not passed tests or closure of the six deferred mobile contracts.
- TAB short-pick inventory action is documented as **Count/suspend**; shipment demand separately uses **Delete Rejected/upload**. Generic on-hand reduction wording must not override that distinction.
- Source comments retain open wave exports, allocation sequences, Pack Size communication, Load Building, LTL label/BOL migration and extension identity questions. The modification table names EX01 Custom Item Balance; EX-XX for 1348 printing remains unresolved. Blank signatures, placeholders and the unexpected VAS organization name are preserved.
- Generic PO screenshots do not establish TAB PO use. The owner says Travis does not use PO; no fake record or automatic retry is needed. S3 remains **4/6 observed contexts**, and the prior sampled Stage Monitor result remains **4/4**.

## Verification and continuation

The registered-only extractor reuses existing SDD helpers. An independent fixture audit found output-junction redirection; the correction validates the output root and all existing descendants before helper writes. The bounded extraction audit passed **11/11 checks**, including identity failure before writes, input/output containment, registered-only extraction, original/legacy preservation, synthetic tracked revisions, actual text/table fidelity and media hashes. Durable regression tests and a separate semantic review are recorded in the verification receipt; mechanical hash checks do not prove semantic correctness.

Both extracted-text reviews covered their complete assigned ranges. Independent semantic review covers every newly authored TRAV3PL topic and every cross-source disposition, with a selected DOCX-claim sample. Root review and source workers retain their distinct roles; no worker grants product acceptance. Provisional visual labels in extraction JSON are extraction-time metadata; the later visual ledger records the completed asset/page pass.

Outcome: **DONE_WITH_CONCERNS** for the documentary task. Delivery state is recorded separately in the verification receipt and Git handoff. Product state: source interpretation available, current runtime unverified. Gate/authority state: owner source/publication instruction applies; prior acquisition/display/JAWS closure, six deferred mobile contracts and **0/34 deployment/correlated timing** remain unchanged.

For future TAB guidance, start with this reference and exact source nodes, then resolve the relevant retained question if it affects the requested answer. Help integration or operational verification needs its own concrete scope. Do not repeat completed extraction/review, open archived payloads, resume PO discovery or reopen deferred mobile work automatically. Untracked Video Rec remains outside this delivery.
