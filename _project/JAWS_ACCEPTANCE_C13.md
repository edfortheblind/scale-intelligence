# SCALE Knowledge: JAWS acceptance session

Status: **PENDING JAWS and intended-user observation**. The local Brave keyboard and accessibility-tree checks are engineering evidence only. JAWS was not installed or running on the observed Windows machine on 2026-09-30.

Run the current checkout locally on the JAWS machine with `python tools/serve_help.py --port 56581`, then open `http://127.0.0.1:56581/`. This preview uses reviewed local sources and makes no warehouse connection. Record the JAWS version, browser/version, Windows version, tester, date and zoom level. Do not record operational data or private source excerpts in the results.

| Step | Expected result to confirm by speech and keyboard | Observed speech/focus | Pass/Fail |
| --- | --- | --- | --- |
| 1. Load home; use heading navigation and Tab. | SCALE Knowledge and Find an explanation headings are discoverable; the question field has a name and help text; Search guidance and Browse all topics are reachable. | Pending | Pending |
| 2. Enter `wave release hold`; submit with Enter. | The new page lands at Related explanations; the count is discoverable; Tab moves to the first result. The search term remains in the field. | Pending | Pending |
| 3. Enter an unmatched term such as `zzqvunknownsubjectz`. | Related explanations and the no-match message are discoverable without an unrelated answer. | Pending | Pending |
| 4. Enter `container close`; open Container will not close. | The answer title, section headings, ordered steps, limits and source disclosures are read in a useful order. | Pending | Pending |
| 5. Open and close a source disclosure with keyboard. | JAWS announces its label and expanded/collapsed state; source text remains readable. | Pending | Pending |
| 6. Return home and activate Skip to main content. | Focus moves into the main content; continuing with Tab does not enter unrelated browser controls. | Pending | Pending |
| 7. Repeat the search and answer at 200% browser zoom. | Text and controls remain usable in reading order without lost content or horizontal scrolling of the page. | Pending | Pending |

Acceptance requires recorded observations and any defects to be fixed and replayed. A pass from an accessibility tree, automated test or keyboard-only session does not substitute for JAWS and intended-user acceptance.
