# Purchase Order selected-context follow-up

On 2026-10-02, the bounded S3 continuation obtained **0/2 new selected-record contexts** for Purchase Order Insight (2796) and Purchase Order Line Insight (2797). The observed Receiving selected-context total remains **4/6 (66.67%)**. This is a result-context limitation; it does not establish that the installation contains no purchase orders.

The [sanitized receipt](../evidence/selected-context-followup.json) records eight Stage inquiry submissions, their outcomes, source fingerprints and the separate Production access check. Earlier evidence remains unchanged in [the Stage PO/Putaway review](STAGE_PO_PUTAWAY.md) and [Receipt review](STAGE_RECEIPTS.md).

## Stage inquiries

| Inquiry | Context and criteria | Observed outcome |
|---|---|---|
| PO ID lookup | Cleared PO criteria, then the visible PO lookup and its Apply control; blank lookup fields | Zero records. The initial lookup may overlap another agent's briefly changed shared warehouse context, so it is not assigned conclusively to the original warehouse. |
| Receipt lead | Original context restored; Receipt ID Type = Purchase Order; Include Closed off | Rows returned. One actual Receipt hyperlink opened detail. Its Purchase Order ID field was disabled and blank; no non-menu PO navigation link was exposed. Cancel returned to Receipt Insight. |
| Receipt reference query | Same Receipt type plus transient Advanced Criteria: Purchase Order ID **is not null**, Include Closed off | Zero records; no visible application error dialog. |
| Receipt reference query, closed included | Same filter, Include Closed on | Zero records; no visible application error dialog. |
| PO | Sole alternate offered global warehouse, fresh 2796 route, matching local Warehouse criterion; Include Closed off | Zero records. |
| PO, closed included | Same verified alternate context, Include Closed on | Zero records. |
| PO Line | Fresh 2797 route in alternate context, matching local Warehouse criterion; Include Closed off | Zero records. |
| PO Line, closed included | Same verified alternate context, Include Closed on | Zero records. |

The zero-result inquiries showed **0 - 0 of 0 records**. The positive Receipt query is a lead only: a Purchase Order receipt type did not supply a nonempty PO reference in the one detail inspected. No record identifier was invented, and no raw business values, record keys, warehouse names, user stamps or query values were retained.

Advanced Criteria exposed the actual Purchase Order ID field and **is not null** operand. Enter added the condition to the current-query grid; a later attempt to click Save found the reset editor's Save button disabled. Cancel closed the editor. A separate settled check then confirmed that the editor was hidden and the main Advanced Criteria grid still contained **Purchase Order ID / is not null**, before Apply submitted the inquiry. No named search was saved and no configuration was published. This observation does not establish general equivalence between null and blank strings.

## Shared context and restoration

The global warehouse selector and local Warehouse search criterion are separate controls. The agent waited while the Monitor reviewer used the shared selector, then inspected the sole alternate offered choice in an exclusive interval. Fresh PO and PO Line routes each showed the local criterion matching that alternate. The alternate selection was verified at **21:11:27.019 UTC**; the exact original visible global selection was restored and verified at **21:19:38.958 UTC** before release. Warehouse values existed only transiently for matching/restoration and were cleared afterward.

The preceding Monitor reviewer reported restoration at 21:08:10.629 UTC before the two Receipt reference inquiries. That timing is coordination evidence from the other agent, not a second live observation by this reviewer. The initial lookup's possible overlap is preserved above rather than used to diagnose the empty results.

## Production fallback

The separately inspected `trav.manhscale.com/scale/insights/2796` shell displayed **Token is not valid or expired**. One normal reload retained that message at **21:20:30.627 UTC**. No inquiry was submitted in that first Production attempt.

After the owner reported renewed sign-in, a new temporary Production PO tab still displayed the error. One Apply attempt retained it, and one normal reload retained it at **21:23:30.291 UTC**. The error was confirmed as a rendered `.toast.toast-error` message. This is an authentication limitation, not a valid zero-row query result. The available browser inventory contained one enabled Brave browser, with the owner's Dashboard and newly opened Warehouse Mobile tabs both on **travstg.manhscale.com**; the only available Production tab was the agent's temporary PO tab. No other enabled browser or user Production session was available to use.

**Pending renewed Production verification:** further retries are paused until a Production session is available. Production PO Line has not been separately visited; no authentication or configuration parity is inferred for it.

## Source support and remaining gap

The existing [functional guide](FUNCTIONAL_GUIDE.md) remains the source-based explanation. Three active AIM articles were rechecked; their original, structured and reading hashes are bound in the receipt:

- [Using the Purchase Order Insight Screen](../../AIM/reading/d2aab9eeb5e3111216fba46f880c0d40fbb2f0f85affbe6eaecd7a9152db59ce.md), nodes n185/n188/n191: enter criteria, search, then select an actual result. Nodes n220/n226 describe Receipts and Lines tiles carrying the selected PO object identity **and warehouse**.
- [Using the Purchase Order Line Insight Screen](../../AIM/reading/d97a049a5bc275a358857b638fa9dff8ec0499618251a2e0900f013de50cca02.md), n194: the line-number hyperlink opens line detail. Node n226 distinguishes View and Edit; neither was invoked here.
- [Introduction to Insight Screens](../../AIM/reading/444e9b8e14a977178c9ff48b972dd65c076a4adda44c3dfacddf94a4a6c24d22.md), n451/n463/n466/n477/n493/n630: advanced inquiry rules, Apply/Enter, Clear without search, separately named saved searches, caller filters and Cancel return.

**Still pending:** real PO and PO Line selected-action transitions, their record-specific detail sections, and the PO-to-Lines relationship in an accessible populated context. The bounded inquiry attempts are complete, but these two technical branches remain open. A renewed Production session or a legitimate populated Stage PO context can support a future read-only continuation. No business transaction, operational action, print/export, record save or database application-row query was executed. No full-screen functional acceptance is added; the six deferred Mobile contracts and 0/34 deployment/timing boundary remain unchanged.

The first temporary inspection tab was closed. The renewed-attempt temporary tab **986568783** is kept as a Production login handoff; owner Stage Dashboard **986568705** and Warehouse Mobile **986568782** tabs are preserved. The owner replaced the Mobile tab during sign-in; this was not an agent closure. This observation set is frozen on 2026-10-02; the two selected-record branches remain pending.
