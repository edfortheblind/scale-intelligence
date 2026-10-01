# Warehouse Mobile and RF work flows

This guide explains how an operator starts, confirms, changes and finishes documented Warehouse Mobile work: picking, putaway, replenishment, carts, totes and putwall sorting. Steps and field names come from retained AIM sources. They describe documented behavior, not an executed warehouse test or confirmation of installed settings. Use the [central SCALE functionality reference](../SCALE_FUNCTIONAL_REFERENCE.md) for the wider functional model.

A **work profile** determines how work starts and how goods are carried or put away. **Work Special Handling** controls validations, overrides and quantity options. User permissions can hide an action even when the profile supports it. A work unit groups instructions; individual instructions identify movements and quantities. Inventory license plates, shipping containers, transport totes and cart spots have different roles. [Work Execution, n105–191][WE]; [Cart Picking, n97–126][CART]; [Pick to Tote, n56–99][TOTE].

For documentation-only inspection, remain at the menu or verified configuration views: selecting a system-built-cart profile assigns containers before **Go**, and **Back** preserves the built cart. A default profile can bypass the profile selector. The sources do not establish a universally inert Work Execution opening sequence. The procedures below are for authorized warehouse operation. [Work Execution, n110–119][WE]; [System Directed, n101–135][SYS]; [System Built Cart Picking, n93–114][BUILD].

<a id="entry-and-profiles"></a>
## 1. Sign in and choose how work starts

Warehouse Mobile is documented as a native Android application with configurable JSON screen layout and flow. Prerequisites are network access, communication with the server application and server-side configuration for the chosen function. The sign-in article describes Microsoft Entra ID or AD FS; it does not establish the identity path configured here. Successful sign-in displays the Warehouse Mobile function menu. [Overview, n58–63][OV]; [Sign in, n59–74][LOGIN].

### User-directed work and container initiation

1. Select **Work Execution**.
2. On **Select Work Profile**, choose the authorized profile. An authorized default in User Profile can skip this screen.
3. Enter or scan **Work Unit**. When multiple eligible units have the same displayed ID, use the slider to inspect and select the correct one.
4. Select **Go** to enter **Pick Confirmation**.
5. Follow the displayed instruction and configured verification fields before submitting the pick.

For work tied to a shipping container, the source directs use of the container initiation method. Do not substitute an arbitrary tote or inventory LP identifier. [Work Execution, n105–121, n166–181][WE].

| Initiation family | Documented choice |
|---|---|
| User-directed | Operator supplies a work unit. |
| Container initiation | Operator identifies shipping-container work; its verification and permitted override rules apply. |
| System-directed | System chooses eligible work; location, rename and multiple-unit assignment are conditional. See [system-directed work](#system-directed). |
| Cart picking | Operator assigns containers or supported tote/work pairs, then begins picking. See [cart picking](#cart-picking). |
| System-built cart | Selecting the profile builds a cart; physically assemble its displayed containers before starting picks. See [system-built carts](#system-built-carts). |
| Pick to tote | Goods are picked into a transport tote, optionally eligible for putwall sorting. See [pick to tote](#pick-to-tote). |

These are alternative families, not a sequence every operator follows. [System Directed, n98–190][SYS]; [Cart Picking, n97–168][CART]; [System Built Cart Picking, n67–114][BUILD]; [Pick to Tote, n74–115][TOTE].

<a id="field-validation"></a>
## 2. Read and validate the screen

The current field is highlighted in blue. Scan or type its value. **Information** opens location, item or quantity detail; **Close** returns from that information view. The arrow opens available actions. **Back**, where present, returns to an earlier field or initiation/profile screen; its presence does not promise reversal of earlier actions. [Overview, n103–141][OV].

| Verification mode | Operator sequence | Effect |
|---|---|---|
| Off | Identify work, review Pick Confirmation and select **Go**. | Executes the pick, then advances to another pick or putaway. **Go** on putaway executes that putaway. |
| On | Scan/type the highlighted field and select **Go**; repeat each required field. | Valid input advances the highlight; invalid input produces an error. Passing the final verification submits the pick or putaway. |

Work Special Handling controls verification. Location verification can also be configured on the location; when both specify it, Work Special Handling takes precedence. JSON flow configuration controls presentation, so do not assume one fixed field order. [Work Execution, n126, n586–617][WE].

| Prompt | Meaning and qualification |
|---|---|
| Location | Source location from which goods are picked. |
| Item | Item identity to pick. |
| Quantity | Quantity to pick; UM, grouping and partial/short rules matter. |
| Shipping Container | Destination container when picking into shipping containers. |
| License Plate | Source tracked LP; entered LP is immediately validated. |
| Lot | Lot of the picked quantity for lot-controlled goods. |
| Check Digit | Configured digit required by the current verification step. |

[Work Execution, n123–191][WE]. If **Go** is disabled, inspect the active field and quantity restrictions. Missing actions can reflect permission, work type or configuration; they do not have one universal cause. The source gives invalid-value and immediate-LP validation behavior, not a complete error-code catalog. [Work Execution, n181, n216, n611–617, n667, n695, n747][WE].

<a id="pick-confirmation"></a>
## 3. Confirm a normal pick

1. Check work unit, source location, item, quantity and applicable lot, LP and destination container.
2. Complete the required verification sequence.
3. Supply serial numbers if requested. Serial-range entry asks for first/last numbers; **Skip** on that screen returns to individual serial entry. This differs from skipping a work instruction.
4. Complete the last verification or select **Go** in non-verify mode to submit the pick.
5. Continue to the next pick or **Putaway Confirmation** according to the flow.

A full UM container created by the wave can suppress serial entry even for serial-tracked items. The source advises against decimal quantities when picking serial-tracked goods. An absent serial prompt does not establish that an item is untracked. [Work Execution, n266–268, n592–617][WE].

### Grouped instructions and parent/child LPs

**Group picks by location or license plate** can combine instructions. For the same item, quantity is the sum of grouped picks. Putaway may also group when goods share a destination; the information view exposes the underlying instructions. Multiple-item grouping may display **All Items** and **Entire Quantity**. Quantity verification is not honored for **Entire Quantity**. [Work Execution, n283–296][WE].

With the documented parent/child grouping enabled, one pick can cover a multi-item child LP only when all its items are on the unit for their entire quantities. A parent LP can be picked once only when all children are included for full quantities. Otherwise instructions remain individual. Receipt grouping additionally depends on parent-versus-child locating. [Work Execution, n293–301][WE].

| Action | Documented effect |
|---|---|
| **Skip** | Advances without picking the current instruction. |
| **Pass** | Stops the unit and returns to initiation; group/cart rules may also unassign or remove membership. |
| **Full** | Container cannot accept more. Already picked quantity proceeds to putaway; afterward the flow returns to initiation. |
| **Partial Pick** | Confirms a portion, normally keeping remainder open unless the applicable close-after-partial rule applies. |
| **Short Pick** | Records short quantity/reason with configured inventory effects. |
| **Over Pick** | Opens the special quantity branch qualified below. |

[Work Execution, n193–265][WE]. **Pass**, **Full**, **Cancel** and **Back** are not interchangeable undo operations.

<a id="quantity-exceptions"></a>
## 4. Quantity exceptions

### Partial pick

1. Choose **Actions → Partial Pick** when available.
2. Enter actual quantity. Blank or greater-than-instructed quantity disables **Go** in the documented screen.
3. Select **Go** to return that quantity to Pick Confirmation.
4. Complete the final verification/confirmation to execute the pick.

The separate action needs permission and is unavailable with quantity verification enabled. Receipt work further restricts it to **Existing LP – Allow Override** or **User Specified** putaway verification. A full wave-created container whose allocation matches the item's UM quantity cannot be partially picked under the general rule. [Work Execution, n211–216, n260–263, n656–670][WE].

Normally remainder stays open. **Close After Partial Pick**, applicable where configured for replenishment/work-order picks, removes the remaining quantity and closes the instruction. Same-attribute batches may remain grouped; differing attributes require accepting an ungrouping prompt. [Work Execution, n263, n673–679][WE].

**Inline partial pick** is a distinct branch for containers created during picking. It requires **Prompt for Quantity** and **Verification – Quantity**; quantity is requested without the separate action. Goods may fill one new container, repeated portions in that container, or several new containers. A new container needs its type; continued partial picking into the same newly created container does not request type again. The previous container ID can be displayed for the next quantity and replaced when permitted. [Work Execution, n353–371][WE].

### Short pick

Choose **Actions → Short Pick**, enter actual quantity, provide the requested reason and confirm. Blank/excessive quantity disables **Go**; the action requires permission. Same-attribute batches may remain grouped; different attributes require ungrouping. **Short Entire Quantity** separately requires grouped instructions, **Group picks by loc/LP** and its specific permission. Its screen starts at quantity zero; choosing a reason and **Go** shorts every grouped instruction. [Work Execution, n220–225, n684–724][WE].

For inventory-serial-tracked goods, the documented **No count, remove all unallocated on hand quantity** and **No count, remove transaction quantity** inventory actions remove serial records without asking which serials to remove. The source recommends a **Count** setting when goods should instead move to Suspense and generate a cycle count. This is a configuration review point, not an instruction to change the warehouse setting. [Work Execution, n281][WE].

With outbound short-pick handling and active replenishment, an in-transit-quantity warning may appear before continuing. That warning does not prove physical arrival. [Work Execution, n729–734][WE].

### Over-pick and in-transit quantities

**Allow Over Picking** describes picking more than the instruction quantity while remaining within location available quantity; it increases transaction quantity and processes a complete pick. Its prose names replenishment and work-order picking. **Allow Pick In Transit** separately permits in-transit inventory and can make on-hand quantity negative until later movement corrects it. [Work Execution, n264–265][WE].

The separate **Allow Over Picking Checkbox** definition corroborates the instruction/available-quantity rule and explicitly limits its description to RF replenishment and work-order picking. Its example increases a 980-each instruction to 1,000 eaches when two 500-each cases are picked. This supports the configuration meaning; it does not settle the mobile action discrepancy below. [Allow Over Picking, n58–63][OVERPICKFIELD].

The explicit **Over Pick** sequence is **Actions → Over Pick → quantity → Go → Pick Confirmation → Go**. Source descriptions conflict: the action table requires greater than **on hand** and names replenishment/component work; the detailed procedure requires greater than **pick quantity** and says replenishment only. Preserve this distinction: deployed work type, special handling and the actual prompt must resolve applicability. Do not derive a universal threshold from the conflicting passages. [Work Execution, n253–255, n737–753][WE].

### Converted UM and catch weight

With **Use Converted Quantity**, a higher UM is used when configured and the pick quantity is a multiple of it; otherwise base UM is used. Decimal converted quantities are not allowed for partial/short picks in the documented rule. Override location/LP screens also display converted UM. [Work Execution, n270][WE]; [Override Pick, n208][OVERRIDE].

Catch weight is requested during work execution rather than work creation. Shipment picking may calculate missing entered weight from average unit weight and picked quantity. Picking into an existing/new shipping container associates weight with that container. Catch-weight pick instructions are ungrouped by default. These statements do not establish installed weight configuration. [Work Execution, n768–781][WE].

## 5. Override source inventory or the pick container

### Location, lot and source LP

Override changes inventory/work records. Documented families include outbound allocation/shipping-container work, replenishment and inventory transfer. **Override Pick** security and relevant Work Special Handling options are required. [Override Pick, n57, n69–109, n202–215][OVERRIDE].

1. Choose **Actions → Override** from Pick Confirmation; it can also be invoked during Item, Lot, Check Digit or Quantity verification.
2. Inspect offered locations/lots and swipe alternatives where available.
3. Select an eligible location, or scan another location when that entry is supported, and select **Go**.
4. Complete required location/LP/item/lot/container checks and override confirmation.
5. Confirm the pick or take its supported Short/Partial branch.

**Number of locations to display on the Override Pick** controls list length. An unlisted location is not necessarily invalid. Overriding an overallocated original location requires sufficient available quantity at the alternative under the documented rule. [Override Pick, n110–163][OVERRIDE].

Scanning a different LP constitutes an LP override when enabled. **Allow override to different quantity**, **Container verify** and grouping affect prompts. Wave-created containers with pallet building can require both pallet and nested-container verification. Same/different location/lot and LP-to-non-LP variants are documented, but same-location lot substitution has narrower replenishment/full-UM shipping-container conditions. Preserve eligibility validation rather than assuming every alternative is allowed. [Override Pick, n69–100, n167–200][OVERRIDE].

### Shipping-container branches

| Branch | Setup and sequence |
|---|---|
| Override container | **Pick into shipping container** plus **Allow override**. Enter new Container ID, **Go**, accept override, verify changed ID, complete pick. Immediate validation can reject the ID. |
| Create during pick | Wave created allocation without containers and profile picks into shipping containers. Enter new ID, choose type, continue to putaway. |
| Split wave-created container | Requires **Allow splitting of container**, **Split container** permission and completed partial pick. Source describes a new unit/container for the split quantity, but not a full separate screen sequence. |

[Work Execution, n302–352][WE]. No undocumented replacement-LPN/label extension behavior is implied.

<a id="putaway-confirmation"></a>
## 6. Putaway and destination exceptions

Confirm destination and goods, complete enabled checks, then submit. **Go** performs putaway and advances to another putaway or initiation. **Skip** advances without putting away the current instruction; **Pass** stops the unit. [Work Execution, n372–407, n586–617][WE].

An LP-tracked destination requires a new LP ID when the quantity is not the whole source LP. Putaway into shipping containers at put-to-store/shipping-dock locations requires Container ID and, for a new container, type. Types can be authorized by company/warehouse. Shipping-dock putaway processes all items/quantities together; with container putaway enabled that unit must be for one shipment. [Work Execution, n491–507][WE].

### Override or locate

**Override Putaway** needs its security permission. Choose **Override**, enter/scan the replacement destination and complete configured verification. The source separates **None**, **Check Digit** and **Location** methods, excludes receipt putaway from the **None** branch, and describes a check-digit step even under **Location**. That exact sequence requires deployed-flow confirmation. [Work Execution, n428–458][WE].

**Locate** needs permission and Location Verify Method **Check Digit** or **Location**. Choose **Locate**, select a locating rule and **Go** to populate a destination; then complete Putaway Confirmation. This Warehouse Mobile passage explicitly supports receipt putaway. Another interface's Locate button does not prove the same mobile path. [Work Execution, n476–489][WE].

### Put-to-store and short putaway

Setup includes Put-to-store location class, item category class, locating rules, receiving preferences, profile and store-location assignments/criteria. Different shipments cannot share the same destination shipping container; the source describes errors for a container from a different shipment/location. [Work Execution, n504–517][WE].

**Short Putaway** requires a Put-to-store destination and permission. Choose **Short**, accept ungrouping when requested, enter actual quantity, choose reason and confirm. Instructions sharing a destination can be shown separately so the operator shorts the correct one. Full quantities follow normal putaway; serial-tracked items also support this branch. [Work Execution, n552–583][WE].

### After putaway

- **Nest After Putaway** may request a parent container for the picked containers. The source says it is not initiated when **Putaway to shipping container** is selected.
- **Consolidation After Putaway** may request location area/position. In the one-shipment examples, the first completed container/unit establishes that location; subsequent ones need not request it again. Container count can identify unpicked containers.
- **WM Success Message** enables optional success text. Absence of that text alone does not establish failure.

[Work Execution, n518–551, n651–652][WE].

<a id="receipt-putaway"></a>
## 7. Receipt-putaway branches

Work Execution validates the applicable **Receipt Putaway Verify Method**:

| Method | Documented LP behavior |
|---|---|
| Existing LP – No Override Allowed | Existing LP shown read-only. |
| Verify Existing LP | Enter existing LP to confirm it; a new value is rejected. |
| Existing LP – Allow Override | Existing LP is shown; use it or supply a new value. |
| User Specified | Existing LP is not displayed; enter a new value. |

[Work Execution, n460–474, n618–625][WE]. These choices explain why one receipt needs a scan while another shows a fixed LP or requests a new one.

Receipt putaway may summarize LPs according to item, destination, LP structure and special handling. Parent locating groups nested containers sharing a destination without honoring item/lot verification; child locating honors it and presents putaway per child. **Entire Quantity** does not honor quantity verification. [Work Execution, n293–296, n494, n499][WE].

Delayed locating can occur when starting user/system-directed receipt work whose container was located to the receiving pre-locate location and whose instruction points there. Multiple-unit assignment additionally depends on profile and receiving-dock work-unit-selection settings. An outgoing pickup/dropoff location delays relocation until its pick starts. Starting work created from shipping containers can print labels when configured. Starting work may therefore have effects beyond displaying details. [Work Execution, n756–767][WE].

Receiving entry and **Close Putaway Group** are distinct procedures. Use the [inventory and receiving flow guide](WAREHOUSE_MOBILE_INVENTORY_RECEIVING_FLOWS.md) for those actions; this section does not replace receipt creation, locating, trailer association or group-close instructions. [Work Execution related procedures, n69–78][WE].

<a id="replenishment-and-production-work"></a>
## 8. Replenishment and production work

Replenishment uses the shared pick/putaway verification model with work-type-specific quantity controls. Distinguish instruction, available, on-hand and in-transit quantities. **Close After Partial Pick**, **Allow Over Picking** and **Allow Pick In Transit** affect remaining work and inventory differently. Use the [quantity-exception rules](#quantity-exceptions), including the unresolved Over Pick discrepancy. [Work Execution, n253–281, n729–753][WE].

The retained screen-flow catalog identifies **SRC160 Work order component work execution** and **SRC170 Work order finished item work execution** separately. The Work Execution article specifically discusses work-order/component partial-close and over-picking but provides no complete separate finished-item prompt sequence. Shared confirmation behavior is documented here; recipe/component selection, production reporting and finished-item completion require their dedicated sources/configured flows. They are not inferred from replenishment. [Screenflow, n174–183][FLOW]; [Work Execution, n255, n263–264][WE].

<a id="system-directed"></a>
## 9. System-directed and continuous work

A system-directed profile chooses eligible work instead of requiring each next unit to be typed. Initiation can request a location, a new work-unit name, or no location. Completing a unit can advance directly to the next eligible unit. **Pass** or **Full** leaves that continuous sequence, with group effects described below. [System Directed, n57–62, n98–151][SYS].

### Location-based selection

1. Select the system-directed profile unless an authorized default selects it.
2. Scan the current/nearby location when requested; select **Go**.
3. Review and execute the assigned unit using pick/putaway verification.
4. Review the next automatically assigned unit before continuing.

The profile assignment method controls precedence among location, priority and FIFO. FIFO uses creation/aging date/time. The source diagram distinguishes work already assigned to this user from unassigned work and shows assignment before sequential execution. Its two method boxes repeat the same label although their described ordering differs; actual configured precedence must resolve that discrepancy. [System Directed, n116–121 and diagram n200][SYS].

### Rename a work unit

When configured, scan a new label into **Rename Work Unit** and select **Go**. The next assigned unit receives that ID; a later operator, such as at a pickup/dropoff location, can scan the renamed unit. New name is mandatory once this branch starts. This is a record change, not a display alias. [System Directed, n123–129][SYS].

### Assign multiple units

1. Choose the relevant system-directed profile.
2. Scan location and select **Go** when needed to reach **Assign Work Unit**.
3. Scan a unit and select **Go**; repeat for additional units.
4. Choose **Actions → Begin Picking** when finished assigning.
5. Execute the grouped or individual instructions shown.

The first assignment creates a group ID; later units join it. **Group by Loc/LP** controls combining eligible picks versus displaying each instruction. **Pass** or **Full** unassigns every unit from this group after a warning; **Skip** moves to another instruction. **Cancel** ungroups assigned units and returns to initiation. The source does not describe these actions as undoing completed inventory movements. [System Directed, n152–190][SYS].

<a id="cart-picking"></a>
## 10. Operator-built carts and cart putaway

### Build a cart from shipping containers

Prerequisites include Cart Picking initiation and the supported **Pick into shipping container** method. Spot assignment can be user-selected or automatic. [Cart Picking, n97–102, n217–224][CART].

1. Choose the cart-picking profile.
2. Scan Container ID and select **Go**; inspect the displayed type and ID.
3. Enter the spot when prompted by the spot configuration and confirm assignment.
4. Repeat for required containers.
5. Choose **Actions → Begin Picking**.
6. Check Work Unit, Location, Item, Description, Container, Spot and Quantity; complete validation and confirm each pick.
7. Follow putaway. Put-to-store/container-putaway requests Container ID and, for a new container, type; an existing container does not request type again.

Scanning an already assigned container can directly trigger a **Begin Picks** confirmation. **Actions → New Cart** starts assignment for another cart without first picking the current set. [Cart Picking, n103–168, n224][CART].

### Quantity and exit actions

Partial Pick asks for confirmation; Short Pick requires reason; Skip advances without completing the current instruction. Pass stops this execution instance. **Work System Value 50 – Remove container from cart when pass?**, set to **Warn**, controls the described warning. Do not assume passing always retains or always removes cart membership. Group-user picks can batch across containers, with serial-tracked and catch-weight items excluded from that grouping. [Cart Picking, n170–188, n220–230][CART].

### Cart picking to tote

The cart source describes selecting a cart profile, scanning a Tote ID, scanning its Work Unit ID and repeating pairings before **Begin Pick**. The action starts pick/putaway. Grouping is supported; partial/short picks ungroup batches. The dedicated tote article explicitly rejects **cart picking to tote for container work**, although user/system-directed tote picking supports shipment/container work. Preserve that branch restriction. [Cart Picking, n127–153, n226–230][CART]; [Pick to Tote, n150–153][TOTE].

### Remove containers from an unassigned cart

Removal requires open work with a group ID and no assigned user. Choose **Remove Cart Container** profile. Scan one Container ID and select **Go** to remove it, clearing its group ID and spot. To remove all, scan a member container, select **Actions → Remove All**, then confirm **Yes**. Explicit success messages distinguish single/all removal. This is different from passing in-progress cart work. [Cart Picking, n191–216][CART].

<a id="system-built-carts"></a>
## 11. System-built carts

Documented setup: **Work Profile → Work Processing → Work Initiation Method: Cart Picking**, **System-built carts** enabled and **Cart spots** specified. One container occupies each spot. Work zones need cart-building sequence values. These are prerequisites, not verified installed settings. [System Built Cart Picking, n67–87][BUILD].

1. Choose the system-built-cart profile.
2. SCALE analyzes eligible work and assigns shipping containers to spots.
3. Inspect **Build Cart**: spot, container type and the last four digits of Container ID. The source does not explain collision handling for identical suffixes.
4. Physically place the corresponding containers on the cart using the warehouse's identification procedure.
5. Select **Go** to receive the first instruction and execute pick/putaway.

No eligible units produces an empty Build Cart screen. **Back** returns to profile selection but keeps the built cart; it does not cancel assignment. [System Built Cart Picking, n89–114][BUILD].

Documented criteria are priority (lower numeric value first), minimum/maximum work-zone sequence and aging date/time. Units lacking minimum/maximum zone sequence are ignored; null zone sequence is ignored when deriving those values. A single-instruction unit can have equal minimum/maximum zones. “No eligible work” does not establish absence of warehouse work. [System Built Cart Picking, n116–134][BUILD].

<a id="pick-to-tote"></a>
## 12. User/system-directed pick to tote

Configure User/System initiation and **Pick to tote** container picking. **Sort Picked Quantity** marks completed tote records **Sort Pending**; without it they are **Not Eligible** for putwall sorting. The source names screen flows 300 for tote initiation and 310 for cart/tote initiation. [Pick to Tote, n56–99][TOTE].

1. Choose **Work Execution** and the tote profile.
2. Scan Work Unit or Tote ID; select **Go** for Pick Confirmation.
3. Enter Tote ID and complete pick verification/confirmation.
4. Repeat picks; after all picks, complete the displayed Putaway Confirmation.
5. If eligible, use the separate Putwall Sort function.

Tote records are recorded after putaway or automatic putaway completes. Partial/Short Pick are available where applicable. Lot/serial-tracked goods are supported and labor is recorded for pick/putaway. A nested shipping container is rejected for tote picking. Container work is supported in user/system-directed tote flow but rejected in the cart/tote combination described above. [Pick to Tote, n58, n101–156][TOTE].

<a id="putwall-sort"></a>
## 13. Sort a tote into putwall locations

A putwall comprises cubbies for separating batch-picked inventory by shipment/container. Locations require **Putwall** class; the source says these are not inventory-tracked or shown in Inventory Insight search. The profile needs **Pick to tote** and **Sort picked quantity**. Screen-flow ID is 290. [Putwall Sort, n56–94][SORT].

1. Choose **Putwall Sort**.
2. Scan Tote ID.
3. Scan item or supported cross-reference. Use the slider to choose among multiple item/company matches.
4. Supply lot information and branch-specific serial verification when requested.
5. Inspect shipment/container information if needed.
6. Enter putwall location on the first relevant sort; complete location/check-digit validation.
7. Select **Go** to sort. Repeat until completion is shown for that shipment/container.
8. **Cancel** stops sorting and returns to tote entry; it is not documented as undoing completed sorts.

Work type determines shipment versus container sorting. For shipment sorting, the first sorted item associates the remaining shipment items with the same putwall location. Container examples keep different containers at separate putwall destinations even within one shipment. Do not collapse container destinations solely because Shipment ID matches. [Putwall Sort, n97–152, n214–254][SORT].

Default behavior sorts one base-UM quantity at a time. The source additionally describes multiple-unit sorting but names **Receiving preference** in one passage and **Shipping preference** in another; this remains unresolved. Its general serial-entry description has an explicit later exception: no serial prompt when sorting by shipment. Its summing example contains inconsistent arithmetic and is not reproduced as a valid expected result. [Putwall Sort, n124, n166–203][SORT].

Each successful sort writes transaction history and labor records. An empty location becomes **Storage** after its first sort; clearing all sorted goods makes it **Empty** again. These are documented transitions, not live evidence. [Putwall Sort, n175–210][SORT].

<a id="clear-putwall"></a>
## 14. Clear a completed putwall

Eligibility includes shipment trailing status at least **Packing Pending** and all shipment details sorted. Shipment and container clearing use different paths. [Clear Putwall Location, n59–66][CLEAR].

| Branch | Steps | Completion effect |
|---|---|---|
| Shipment through web packing | Packing Preferences initiation is **Putwall Location**. Open Shipping → Packing and scan the location, or select a completed location in Shipping → Putwall Insight and choose **Actions → Pack**. | Packing the last shipment quantity clears the location and sets it Empty. |
| Container through Warehouse Mobile | Choose **Clear Putwall Location**. Inspect the first eligible location, or scan another and select **Go**. Review Container ID/type and system/actual weights. Select **Go** to close the container. | Container closure and putwall clearing succeed; the next eligible location is displayed. |

[Clear Putwall Location, n76–117][CLEAR]. The confirmation **Go** here closes a container; it is not passive navigation.

<a id="shared-work-types"></a>
## 15. Counts, pickup/dropoff, transfers and related work

**Threshold count during picking.** Configured location thresholds can interrupt pick confirmation. **Performs threshold counts immediately** must be enabled in Cycle Count preferences. **Add Item** and **Done** may be offered. If LP counting is canceled partway through, completed counts are honored and unfinished ones remain open. After count actions, work continues to pick/putaway. Standalone Cycle Count, Blind Cycle Count and Reconcile remain distinct procedures in the [inventory and receiving guide](WAREHOUSE_MOBILE_INVENTORY_RECEIVING_FLOWS.md). [Work Execution, n626–633][WE].

**Pickup/dropoff.** The source supports these locations across work types. **Bypass** appears on Putaway Confirmation with **Whs Mobile – Work Execution → Bypass** permission; it skips the pickup/dropoff location. It does not imply skipping the entire pick or undoing movement. [Work Execution, n634–638][WE].

**Warehouse transfers.** Warehouse is shown on pick and putaway screens. The source supports actions/special handling and the option allowing duplicate LPs across warehouses; warehouse identity remains relevant context. [Work Execution, n642–649][WE].

**Dock, inventory-transfer/adjustment and production variants.** The screen-flow catalog distinguishes these families, while this source supplies shared validation, quantity and destination behavior. No dedicated prompt sequence is invented for every SRC identifier. Dock setup, transfer authorization, adjustment reasons, component/finished-item rules and configured extensions require their own sources. A catalog entry proves documentary availability, not a completed execution. [Screenflow, n159–183][FLOW]. See the [shipping and support guide](WAREHOUSE_MOBILE_SHIPPING_SUPPORT_FLOWS.md) for separate shipping functions and the [complete source/flow catalog](WAREHOUSE_MOBILE_SOURCE_CATALOG.md) for the documented denominator.

### Legacy RF is a separate interface

Retained AIM also documents legacy RF logon and user/system/group-directed work. Its logon procedure includes Terminal Server/Windows/RF-session steps, connection indicators and a warning against multiple RF browser sessions on one device. These are not substituted for Warehouse Mobile's Android/Entra-or-AD-FS sequence. This guide covers Warehouse Mobile and uses legacy RF only for this bounded distinction. [Legacy RF logon, n58–68 and Procedures][RFLOGIN]; [Processing RF Work, n74][RFGENERAL].

<a id="configuration-and-source-limits"></a>
## 16. Configuration checks and source limits

| Observation | Documented configuration/context to inspect |
|---|---|
| Profile chooser skipped | Authorized default work profile on User Profile. |
| Different fields/order | JSON screen flow, work type and Work Special Handling. |
| Location verification differs | Special handling takes precedence over location setting when both define it. |
| Partial action missing | Permission, quantity verification, receipt LP method and full-container restrictions; distinguish inline partial. |
| Remaining work closes after partial | Applicable Close After Partial Pick. |
| All Items/Entire Quantity shown | Grouping, common destination, parent/child locating and quantity-verification exception. |
| Override rejected/unavailable | Security, special handling, inventory eligibility and permitted lot/LP/container combinations. |
| System-directed work keeps advancing | Continuous assignment; distinguish Pass/Full/group-unassignment effects. |
| Build Cart has no spots | Eligible work, cart capacity and minimum/maximum zone sequence. |
| Tote cannot be sorted | Sort Picked Quantity eligibility, branch restrictions and nested-container prohibition. |
| Putwall cannot clear | Sorting completion, trailing status and shipment/container clearing path. |
| Success text absent | Optional WM Success Message; inspect actual state rather than text alone. |

Material unresolved differences remain: Over Pick quantity basis/work types; Location-verify putaway's check-digit wording; the preference enabling multiple-unit sorting; duplicated method labels in the system-directed diagram; and complete dedicated sequences for some work families. They are not silently repaired here. Installed configuration, effective permissions, exact JSON, transaction recovery, network retry/idempotency and live execution of every branch were not tested for this guide.

## Source register

Node ranges refer to retained AIM content-tree IDs and include qualification context. Linked reading copies preserve `data-source-node` attributes; structured JSON with the same article ID retains original URL, SHA-256 and acquisition metadata. Source hashes and reviewed ranges are recorded in the RF catalog/private evidence. Originals remain unchanged.

| Label | Retained article and reviewed scope |
|---|---|
| LOGIN | [Warehouse Mobile Sign in][LOGIN], n59–74. |
| OV | [Using Warehouse Mobile][OV], n58–141. |
| WE | [Warehouse Mobile Work Execution][WE], substantive prose n58–781 including h5 branches. |
| OVERPICKFIELD | [Allow Over Picking Checkbox][OVERPICKFIELD], n58–63; RF configuration definition only. |
| OVERRIDE | [Warehouse Mobile Override Pick][OVERRIDE], n57–215. |
| CART | [Warehouse Mobile Cart Picking][CART], n57–230. |
| BUILD | [System Built Cart Picking][BUILD], n57–134. |
| SYS | [Warehouse Mobile System Directed][SYS], n57–197 and diagram n200. |
| TOTE | [Warehouse Mobile Pick to Tote][TOTE], n57–156. |
| SORT | [Warehouse Mobile Putwall Sort][SORT], n57–254. |
| CLEAR | [Warehouse Mobile Clear Putwall Location][CLEAR], n57–123. |
| RFLOGIN | [Legacy RF logon][RFLOGIN], n58–68 and sign-on procedure; distinction only. |
| RFGENERAL | [Processing RF Work][RFGENERAL], n74 and topic navigation; distinction only. |
| FLOW | [Warehouse Mobile Screenflow][FLOW], named work-family rows n99–183 and related cart/tote/putwall entries; identifier coverage only. |

[LOGIN]: ../../AIM/reading/0a96fa01b063e3b4b10ed1be77385b0910d27b92d3927a63ea068f01784f17bf.md
[OV]: ../../AIM/reading/237fc6fac5e3dd0e9c9940b3ecd254fb12f1fa9c3d64fa765a9c1c599095f97d.md
[WE]: ../../AIM/reading/c0b8a4482e4b858f753b52028b7a8e806ba5240c1d5303379719af3082ece1a0.md
[OVERRIDE]: ../../AIM/reading/f586c2d66cc03deffc95bea01eb4a2ab97713125c8aabc4d2e37f152b3ddf672.md
[CART]: ../../AIM/reading/1673c921c28dc921fb2d4448ac596efddc087cb144434e3f9171a4697606cba3.md
[BUILD]: ../../AIM/reading/4240aa17a86f87a6eefabbd0124f06f8bcb88c4429fb0c391f98fcafd00603b9.md
[SYS]: ../../AIM/reading/0dfff7671dd910f375497911712c01cbb5ae234764532ed55f7642cc8255b637.md
[TOTE]: ../../AIM/reading/476839b74a6ece49ae587364b3328aa2997c3520b31a36292daffeb3854f324b.md
[SORT]: ../../AIM/reading/3d8f8f6522101a7bc14ef4398edcc616bff9c935f925feee79f14386e17209ef.md
[CLEAR]: ../../AIM/reading/085f6fc30899c1dd4def9d88eafb27b2e253b9df0e5171080463628f642d2c2e.md
[RFLOGIN]: ../../AIM/reading/e0aa50d0a6cf382f9a4619b83a12a5e773dc1f63677af6ec298b791c6fa1ef7c.md
[RFGENERAL]: ../../AIM/reading/5ea80956b207057fdc2d841bb836a676ef62f554f56c6da1c57f1997b9f84e20.md
[FLOW]: ../../AIM/reading/716ff5168b6f055fc5123a31137c7c9773f29a0ef92749e52b5a9abbe9f8e64b.md

[OVERPICKFIELD]: ../../AIM/reading/043bf62c2e4d0ce15c49729589d677288f0e768a9bd0b8b2a06d9be8a89a2b5f.md
