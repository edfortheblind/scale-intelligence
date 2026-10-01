# Cross Application: navigation and investigation

The inspected SCALE menu groups seven entries under **Cross Application**. Start with the screen that matches the question you are investigating. The paths below were observed on October 1, 2026; availability and permissions can differ by installation.

| Entry | Purpose or observed interface | Observed route |
| --- | --- | --- |
| Configuration | Configuration application; the inspected page included Manage SOPs. | `/config` |
| Document Management Insight | Find and view image records captured through Warehouse Mobile receiving. | `/scale/insights/4105` |
| Interface Error Insight | Investigate errors reported by download/upload processes. | `/scale/insights/3054` |
| Process History Insight | Investigate recorded automated decisions and process actions. | `/scale/insights/3066` |
| RF | Separate legacy RF sign-on route. | `/RF/logon.aspx` |
| Transaction History Insight | Investigate recorded activity affecting inventory. | `/scale/insights/2783` |
| Warehouse Mobile | Operator receiving, inventory, work, container and supporting flows. | `/WarehouseMobile` |

Screen labels, filter names and empty grids were observed directly. No search was submitted, record selected, document uploaded/downloaded, configuration changed or warehouse transaction performed for this screen review. The [navigation record](warehouse-mobile-live-navigation.json) distinguishes observation from the documented procedures below.

## Find a document

**Document Management Insight** searches and displays image records captured with Warehouse Mobile's image-capture feature. For receipt photographs, use the reference recorded during receiving and the applicable reference type; the same reference text in another workflow need not identify the same record. The [image-capture procedure](WAREHOUSE_MOBILE_SHIPPING_SUPPORT_FLOWS.md#image-capture) explains the receiving-device workflow that creates these records.

1. Open **Document Management Insight**.
2. Enter the relevant **Basic Criteria** in the Filter Pane, such as **Reference ID**, **Reference Type**, **Reference Category**, **Notes**, **File Name** and **Company**.
3. Select **Apply Filter**. Matching image records appear in the **List Pane**.
4. Select a result to display its field values in the **Detail Pane**. The list identifies search results; the detail pane describes the selected record.

Source: [Using the Document Management Insight Screen](../../AIM/reading/0e58d45db8542fda040e5a9f94aa2535fa63575435190bec2e1e65bf78adbc76.md), nodes n56–n89 and n101–n136. This retained article was found through content/search references rather than the current TOC. It documents search and viewing; it does not supply upload, download, edit or delete steps for this screen.

The observed **Document Management Insight** has these Basic Criteria fields: **Reference ID**, **Reference Type**, **Reference Category**, **Notes**, **File Name**, **Company**, **Warehouse**, **From Date Time** and **To Date Time**. Its grid exposes **Reference ID**, **Reference Type**, **Reference Category**, **Notes**, **File Name** and **Date Time Stamp**.

The screen also exposes **Advanced Criteria**, a filter toolbar, column selection and an **Actions** menu. The live review established their presence; it did not establish available record actions, upload/delete permissions, file contents or a successful document retrieval. Observed fields and the retained article's field list differ in places; use the controls available in the installed screen without assuming that unobserved fields or actions are enabled.

Configuration's inspected **Manage SOPs** page is a different interface. It showed **Document Id**, **Document Upload Status**, **User** and **Date**, with **Upload Document**, **Back** and a disabled **Delete** control on an empty grid. It does not establish the behavior of Document Management Insight. No upload or deletion was performed.

## Investigate an interface error

Use **Interface Error Insight** for download/upload errors.

1. Open the screen and identify the relevant interface process and mode.
2. Set an appropriate date/time scope and available reference criteria. The observed **Today Only: Date Time Stamp** control was On, with the explicit date range disabled; this is a session observation, not a universal default.
3. The retained procedure says to apply the filter and inspect the resulting list.
4. Compare **Error Message**, **Error File Path**, **Interface Process**, **Interface Mode**, timestamp and reference information to the failed interface operation.

Other observed criteria include **Original File Path**, **Reference Field 1–3**, **Company** and **Warehouse**. A listed error does not prove that the integration was retried successfully. This screen review did not reprocess, acknowledge, clear or delete an error.

Source: [Using the Interface Error Insight Screen](../../AIM/reading/457eeece9590b897398d6f0c472b8a6330575513b8ad5e7735e631ae9ef95c8d.md), nodes n58, n72–n110, n123–n143. Its table-of-contents phrase says “Transaction History” in one place, while its title, purpose and actual procedure concern interface errors; that stray wording is not used to redefine the screen.

## Investigate a process decision

**Process History Insight** describes recorded decisions or transactions performed without user assistance, such as carrier selection. It is useful when the question is why a process chose or rejected a result.

1. Open the screen and choose the activity date/time scope.
2. Narrow the search with **Process**, **Action**, **Username**, **Message**, **Identifier 1–4** and **Warehouse**, as appropriate.
3. The documented **Apply Filter** action populates the list. Selecting a result shows its detail.
4. The **Internal ID** link opens Process History Details when the user has permission. **View** opens those details read-only.

The observed grid includes internal ID, activity date/time, process, action, message, identifiers and username. The observed Today Only control was On. Neither the empty initial grid nor a missing search result establishes that a process did not run: history generation and search scope matter.

Source: [Using the Process History Insight](../../AIM/reading/3118a85b2ef40c4390e2f60248b32195b1f48510ef15637efb83f72f6a343b59.md), nodes n58, n78–n120, n136–n190.

## Investigate an inventory transaction

**Transaction History Insight** describes recorded activity affecting inventory, including allocation or a short-pick adjustment. Use it for what changed; use process history for a recorded automated decision behind the change.

1. Open the screen and set the activity date/time and **Transaction Type** scope.
2. Narrow the search using the relevant **Location**, **Item**, **Lot**, **LP / Container ID**, **Serial Number**, **Reference ID** or work context, where available in the configured criteria.
3. Apply the filter. Select a resulting record to read its detail.
4. The documented **Internal ID** link or **View** action opens Transaction History Details read-only.

The inspected basic criteria also include **Username**, **Work Type**, **Work Team**, **Work Unit**, **Warehouse**, **Company** and **Internal Key ID**. Grid columns include quantity/UOM, catch weight/UOM and direction as well as identifiers and activity type. Those are field labels; no values or records were collected.

Source: [Using the Transaction History Insight](../../AIM/reading/a307963948eb2a4fc30f644f6e1ed63eea892c4e29103ac93dda1c8a66ba1e1d.md), nodes n58, n80–n170, n187–n243. Both retained history articles contain a copied sentence about “receipt quality records” in their searching section; their own purpose, fields and procedures identify process history and transaction history respectively. No receipt-quality equivalence is inferred.

History generation is configurable by history type. The retained setup article describes **Create History?**, separate interface-upload settings for transaction history, and process/disposition choices for quality history. Read the configured scope when interpreting missing history; this guide does not change it. [Activating History Generation](../../AIM/reading/c1f987ef5b25e6273de7d929b583896c0e693a500ab220b61f4bd1500e528c11.md), nodes n58–n71 and n108–n122.

## Open Warehouse Mobile or the separate RF entry

For Warehouse Mobile, use the [operator guide](README.md) and [all-flow catalog](WAREHOUSE_MOBILE_SOURCE_CATALOG.md). Menus can lead to multiple conditional workflows; a visible menu item is not the full workflow denominator.

The separate legacy **RF** route displayed a notice that the user was already signed into an RF session and that **Continue** would start a new one. Continue was not selected. Selecting **Cancel** led to a signed-out message; the effect on the pre-existing legacy RF session was not independently verified. Warehouse Mobile subsequently remained usable in the inspected browser session. These observations are not a general sign-on/cancellation rule. No replacement RF session was started, and no credentials were entered.

## Observed mobile navigation limits

The empty **Nest** branch reached through Multiple Order Pallet Nesting, and the empty Receipt Container Nesting screen, each retained its title after **Back** removed the input. Go then appeared enabled. No identifiers or Go were submitted. Reloading the page restored the main menu. These are recorded observations, not proof of a data mutation or rollback; confirm intended exit behavior in the installed screen flow before relying on it during an actual operation.

Work Execution was not opened during this read-only review. The retained sources document default-profile bypass, automatic work selection and cart assignment before Go. Its full source-described sequences are documented in the [work guide](WAREHOUSE_MOBILE_WORK_FLOWS.md#entry-and-profiles).
