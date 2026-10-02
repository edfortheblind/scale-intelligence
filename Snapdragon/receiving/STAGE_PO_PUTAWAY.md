# Stage Purchase Order, Line and Putaway Group review

Observed on 2026-10-02 at `travstg.manhscale.com` after the owner renewed sign-in. All **3/3 menu destinations loaded**. Their Advanced Criteria dialogs loaded successfully; the prior Production expired-token response is retained as historical evidence, not the current Stage outcome.

The [sanitized observation receipt](../evidence/stage-po-putaway-runtime.json) contains field catalogs, interface labels, action presentation and query outcomes. Existing Production replica mappings remain reference evidence; matching form/control IDs do not prove Stage/Production configuration parity.

| Screen | Route form ID | Advanced fields catalogued | Selected-record context |
|---|---:|---:|---|
| Purchase Order Insight | 2796 | 92 | No rows returned by three inquiry variants |
| Purchase Order Line Insight | 2797 | 92 | No rows in initial inquiries or a fresh settled recheck |
| Putaway Group Insight | 2791 | 20 | Open and closed groups selected; Containers drilldown and return verified |

These are field-choice counts, not counts of validated field rules. Product purpose and expected action effects remain grounded in [the functional guide](FUNCTIONAL_GUIDE.md). This pass adds direct Stage observations.

## Purchase Order Insight

Basic Criteria exposes Purchase Order, Receipt ID, Source Name, Ship From, Item, Company, Warehouse, From/To Created Date Time and Include Closed Purchase Orders. Lookup magnifiers are shown for the five text identifiers. The date range and closed-order switch make the search scope explicit.

Advanced Criteria opens an Add dialog with **Condition, Field, Operand and Value**. Conditions are **All are met (AND)** and **Any are met (OR)**. Its 92 field choices include header/detail identities, item attributes, dates, quantities, vendor/ship-from fields, status and user-defined fields. Exact label/code pairs are retained in the receipt.

For the sampled **Item** field, the operand choices were `!=`, `=`, `contains`, `does not contain`, `is not null` and `is null`. For the sampled **Closed Date Time** field, they were `!=`, `<`, `<=`, `=`, `>`, `>=`, `is not null` and `is null`. A date picker appeared in the date-value context. Save was disabled with the required value empty in the sampled comparison state. No criterion was saved; the dialog was exited through Cancel.

The visible grid columns were Purchase Order, Company, Status, Ship From, Source Name and Color. Summary tiles were Pos, Lines, Open and Closed. Detail tiles were Receipts and Lines. The link labeled **select columns** opened **Add to Group By**, exposing 16 grouping choices. Cancel closed that dialog without applying grouping.

The Actions menu exposed **11 entries**. With no selection, New lacked the disabled class; Copy, Edit, Delete, New Line, Close, Cancel Close, Print Preview, Print Default Docs, Print Selected Docs and Receipt From PO had it. This is observed presentation, not a successful permission or service check. View was not exposed as a menu entry in that state.

Three read-only inquiries covered the default existing warehouse/open-order scope, Include Closed enabled, and Include Closed with the local Warehouse criterion cleared. Each returned an empty grid. Clearing this criterion did not change the global warehouse selector. No record ID was invented, and no PO detail or selected-action state is claimed. The absence of results applies only to these observed inquiries and access context.

## Purchase Order Line Insight

Basic Criteria exposes Purchase Order, Receipt ID, Item, Purchase Order Line Number, Internal Order Line Number, Company, Warehouse and Include Closed Purchase Orders. The two line-number inputs render as numeric editors.

The Advanced Criteria dialog has the same Condition/Field/Operand/Value arrangement and **92 field choices**. The sampled **Open Quantity** field rendered a numeric editor and offered exactly six operands: `!=`, `<`, `<=`, `=`, `>` and `>=`. This differed from the sampled text/date choices. Escape closed the unsaved dialog; no criterion or saved search was created.

The visible grid columns were Purchase Order, Purchase Order Line Number, Item, Description, Company, Total Qty, Open Qty, UM and Color. Summary tiles were Pos, Lines, Total Qty and Open Qty. Actions exposed Copy, Edit and Delete, all presented disabled without a selected row.

The default inquiry and an inquiry with Include Closed enabled and the local Warehouse criterion cleared returned no rows. A fresh repeat of the latter was checked after other work allowed the query to settle; it still showed **0 - 0 of 0 records** with no visible application error. Selected-line details and action transitions remain unvisited. This third query was a settling check, not three distinct filter scenarios.

## Putaway Group Insight

Basic Criteria exposes Putaway Group ID, Putaway Group Location, Receipt ID, Internal Group Number, Warehouse and **Show Closed Putaway Groups**. The switch was used to inspect open and closed result sets separately. Advanced Criteria exposed **20 fields**: group/receipt/container identifiers, location context, Closed, audit fields, Warehouse and eight user-defined fields.

The sampled Closed criterion offered `!=`, `=`, `contains`, `does not contain`, `is not null` and `is null`; its value list exposed **No (N)** and **Yes (Y)**. This is the rendered search editor's vocabulary. It does not establish how the separate `EnableAction_*` expressions evaluate bare symbols. No advanced criterion was saved.

The grid displayed Putaway Group ID, Warehouse and Closed. Read-only searches produced both open and closed group records. One row from each result state was selected, without retaining its identifiers or values.

| Observed selection state | Close | Open | Rename |
|---|---|---|---|
| No selection | Disabled | Disabled | Disabled |
| One closed group | Disabled | Presented enabled | Disabled |
| One open group | Presented enabled | Disabled | Presented enabled |

Disabled means the rendered action's parent carried the `disabled` class. Presented enabled means that class was absent. No Close, Open or Rename action was executed. The observed transitions agree with the documented distinction between open and closed groups, but do not prove backend eligibility, role-wide access or every configured predicate.

The **Containers** tile navigated from the selected closed group to **Receipt Container Insight `/scale/insights/2779`**, with a `filters` query parameter. Query values were omitted. Browser Back returned to `/scale/insights/2791`. This verifies a real read-only relationship rather than inferring navigation solely from `data-formId` metadata.

Control-click and Shift-click attempts each left one row selected. Multiple simultaneous selection was not established; these observations are not a general statement that the screen can never support it. No multi-record action was invoked.

The Save Search control opened **Save Search Criteria**, with **Enter a Name for The Search**, Save and Cancel. Cancel closed it without entering a name or saving. The temporary inspection tab was closed after evidence capture.

## Remaining review scope

- PO and PO Line selected-record branches need legitimate results in an accessible context; no currently displayed record was available from the inspected inquiries.
- Field-specific validation, all lookup dialogs, paging/sorting combinations and multi-selection semantics are not exhausted by the sampled states.
- Stage configuration values and service implementation parity remain unverified; the retained Production graph and [static enablement supplement](ENABLEMENT.md) keep their original provenance.
- Warehouse mutations, configuration publication, printing/exporting and operational timing were outside this read-only pass. No business row values or record keys were saved.
