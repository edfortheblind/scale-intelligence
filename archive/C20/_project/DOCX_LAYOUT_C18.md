# DOCX PDF creation and layout review C18

All four unique DOCX bodies have been exported. Complete page inspection covers **4/4 bodies**, **541 pages**. The two LAND originals are byte-identical and share one body review. LAND remains MAWM material, separate from SCALE claims.

| Body | Output | Pages inspected | Result |
| --- | --- | ---: | --- |
| Work and Picking | [PDF](<../output/pdf/SCALE Work and Picking Functionality.pdf>) | 64/64 | Two tall diagrams need zoom; five source blank tail pages retained; untagged. |
| HADDAD | [PDF](<../output/pdf/SCALE Configuration Walkthrough - HADDAD.pdf>) | 113/113 | Missing diagram on physical page 13 restored from original EMF; date fields render export time. |
| Covetrus | [PDF](<../output/pdf/Covetrus SCALE Solution Design v1.4.pdf>) | 142/142 | All 25 source tables checked; footer date/filename fields reflect export copy. |
| LAND MAWM | [PDF](<../output/pdf/LAND MAWM Solution Design v2.11.pdf>) | 222/222 | Separate MAWM product; 27 obscuring header backgrounds repaired on eight pages; source fragments/comments/dates qualified. |

Word 16.0.20326.20142 native UI provided the working export route after the owner enabled printing. Work and Picking used Microsoft Print to PDF; the other bodies used Word's native PDF export. Bundled Poppler supplied full-page renders and detailed checks. Original DOCX files and all four working-copy hashes remain unchanged; no Word preference or security-setting writes were made by C18.

HADDAD's native export lost one complete diagram because its reserved form painted only a 9x4-pixel image. The derived deliverable replaces that defective internal image/form content with the independently rendered 1800x784 original EMF. Its bounding box, placement, page content streams and existing structure tree are retained. All 112 other page renders are byte-identical; the corrected page 13 received independent visual review. This PDF is explicitly a compensated derivative, not an unmodified native export.

LAND's native comment markup placed 27 pale highlight rectangles over white text inside blue table headers on eight pages. The derived PDF restores only those rectangle backgrounds to the source blue. All 222 pages retain identical extracted text; 214 other page renders are byte-identical, and all eight changed pages received independent review. All 253 source comment wordings remain present. The original cover fragments, source image crops and one legacy comment list marker rendered as an outline square are retained and qualified. LAND is also explicitly a compensated derivative.

Source DATE, SAVEDATE and FILENAME fields can show September 30, 2026 export values or working-copy names. These do **not** establish a new source revision. HADDAD's cached cover date differs; Covetrus's literal 2023 cover dates and v1.4 remain. Original source quality, small screenshots, markup margins, blank pages and other source-authored limitations are preserved in the [exact layout ledger](docx-layout-continuation18.json).

Work and Picking is untagged. The other exports contain structure tags, which do not certify alternative text, reading order, live hyperlinks or accessible-PDF acceptance. Existing help-app owner acceptance remains separate. Page viewing adds no source claims, settings or citation credit.

The earlier Word diagnostic did not retain the prior Options.UpdateLinksAtOpen value; historical restoration cannot be proved. C18 made no preference writes. The earlier apparent Work and Picking page 29 label loss was retracted after independent reinspection confirmed complete text. No source file was changed to resolve it.
