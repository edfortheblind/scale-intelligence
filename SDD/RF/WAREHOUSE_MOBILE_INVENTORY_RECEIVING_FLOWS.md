# Warehouse Mobile: receiving, inventory and counting

This guide explains the operator sequences described in the retained SCALE AIM help for receiving, inventory changes, location inquiry, cycle counting and closing putaway groups. Each procedure identifies its inputs, conditional prompts, completion action and documented exceptions. **These are source-described procedures, not a recorded execution in an installed warehouse.** Menu availability, security, user defaults, screen-flow definitions and configuration determine which steps actually appear.

An **LP** is a license plate identifying a container or inventory grouping. A **UOM/UM** is a unit of measure. An **SRC identifier** selects a Warehouse Mobile screen flow; it is not proof that a particular menu exposes that flow. Checking in makes received product inventory and creates receipt containers; locating selects their destination. Counting, adjusting, transferring, freezing and closing are operational actions and can change records or create work.

Use the source references beside each procedure for exact publisher text and figures. Node numbers identify elements in the corresponding `AIM/data/articles/<article-id>.json` file and `data-source-node` markers in its reading copy. The source register at the end supplies the exact article identities. The retained articles were captured on September 29, 2026; their text does not establish the installed SCALE release or the availability of every described feature.

## Flow coverage

| Source flow or family | Procedure here | Evidence boundary |
| --- | --- | --- |
| Receiving 30; LP receiving 50; Blind 350; Trailer-Item 420; Header-LP 430; Trailer-LP 440; Item 450 | [Initiation](#receiving-initiation), [blind receiving](#receiving-appointments-blind) and their common branches | Dedicated sequences or explicitly limited narrative are distinguished below. |
| Receipt work execution 60 | [Receiving and locating](#receiving-locating) | Catalog names a separate work-execution flow; receiving check-in steps do not establish its entire confirmation sequence. |
| Inventory transfer work 140; inventory adjustment work 150 | [Work-driven inventory](#inventory-work) | Named catalog flows; do not substitute the no-work inventory procedures for assigned work. |
| Inventory transfer by LP 200; by item/location 220 | [Inventory transfers](#inventory-transfers) | Dedicated procedures. |
| Inventory adjustment 230; adjustment by LP 280 | [Inventory adjustments](#inventory-adjustments) | Positive adjustments have dedicated steps; negative behavior is only partly described. |
| Inventory status change by location 370 | [Inventory status](#inventory-status) | Dedicated sequence and location-attribute limitation. |
| Warehouse transfer by item/location 390; by LP 400 | [Warehouse transfers](#warehouse-transfers) | Item/location steps are supplied; the LP-specific sequence remains a source gap. |
| Location inquiry 270 | [Inquiry and its actions](#location-inquiry) | Search and operational actions are separate. |
| Cycle count 80; add item 210; reconcile 260 | [Count](#cycle-count), [add item](#count-add-items), [reconcile](#cycle-count-reconcile) | Blind counting is a configured branch with its own article. |
| Close putaway group 40 | [Close putaway group](#close-putaway-group) | Closing can create work; automatic closure is configuration-dependent. |

The numeric mapping comes from [Warehouse Mobile Screenflow][F], nodes n109–n134, n164–n209, n224–n238 and n273–n323. Separate [receipt-container nesting](WAREHOUSE_MOBILE_SHIPPING_SUPPORT_FLOWS.md#receiving-container-nesting) and [immediate dock transfer](WAREHOUSE_MOBILE_SHIPPING_SUPPORT_FLOWS.md#immediate-dock-transfer) are in the support guide. Nesting during receiving remains below because it changes the receiving session itself.

<a id="receiving-initiation"></a>
## Receiving: choose the initiation method

Select **Receiving**. The documented next screen is **Select receiving preference**. A preference assigned to the user profile loads automatically and can bypass that selection. Authorization determines the preferences available. The preference controls both the identifier that starts a receipt and the execution method that determines when check-in, locating and work creation occur. Opening the screen is not a test transaction; entering an identifier and pressing **Go** can start processing. [R], nodes n151–n158, n723–n729, n811–n813.

### Header-Item, SRC 30

1. Select the appropriate receiving preference if prompted.
2. Enter or scan **Receipt ID**, then **Go** to reach **Receipt Initiation**.
3. Enter or scan **Item**. At **Receipt Check In**, review the item, description, quantity and UOM. Choose a different available UOM if appropriate.
4. Enter **Quantity** and select **Go**. Complete reason/disposition, LP, lot, serial, inventory-attribute and other prompts described below when configured.
5. Manual LP assignment asks for the LP; system assignment generates it. Successful item check-in returns to the receipt-initiation/item-entry flow. Locating and completion depend on the execution method; do not equate this return with completed putaway.

An item cross-reference can require item selection. The process checks whether the chosen item has open quantity on the receipt; if not, it returns to item entry. Multiple applicable receipt lines require selection. UOM conversion quantities appear when configured; with only one UOM the selector is disabled, and the storage-template UOM is used when no item UOM is defined. Quantity verification can hide the displayed quantity/open quantity. [R], nodes n147–n173, n780–n821, n842–n860; [K], n180–n192.

### License Plate, SRC 50

1. Select a preference using **License Plate** initiation.
2. Enter or scan the **License Plate**.
3. Supply reason and disposition codes if enabled, then **Go**.
4. The documented success is receipt check-in. With **Check in and Locate**, use **Done** to proceed with the queued locating work.

For a nested parent LP, additional child-container behavior applies below. A locate-pending LP is also eligible for the documented locate-receipt-container branch when using the supported locating execution methods. [R], nodes n184–n198, n450–n467, n537–n542.

### Trailer ID-Item, SRC 420

1. Select a preference using **Trailer ID-Item**.
2. Enter or scan **Trailer ID**, then **Go**; enter the **Item** associated with that trailer.
3. If the trailer/item matches multiple receipt lines, select the required line from the displayed choices.
4. Enter **Quantity**, then **Go**; enter the requested **License Plate**, then **Go**.
5. Confirm the receipt-check-in success message. Continue according to the configured execution method.

The source separates single-receipt and multiple-receipt scenarios; it does not require a receipt-line chooser when only one relevant line exists. [R], nodes n223–n245.

### Trailer ID-License Plate, SRC 440

1. Select a preference using **Trailer ID-LP**.
2. Enter or scan **Trailer ID**, then **Go**. Enter or scan its **License Plate** when prompted.
3. Supply reason/disposition codes if enabled and select **Go**.
4. The check-in success message appears. Select **Done** for **Check in and Locate** processing.

[R], nodes n247–n262.

### Header-License Plate, SRC 430

1. Select a preference using **Header-License Plate**.
2. Enter or scan **Receipt ID**, then **Go**; enter **License Plate**, then **Go**.
3. For lot-controlled items, supply **Lot ID** and **Expiration Date**; select **Inventory Status**. Supply serial numbers for serial-tracked items and reason/disposition codes when enabled.
4. Use **Actions > Done** to locate. The documented completion message confirms check-in and locating.

These steps describe the source's Header-LP example; the actual prompts still depend on the item and preference. [R], nodes n266–n283.

### Item, SRC 450

1. Select a preference using **Item** initiation.
2. Enter or scan **Item**, then **Go**. Select the applicable receipt line when requested.
3. Enter **Quantity**, then **Go**.
4. With **Check in and Locate**, use **Done** to continue locating.

Receipt-line selection is described when an item is associated with multiple companies across open receipt lines, or when its cross-reference maps to multiple open lines. [R], nodes n284–n304.

<a id="receiving-attributes"></a>
## Receiving: inventory attributes and GS1 inputs

### Inventory attributes

The documented attribute-enabled receiving flow supports Header-Item and LP initiation. Configuration uses `ReceivingInventoryAttributes.json` for Header-Item and `ReceivingLicensePlateInventoryAttributes.json` for LP initiation, with the screen flow mapped to the receiving preference in **Warehouse Mobile Menu**. This is a configuration prerequisite, not an instruction to change a live menu while receiving.

During check-in, enter **Inventory Attributes 1–20** as prompted. **Go** saves an entered attribute; **Go** without a value skips that attribute. After saving one or more attributes, **Actions > Done** completes the check-in process described by this branch. The source does not specify a separate cancel/rollback action for attribute entry. [R], nodes n201–n220.

<a id="gs1-scanning"></a>
### Multi-segment GS1 scanning

Warehouse Mobile uses configured label types, application identifiers and mapped fields. Its GS1 behavior differs from the legacy RF receiving flag/template model. Supported formats, priority between matching labels, fixed/variable-length identifiers and FNC1/group-separator handling belong to that configuration. A mapped field must match the SRC JSON field's `name`. **Auto Fill** can populate a value without confirmation; **Auto Execute** can trigger execution when the populated field supports it. A scan must therefore not be treated as a harmless preview. [G], nodes n57–n106.

1. Start the receiving or work transaction intended for the configured barcode format.
2. Scan in its current input field. Receiving item scans consider item formats; lot scans consider lot formats.
3. SCALE matches the label and parses/mapping its elements when supported. Review populated values and complete remaining required prompts.
4. If item data includes lot and expiration date, the corresponding lot-entry pages can be skipped. An item-only/GTIN scan leaves the other required prompts for later. A cross-reference associated with a UOM supplies that UOM to quantity entry.
5. Complete the transaction's ordinary remaining steps; a successful parse is not the transaction's final completion.

If no supported label matches or parsing fails, the source says the value is treated as a normal barcode. A receiving value that does not match the configured format can then produce the normal validation error for the current step. This is not a promise that any malformed GS1 barcode will be accepted. Work execution uses the same configured mapped-field principle; no single barcode pattern or identical field set is universal. [G], nodes n118–n124, n148–n167, n174–n190.

<a id="receiving-checkin-variants"></a>
## Receiving: conditional check-in branches

### Catch weight

The documented catch-weight receiving branch is **Header-Item**. After receipt, item, quantity and other required receiving inputs, a catch-weight item opens **Catch Weight Entry**. System-assigned LPs are created before this prompt; manually assigned LPs must be entered first. Select the catch-weight UOM and complete weight entry for **each** LP created. The configured receiving flow then continues into locating and optional work creation while retaining the captured catch weight. The article does not establish the same support for every other initiation method. [R], nodes n174–n182.

### Lot, expiration, frozen state and status

For a lot-controlled item with a configured lot template, enter **Lot**, then **Expiration Date** as prompted. Template autofill can populate both, including a configured custom date format. Without a lot template, the documented prompts are **Lot > Expiration Date > Frozen > Inventory Status**; the expiration date may be left blank in this described branch. **Frozen** initially defaults to No; choosing Yes supplies the configured frozen inventory status. [R], nodes n352–n394.

When the receipt line has no lot and an existing lot is entered, its expiration date, frozen state and status may be supplied. The article specifically describes an existing frozen-lot branch that skips expiration/frozen-state validation and proceeds to **Inventory Status**, and an existing-lot branch that steps through the supplied values. Do not assume all lots get the same editable prompts. [R], nodes n396–n413.

Changing an existing lot's expiration date, moving from frozen to unfrozen inventory status, or changing **Frozen** from No to Yes opens **Confirm Lot Update**. Review lot, item, description, company, warehouse, before/after expiration and inventory state, and affected locations/containers. The text establishes this review screen, but does not name its exact accept/reject buttons or promise transaction rollback on leaving it. [R], nodes n416–n423.

### Multiple LPs and quantities

With storage-template **Group during check in = No**, quantities crossing UOM groupings can create multiple receipt containers and LP prompts. The source example converts 65 EA with 10 EA/CS and 50 EA/PL into one 50-EA pallet container, one 10-EA case container and one 5-EA container. **Group during check in = Yes** produces a single LP prompt in the described case.

For each split container, expect the applicable lot, expiration, frozen, serial, inventory-status, putaway-group, reason and disposition prompts. Work-special-handling quantity validation and quantity-display suppression are additional conditions. Never reuse a single container's confirmations as proof that all split containers finished. [R], nodes n425–n437, n789–n821.

### Serial numbers

Enter one serial number for each required unit: one prompt for a single unit and repeated entry for multiple units. Duplicate serial numbers are rejected; **Go** is disabled for a duplicate. Configured serial-number templates are validated. The source does not enumerate every serial-template error message. [R], nodes n472–n480.

### Reason and disposition codes

When enabled in **Receiving Preference > Workbench**, select an active code from the field's list or scan the code. **Go** continues check-in. Invalid scanned values produce an error. The source says a reason code is prompted and the disposition field may be left blank when that reason is assigned to a disposition code; it does not establish that either field is always optional. [R], nodes n525–n534.

### Multiple receipt lines

The selection screen displays receipt-line choices as a slider, with a position such as `1/3`. Move through the choices and select the intended line. This is a documented presentation, not an accessibility validation of the slider on a particular device. [R], nodes n468–n470.

### Inbound quality inspection

The described receiving QC branch supports **Header-Item**, requires the item to be eligible for inbound QC, and requires **QC inspection active** in the receiving preference.

1. Enter receipt, item and quantity during check-in.
2. Review the prompt identifying the QC amount and asking whether to continue.
3. **No** closes the prompt and returns to check-in; the user may cancel or modify the quantity and submit again.
4. **Yes** processes check-in, splitting the QC and remaining quantities.
5. **Actions > Done** submits the resulting containers for locating.

QC triggers the first time a receipt line is checked in and is processed separately for different receipt lines of the same item. Without a configured QC-amount UOM, calculation uses the base UOM. [R], nodes n482–n524. Shipping container QC is a separate process in the support guide.

### Nest during check-in and receive a nested parent

With **Nest During Check In** enabled, the end of check-in asks for parent LP, container type and locating rule, then nests that session's containers into the parent. Supported execution methods in this article are **Check in**, **Check in and Locate**, and **Quick Receive-User**.

- **Cancel** returns to item entry and leaves these receipt containers available for nesting.
- **Skip**, when authorized by the documented receipt-container Skip security, returns to receipt-ID entry and removes those checked-in containers from this nesting session's available set. This does **not** say their earlier receipt check-in is reversed or inventory is deleted.

For a nested parent supplied through the receipt interface, scanning the parent LP checks in its child containers too. If reason/disposition prompts are enabled, they occur for each child. Listed supported children are ordinary items, lot-controlled items with the lot already specified, inbound/inventory serial-tracked items whose serials were supplied in the interface, and outbound serial-tracked items. Other combinations are not established by this passage. [R], nodes n439–n467. For independent nesting after receiving, use [Receipt Container Nesting](WAREHOUSE_MOBILE_SHIPPING_SUPPORT_FLOWS.md#receiving-container-nesting).

<a id="receiving-locating"></a>
## Receiving: execution, locating and Quick Receive

| Execution method | Documented processing point and result | Putaway work |
| --- | --- | --- |
| Check In | Check-in only; the method table identifies Done/batch processing, while the detailed flow describes check-in ending after container execution. Follow the installed preference's actual prompts. | No. |
| Check In and Locate | Checked-in containers are queued; **Done** starts locating. | If configured. |
| Check In and Locate (Immediate) | Check-in and locating execute immediately using the relevant locating rule. | If configured. |
| Quick Receive-User | User completes location confirmation for each container after check-in. | No. |
| Quick Receive-System | System attempts a location and presents it, or asks for a location when none is found. | No. |

The main article's execution-method table explicitly lists the first four; its separate Quick Receive section establishes the System variant. The supplementary Check/Locate article lists only Check In and Immediate and uses older **OK** wording. Preserve that difference; neither incomplete table is a universal installed-method list. [R], nodes n306–n340, n650–n718, n861–n868; [K], nodes n87–n137, n182–n194.

### Quick Receive sequence

1. Complete check-in and select **Actions > Done** to open **Quick Receive** in the described User flow.
2. Enter/scan or review the destination for the current receipt container, then **Go**.
3. With multiple containers, repeat for each prompted container until all are located.
4. Supply check-digit and location verifications when configured.

**Actions > Skip** returns a single-container case to receipt entry; with multiple containers it advances to the next container. That navigation does not establish that a skipped container was located. [R], nodes n309–n329, n345–n351.

With **Bypass Location Capacity Validation** enabled, the documented affected checks are dimensions, weight, volume and item/location capacity. For Quick Receive-User they are bypassed; for Quick Receive-System bypass applies when the user overrides the system-selected location. **Override System Selected Location** permits an alternate putaway location during LP check-in in Quick Receive-System; the source excludes use of that setting with Quick Receive-User. These are conditional behaviors, not recommended defaults. [R], nodes n331–n343.

### Locate a receipt container

LP initiation with **Check in and Locate** or **Check in and Locate (Immediate)** can process an LP in **locate pending** status. A locating rule with **Delayed Locating** sends the receipt container to the pre-locate location. **Execute putaway groups** in the preference starts the group branch. The retained article describes these eligibility/behavior rules but does not supply a distinct complete SRC 60 receipt-work confirmation procedure. [R], nodes n537–n542; [F], n124.

A receipt with a Closed Date cannot accept receipt-line check-in. The source separately allows functions on existing receipt containers, including check-in, locate and unlocate; do not generalize the line restriction into a prohibition on every existing-container action. [R], n647; [K], n59.

<a id="receiving-appointments-blind"></a>
## Receiving: appointments and blind receipts

If a receipt's scheduled appointment has a different dock door from the receiving preference, the documented check-in uses the appointment's door and updates inventory there. This is a source precedence rule; it is not proof of the warehouse's appointment or default dock values. [R], nodes n543–n546.

**Blind receiving, SRC 350**, creates receipt header/detail records from the information entered during check-in. It can also add detail to an existing receipt in the user's default warehouse. Inventory attributes can be captured, and the user must have a suitable receiving preference. The retained Receiving article explains this behavior and its lot-template support, but does not enumerate a complete blind header/detail screen sequence or every required header field. Do not substitute Header-Item's existing Receipt ID sequence as a proven blind-receiving procedure. [R], nodes n357–n368, n548–n554; [F], n273.

When Blind initiation and **Execute group putaway** are enabled, a checked-in LP located in a Putaway Group Location triggers group creation/assignment. The documented putaway-group rules below then qualify this branch. [R], nodes n550–n554.

<a id="receiving-putaway"></a>
## Receiving: assign and close putaway groups

With **Check In and Locate (Immediate)** and an existing group found for the located receipt container, **Assign Putaway Group** displays location, group ID, LP and quantity. After the normal receipt/item/quantity prompts, **Go** assigns/checks in and returns to **Receipt Initiation**. [R], nodes n556–n576.

For a new group, a manual assignment method prompts for the **Putaway Group ID**; a system method generates it. **Verify group ID** requires verification for new or existing groups under either assignment method. Enter the new ID when prompted, then **Go**. Multiple LPs can be assigned to different groups, and different locations can use different manual/system and verification settings. The source describes per-LP assignment; it does not require every LP to share one group. [R], nodes n578–n615.

Use **Actions > Assign and Close** for the final LP when assignment and group closure should occur together. **Maximum Units** can automatically close a group when assigned LP quantity equals or exceeds the threshold; multiple groups can open/close while processing multiple LPs. For an independently selected existing group, use the [Close Putaway Group procedure](#close-putaway-group). [R], nodes n618–n628.

<a id="receiving-configuration"></a>
## Receiving prerequisites and source differences

The operator flow depends on receiving-preference authorization/defaults, initiation/execution method, LP assignment, locating rules, item/UOM/storage templates, lot/serial settings, work special handling, reason/disposition settings, QC eligibility, and optional putaway groups. The guide does not infer any effective value for those settings.

The Receiving article says a preference created through **Warehouse Mobile Menu** is added under Receiving, with SRC 30 for Header-Item, SRC 50 for LP, and a null SRC for other initiation methods in that described automatic association. It also says upgrades retain existing preferences. Its own detailed sections and the broader screen-flow catalog list additional initiation methods. Thus that two-method automatic-association passage must not be used to deny the existence of Trailer/Item/Header-LP flows, nor as proof those flows are automatically assigned on the installed release. [R], nodes n630–n640, n223–n304; [F], nodes n308–n323.

The older supplementary Check/Locate article says **Done** returns from item entry to receipt-ID entry for Header-Item plus Check In. Its **OK** labels and smaller tables are retained source differences; use the main article's named **Go/Actions** steps where supplied, and verify the installed labels separately. [K], nodes n184–n194.

<a id="inventory-transfers"></a>
## Inventory transfers without assigned work

**Inventory Management** opens **Select Adjustment Class**. The article distinguishes no-work adjustment/transfer SRCs from execution of an already assigned work unit. Quantity, LP/lot/serial tracking, status permissions and location attributes determine the prompts. [I], nodes n57–n78.

### Transfer by license plate, SRC 200

1. Select **Inventory Management > Transfer** to reach **Select Adjustment Type**, then choose the transfer-by-LP adjustment.
2. Enter/scan **License Plate**, then **Go**. Review item, description, company, status, quantity and **From Location**.
3. Enter **Quantity** to move and **To Location**.
4. Change **Status To** only when permitted.
5. Select **Go**; the documented completion is **Inventory transfer successful**.

The article does not name a cancel/undo step or establish that partial LP transfers follow an identical prompt sequence for every tracking configuration. [I], nodes n115–n133.

### Transfer by item/location, SRC 220

1. Choose **Inventory Management > Transfer > Transfer by item location**, then **Go**.
2. Enter **Location**, **Go**; enter **Item**, **Go**; enter the quantity to transfer.
3. Supply LP, lot and serial values when requested. The source says the LP prompt is omitted when all quantity is transferred.
4. Enter **To Location**. Alternatively choose **Actions > Locate**, select a locating rule, and let the system populate the destination. A failure to find a destination displays an error; no successful transfer should be inferred from that error.
5. Change **Status To** if authorized; supply **To License Plate** when required, then **Go**.
6. Confirm the transfer success message.

[I], nodes n135–n165. Locations carrying inventory attributes have a separate entry restriction described under [Location Inquiry](#location-inquiry).

<a id="inventory-adjustments"></a>
## Inventory adjustments without assigned work

### Positive adjustment by item/location, SRC 230

1. Choose **Inventory Management > Adjustment > Positive Adjustment** to open **Inventory Adjustment**.
2. Enter **Location**, then **Go**; enter **Item**, then **Go**.
3. Enter the quantity to add in the highlighted **Quantity** field.
4. Supply LP for LP-tracked inventory, lot for a lot-controlled item, an expiration date for a new lot when appropriate, and serial numbers for the adjusted quantity when required.
5. Select **Actions > Done** to complete the adjustment.

[I], nodes n166–n189.

### Positive adjustment by LP, SRC 280

1. Choose **Inventory Management > Adjustment** and the applicable LP adjustment type.
2. Enter **License Plate**, then **Go**; review the populated item/location details.
3. Enter **Quantity** to adjust, then **Go**.
4. Enter the requested serial numbers for that quantity and select **Go** as the source describes.

The article omits the precise LP-type selection label between the Adjustment screen and LP entry, and does not supply a separate final success-message label for this variant. Those missing details are not inferred from the item/location variant. [I], nodes n192–n206.

### Negative adjustment and shared validations

The article states that both item/location and LP adjustments can be positive or negative, and that **Status To** is ignored or disabled for a negative adjustment. It does **not** provide a dedicated negative-adjustment screen sequence, quantity sign convention or complete error/authorization list. A negative quantity entered into the positive flow is therefore not a documented substitute. [I], nodes n72–n78, n273.

User-defined fields appear only when the relevant **Inventory Control Value** configuration enables them. Serial-template validation still applies. Changing a lot expiration date during an adjustment or transfer updates the date across **all inventory locations tied to that lot**; affected inventory is displayed and history is recorded for both lot and location updates. This is wider than the location used to initiate the transaction. [I], nodes n274–n275, n279–n281.

<a id="inventory-status"></a>
## Inventory status change, SRC 370

1. Choose **Inventory Management > Status Change**, then the **Status Change** adjustment type.
2. Enter/scan **Location**, then **Go**; enter/scan **Item**, then **Go**.
3. Supply **Lot ID** for lot-controlled items and **LP** for LP-tracked locations.
4. Select **Frozen: Yes/No** and **All Locations: Yes/No**, then **Go**.
5. Open **Status**, select the required inventory status, then **Go**.
6. Select **Actions > Done** and confirm the status-change success message.

**All Locations = Yes** updates all locations for the specified item/lot. **Frozen = Yes** uses the configured **Inventory status for Frozen lots**. These choices broaden the effect and are not harmless display filters. Locations with inventory attributes require the [Location Inquiry route](#location-inquiry); the source reports an error when status change is attempted from Inventory Management for that case. [I], nodes n208–n235, n276–n277; [L], n197.

<a id="warehouse-transfers"></a>
## Warehouse transfers

### Item/location, SRC 390

1. Choose **Inventory Management > Warehouse Transfer**, then the relevant warehouse-transfer adjustment type.
2. Enter **From Location**, then **Go**.
3. Enter/scan **Item** and select its company when prompted.
4. Enter **Quantity**, then **Go**; optionally change status and continue with **Go**.
5. Select **To Warehouse** from the list.
6. Enter/scan **To Location**, then **Go**; confirm the success message.

The article also states that parent-LP transfer is supported and warehouse transfer is available from Location Inquiry. It does not enumerate a separate Location Inquiry warehouse-transfer action sequence. [I], nodes n238–n268.

### License plate, SRC 400: documented identity, incomplete sequence

The screen-flow catalog lists **Warehouse Transfer by LP**. The retained Inventory Management article provides the item/location procedure and the parent-LP support note, but no distinct complete LP warehouse-transfer procedure. Neither ordinary within-warehouse LP transfer nor SRC 390 may be relabeled as the proven SRC 400 sequence. Required LP-specific prompts, validations, cancellation and completion remain to be established from a matching detailed source or an authorized operational walkthrough. [F], n298; [I], nodes n238–n268.

<a id="inventory-work"></a>
### Work-driven receipt, adjustment and transfer

The catalog separately names **Receipt Work Execution (60)**, **Inventory transfer work execution (140)** and **Inventory adjustment work execution (150)**. These are not the standalone transactions above. Use the work guide's [entry and profiles](WAREHOUSE_MOBILE_WORK_FLOWS.md#entry-and-profiles), [receipt putaway](WAREHOUSE_MOBILE_WORK_FLOWS.md#receipt-putaway) and [shared work types](WAREHOUSE_MOBILE_WORK_FLOWS.md#shared-work-types) for their documented common behavior. The articles in this guide do not establish complete dedicated prompt sequences for those three SRCs; preserve that limitation when mapping the catalog. [F], nodes n124, n164–n169; [I], n72.

<a id="location-inquiry"></a>
## Location Inquiry, SRC 270

### Search and inspect

1. Select **Location Inquiry**.
2. Enter any combination of **Location**, **Item** and **LP** criteria, then **Go**. Criteria match the **beginning** of a value: `LP` matches `LP12345`, not `123LP45`.
3. Review the record counter, location/item, inventory status, on-hand quantity and UOM. The source includes current-warehouse inventory records carrying on-hand, in-transit, allocated or suspense quantities.
4. Open the information control for detailed location/item information; for serial-tracked inventory the on-hand information control lists serials.
5. **Go** advances to the next record. **Actions > Previous Record** returns to an already viewed record. **Actions > Cancel** returns to search.

The inquiry page also exposes operational actions; an inquiry result does not make those actions read-only. [L], nodes n57–n95.

### Adjust from the current record

Choose **Actions > Adjust**, select the adjustment type, enter quantity and **Go**, select inventory status and **Go**, complete enabled user-defined fields, then **Actions > Done**. Lot/LP values are requested when applicable. The current result supplies the inventory context; this is not a fresh unrestricted transaction selector. [L], nodes n108–n124, n194.

### Change status from the current record

Choose **Actions > Status Change**, select its option, review item/description, select **All Locations**, and supply required LP/lot values. Select the new **Status** and **Go**. Where configured, inventory-attribute prompts follow and another **Go** completes the described success sequence. Preserve the article's conditional prompts rather than assuming the first success display is the last prompt in every configuration. [L], nodes n127–n146.

### Transfer from the current record

Choose **Actions > Transfer**, select the transfer adjustment, enter quantity and **Go**, enter **To Location** and **Go**, select **Status To** and **Go**, complete configured inventory attributes and any required user-defined fields, then **Actions > Done**. Confirm the transfer success message. [L], nodes n147–n168.

### Edit attributes

**Actions > Edit Attributes** appears only when **WM Capture inventory attributes** is enabled. Existing values are populated; add/edit **Inventory Attributes 1–9**, then **Actions > Done** to save. This is a modifying action. The source explicitly says transfer/status change for a location with inventory attributes cannot be performed from the separate Inventory Management screen, directing attention to this inquiry-context capability. [L], nodes n172–n197.

<a id="cycle-count"></a>
## Cycle count work, SRC 80

Cycle counting compares physically counted stock with the system's expected stock. The work profile, count preference and work special handling determine initiation, verification, tolerance and LP behavior.

1. Open **Work Execution** and choose a profile that supports counting. A user-directed profile requests a **Work Unit**; the documented system-directed count sequence requests a **Location**.
2. At **Cycle Count Confirmation**, inspect item/location details when needed. The information controls show location on-hand/allocated/in-transit quantities, item details/image, and system/converted quantity.
3. Enter the physically counted **Quantity** and **UM**. The displayed conversion factor matters: entered quantities represent multiples of that factor. The system quantity defaults to the highest evenly divisible UOM, otherwise base UOM.
4. Supply configured item, location, check-digit and LP verifications. Non-LP locations require the item quantity. System-initiated LP mode supplies the LP to count; user-initiated LP mode asks the user to scan/enter it.
5. Select **Go** to confirm. If **Verify bad count** is enabled and the count differs from the system value, review its confirmation prompt; **Yes** confirms the entered count. Tolerance configuration also affects the result.
6. Complete the location using the actions below, then continue to the next location. When all counts on the work unit are confirmed, the system returns to work-profile initiation.

For converted-UOM counting, open **UM**, choose the appropriate item UOM, enter quantity and **Go**. Counting an empty location uses the applicable configured count/verification choices; the article does not supply one universal empty-location confirmation message. [C], nodes n91–n129, n217–n288.

| Action | Documented effect |
| --- | --- |
| Go | Confirms the current item quantity. |
| Skip | Ignores the current count request and advances to the next available request. |
| Cancel | Stops processing the current cycle-count work unit; rollback of earlier confirmed counts is not stated. |
| Done, single-item location | Completes that location and presents the next location. |
| Done, multiple-item location | Warns that unconfirmed counts may be removed. **Yes** closes unconfirmed counts for that location and proceeds. |

Do not use **Done** merely to leave an unfinished multiple-item count without reviewing its consequence. [C], nodes n217–n240.

<a id="count-add-items"></a>
## Add items or LPs during counting, SRC 210

**Add New Item** security is required. **Actions > Add Item** is available from count confirmation and from the Done action menu; the latter returns to confirmation. The last count location is used in the detailed add-item sequence. [C], nodes n130–n146, n290–n309.

1. Select **Actions > Add Item** for stock physically found but not recorded at that location.
2. At an LP-tracked location, enter the **LP**, then **Go**.
3. Enter/select **Item** and **Company**. Company choices depend on warehouse/company authorization. If a cross-reference maps to several items, select the correct item from the source-described slider.
4. Complete enabled inventory attributes and item-tracking prompts. For lot-controlled stock, supply **Lot**, **Expiration Date**, **Frozen** and **Inventory Status**. An existing lot supplies its date/state; choosing Frozen = Yes defaults frozen status. For non-lot stock, the status configured in Inventory Control Value is supplied for selection.
5. Enter **Quantity** and **UOM**, then **Go**. The source says the ordinary add-at-location quantity is set to suspense and returns to count confirmation; it also describes tolerance-controlled handling in the detailed sequence. Continue the count rather than treating addition as universal final reconciliation.

When **WM Capture inventory attributes** is enabled, this article describes attributes **1–9** and permits **Actions > Done** to skip them. This range differs from the blind-count article's 1–20; preserve the flow-specific source distinction. [C], nodes n144–n175, n300–n348.

For a new LP at a single-item location, the item defaults. Adding through **Add Item** requests LP, item, company, lot and quantity. Within-tolerance counts of new LPs can be placed in **Pending Review** when **Set new license plates to pending review** is enabled. Without work special handling, the source describes standard count with system-initiated LP selection. [C], nodes n194–n209.

Existing-lot date/frozen-state changes open **Confirm Lot Update**, showing before/after state and affected locations/containers. Serial numbers are captured per unit; duplicates disable **Go**, and serial-template rules apply. **Actions > Cancel** stops add-item processing and returns to count confirmation; it is documented at Lot, Expiry Date, Frozen and Inventory Status selection/validation. The source does not establish rollback of previously confirmed stock. [C], nodes n178–n193, n211.

<a id="blind-cycle-count"></a>
## Blind cycle count

Work special handling must select blind counting. The screen initially shows **Location ID**, withholding the expected item information so the user counts the stock physically present.

1. Select the supporting profile through **Work Execution**, enter/scan **Work Unit**, and review the location.
2. Enter/scan **Item**; select company when required. Supply **Lot ID**, **LP ID** and serials according to tracking.
3. With the attribute-capture exit point enabled, enter attributes **1–20**; **Go** saves or skips each.
4. Enter **Quantity** and **UM**, then **Go** to submit that count.
5. The flow returns to item entry for the next item at the location. Repeat for all physically present stock.
6. Only after counting all items, select **Actions > Done**. Remaining item quantities/count requests at that location are treated as **zero/empty**.

**Actions > Skip** skips all instructions at the location; at the last location it returns to the first. Skip is unavailable after a location is completed. **Done** from any blind-count screen applies the empty-remaining-request rule; it is not a neutral exit. [B], nodes n84–n118.

**Verify Bad Count** prompts when entered quantity is above/below the system count; **Yes** confirms the entered quantity. For within-tolerance LP counts, **Set new license plates to pending review** produces Pending Review when enabled; when disabled, the documented request closes and on-hand quantity updates. Work special handling takes precedence over location configuration for the stated verifications. [B], nodes n121–n137.

The article permits adding missing item/lot/LP inventory, capturing attributes while counting or adding, and selecting among multiple items mapped to a cross-reference. Counting the expected number of LPs closes count requests and work instructions; a differing LP count redirects to quantity counting for each LP and reports the mismatch. An empty LP-tracked location has a **Verify empty** screen, but the article does not enumerate its buttons. No complete blind-specific Cancel sequence is supplied. [B], nodes n138–n146.

<a id="cycle-count-reconcile"></a>
## Cycle count reconciliation, SRC 260

Reconciliation corrects a count after a supervisor identifies an inaccurate count. It is separate from entering the original count.

1. Select **Cycle Count Reconciliation** from the Warehouse Mobile menu.
2. Enter **Location**, then **Go**.
3. Review location, item and any lot. **Counted** shows the quantity/UOM entered during the original count; its information control provides detail.
4. Enter or verify **LP ID** for an LP-tracked location. Supply serial numbers for serial-tracked items; configured templates are validated.
5. In the highlighted **On Hand** field, select another UM if appropriate, enter the corrected on-hand value and **Go**.
6. A successful reconciliation displays a message and presents the next location/request.

The detail-page location quantities reflect the time of **reconciliation**, not the time of the original count. **Cancel** returns to the reconciliation screen. **Skip** advances to the next request meeting the entered location criteria; skipped records are not processed and remain **Pending Review**. The article does not enumerate all authorization/tolerance error messages or a rollback action. [Q], nodes n86–n118.

<a id="close-putaway-group"></a>
## Close Putaway Group, SRC 40

An existing group with item quantity assigned can be closed independently of the receiving session.

1. Select **Close Putaway Group** from the Warehouse Mobile main menu.
2. Enter/scan **Putaway Group ID**, then **Go**.
3. Select **Close** from the action buttons.
4. Confirm the success message. If receiving preferences are configured to create work, **work creation occurs at this point**.

Assignment can also close a group automatically when its total assigned LP quantity reaches or exceeds **Maximum Units** in Putaway Location Group. For example, 3 EA plus 1 EA reaches a four-unit limit; separate nine-unit containers can close separate groups when the limit is nine. The source does not provide a cancel/reopen/undo sequence. [P], nodes n57, n70–n89. See [Assign and Close](#receiving-putaway) for closure during receiving.

## Source coverage and remaining limits

The procedures above cover the textual branches in the eight primary articles, including their conditional actions and source disagreements. They do not certify every possible custom SRC, exit point, device, menu, security assignment or installed release. Source figures remain available through the linked reading copies; this guide does not invent labels that appear only in an unverified figure. Installed screen observations, if any, must be recorded separately and must not be presented as completed transactions.

The specific remaining procedural gaps are: complete blind-receipt header/detail entry; dedicated SRC 60/140/150 work-confirmation sequences; the negative-adjustment sequence; SRC 400 warehouse-transfer-by-LP; and unnamed cancel/undo/error details explicitly identified above. A listed flow is counted as a documented identity even when its end-to-end sequence is incomplete. Source coverage is not the same as live operational verification.

## Source register

Each reading copy has a matching JSON record at `AIM/data/articles/<article-id>.json` containing its original source path/hash and node tree. References below are retained SCALE AIM sources, not site-specific implementation documents.

| Ref | Retained article and exact ID |
| --- | --- |
| R | [Warehouse Mobile Receiving][R] — `21b18b42c82e530935c24cb0848bb4d666bef09aa74cbd6ce61dd8b24e457e99` |
| I | [Warehouse Mobile Inventory Management][I] — `a565889030eee150ec84ace9cab22bf3668bab7fb4030ad068c3021a5ab3d20c` |
| L | [Warehouse Mobile Location Inquiry][L] — `2911d55cf9d9a1c1273285ae061dfab08218101065ff163248aab18e2d76f015` |
| C | [Warehouse Mobile Cycle Count][C] — `e9ce2d02e2d39cac6a47697cf78ba14b45aaf87d69152dc75acae644a4ca56d2` |
| Q | [Warehouse Mobile Cycle Count Reconcile][Q] — `078c69cbff5a2d878611ac79eff6e854f011cc45e4d8ecf57c913b9d268302da` |
| B | [Warehouse Mobile Blind Cycle Count][B] — `b35f0114248df2731e2400834bb21b5491a272ef2c5fcc94d214230a1791b787` |
| G | [Multi-segment GS1 Scanning in Warehouse Mobile][G] — `2e8171877539bdbffdfa160ee3f30d460493fc74f832968713781c998bca6df4` |
| P | [Warehouse Mobile Close Putaway Group][P] — `4bf6394a506302ab51f0d295d2c6159739380cb3fe96ba50f65972a616dbcf87` |
| K | [Check In and Locating Product (Warehouse Mobile)][K] — `620c5c3924c58c272052441d161d77f6253d53c18676d34031fc6b3442a99ea8` |
| F | [Warehouse Mobile Screenflow][F] — `716ff5168b6f055fc5123a31137c7c9773f29a0ef92749e52b5a9abbe9f8e64b` |

[R]: ../../AIM/reading/21b18b42c82e530935c24cb0848bb4d666bef09aa74cbd6ce61dd8b24e457e99.md
[I]: ../../AIM/reading/a565889030eee150ec84ace9cab22bf3668bab7fb4030ad068c3021a5ab3d20c.md
[L]: ../../AIM/reading/2911d55cf9d9a1c1273285ae061dfab08218101065ff163248aab18e2d76f015.md
[C]: ../../AIM/reading/e9ce2d02e2d39cac6a47697cf78ba14b45aaf87d69152dc75acae644a4ca56d2.md
[Q]: ../../AIM/reading/078c69cbff5a2d878611ac79eff6e854f011cc45e4d8ecf57c913b9d268302da.md
[B]: ../../AIM/reading/b35f0114248df2731e2400834bb21b5491a272ef2c5fcc94d214230a1791b787.md
[G]: ../../AIM/reading/2e8171877539bdbffdfa160ee3f30d460493fc74f832968713781c998bca6df4.md
[P]: ../../AIM/reading/4bf6394a506302ab51f0d295d2c6159739380cb3fe96ba50f65972a616dbcf87.md
[K]: ../../AIM/reading/620c5c3924c58c272052441d161d77f6253d53c18676d34031fc6b3442a99ea8.md
[F]: ../../AIM/reading/716ff5168b6f055fc5123a31137c7c9773f29a0ef92749e52b5a9abbe9f8e64b.md
