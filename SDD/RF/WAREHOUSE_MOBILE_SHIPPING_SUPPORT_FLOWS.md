# Warehouse Mobile: shipping and supporting tasks

Use this guide for container closing, nesting, shipping quality control, dock transfers, printer assignment, receiving photographs and indirect labor. Each procedure describes retained SCALE documentation. Your available menu choices and prompts depend on permissions, preferences, screen-flow configuration and release.

[All Warehouse Mobile flows](WAREHOUSE_MOBILE_SOURCE_CATALOG.md) · [Receiving and inventory](WAREHOUSE_MOBILE_INVENTORY_RECEIVING_FLOWS.md) · [Picking, carts and putwall](WAREHOUSE_MOBILE_WORK_FLOWS.md)

The documented confirmation messages below describe the application's response. They are not evidence that these operations were performed while preparing this guide. In particular, assigning a printer or closing a container does not by itself establish that a physical label printed.

<a id="assign-printer"></a>
## Assign or clear a label printer

Use **Assign Printer** to select the label printer associated with your user profile.

1. Sign in and open **Assign Printer** from the Warehouse Mobile menu.
2. Enter or scan the **Label Printer** name.
3. Tap **Go**. The documented response is **Assign Printer successful**.
4. If you need to verify the selection, open the user profile's **Preference > Default Label** field. It should show the assigned name.

An invalid printer name produces an error. Correct the name instead of treating the assignment as successful. The procedure does not test printer connectivity, stock, label format or physical output.

To clear the assignment, open **Assign Printer**, choose **Actions > Clear**, and check the clear-printer message. The profile's **Default Label** field is then cleared. Clearing this default and assigning a different printer are separate actions.

Source: [Assign Printer](../../AIM/reading/d3ded73e3c4cd4c058cf366dac2337cea31f922628ab7fb9f72351db3f110daa.md), nodes n71–n90. Published SRC: **190**.

<a id="close-container"></a>
## Close a shipping container

Closing indicates that packing is complete and advances the container's status. Packing preferences can also cause manifesting, printing or assignment of its shipment to a load. Those optional effects depend on configuration.

### Use the calculated weight

1. Open **Close Container**.
2. Enter or scan the **Container ID**.
3. Review the populated container, **System Weight** and **Actual Weight** information.
4. If you are accepting the calculated weight, leave the actual-weight value unchanged and tap **Go**.
5. The documented success message is **Container is Closed**.

### Enter the actual weight

1. Open the same flow and identify the container.
2. Review the displayed weight. Enter the measured value in **Actual Weight** when it differs from the displayed value.
3. Tap **Go** and review the response.

The documented shipping weight combines the container-type weight with the weight of the items in the container. SCALE checks the container weight against the configured tolerance. When it exceeds the tolerance, it asks the user to confirm the value before closing. The source does not supply a universal tolerance or a separate resolution procedure for every possible closing error.

When the paperwork's document type uses **Close Last Container**, closing the last container can trigger its document or label. Printer selection, document routing and successful physical output must still be checked through the appropriate printing process.

Source: [Close Container](../../AIM/reading/b33a75f313a267b2873999318c8752e9ddbe07fbd8201653f8f3aa6b757253b5.md), nodes n57, n80–n122. Published SRC: **20**.

<a id="shipping-container-nesting"></a>
## Nest shipping containers

Nesting places a child shipping container inside a parent container and associates the child's items with that parent. It is useful when a prepacked case and loose items must travel in a larger container.

1. Open **Shipping Container Nesting**.
2. On **Select Nesting Type**, choose **Nest**.
3. Enter or scan the child **Container ID**, then tap **Go**.
4. Review the displayed **From Container**. The information control opens its details.
5. Enter the **To Container** and tap **Go**.
6. If this creates a new container, choose the available **Container Type** when prompted.
7. Tap **Go** to complete nesting.

An existing destination container does not prompt for a new container type. New-container behavior depends on packing preferences. The retained article refers to company, warehouse and user authorization when describing available container types; it does not establish the effective authorization for a particular operator.

The source requires a shipment-associated shipping container and records these failure conditions:

- Containers at different locations cannot be nested through this flow.
- Nesting fails when the wave is not released.
- Asynchronous validation can return an error that must be handled before treating nesting as complete.

Source: [Shipping Container Nesting](../../AIM/reading/981acc9687be090e0cd79ec204c950960d3ad374894d883e8597845e7b334789.md), nodes n57–n60, n93–n118 and n152–n157. Published SRC: **320**.

<a id="remove-shipping-containers"></a>
## Remove one or all shipping containers from a pallet

Open **Shipping Container Nesting** and choose **Remove**. The screen is titled **Shipping Container Remove Nesting** and starts with **Container ID**.

| Intended action | Container to identify | Confirmation and result |
| --- | --- | --- |
| Remove one nested container | Scan the child container. | Confirm when prompted. The documented response reports that this container was removed from the pallet. |
| Remove every nested container | Scan the parent container. | Choose **Yes** to remove its nested containers. Choose **No** to return to the container-entry screen without removing them. |

The child versus parent ID determines the removal scope. Check which ID you scanned before confirming a request to remove all containers.

The SRC registry also contains **360 — Remove**, but that short label does not establish which configured screen invokes it. The procedure above is supported by the shipping-nesting article independently of that ambiguous registry label.

Source: [Shipping Container Nesting](../../AIM/reading/981acc9687be090e0cd79ec204c950960d3ad374894d883e8597845e7b334789.md), nodes n123–n147.

<a id="multiple-order-pallet-nesting"></a>
## Nest onto or remove from a multiple-order pallet

A multiple-order pallet (MOP) can hold containers from different shipments and ship-to addresses. The source calls its entry **MOP Shipping Container Nesting**; the inspected menu called it **Multiple Order Pallet Nesting**.

1. Open the MOP nesting entry.
2. Choose **Nest** or **Remove** on **Select Nesting Type**.
3. Identify the shipping container in the **Container ID** field and follow the pallet-identification prompts.
4. Tap **Go** to perform the selected action.
5. For nesting, continue with additional containers as needed or use **Cancel** to leave the screen.

For a new MOP, the user's **Container Assignment Method** in packing preferences determines whether its ID is entered manually or generated by the system. The retained article does not clearly separate every container-ID and pallet-ID prompt in its prose. Verify the label on the screen rather than assuming these IDs are interchangeable. Its removal branch says to select **Remove** and repeat the identification/confirmation steps; it does not document a separate exhaustive removal sequence.

The nesting validation rules are explicit:

- The incoming top-level container must be at the same dock location as containers already on the pallet. A child container is ineligible.
- A new MOP ID must be unique; it cannot reuse an existing shipping-container or MOP ID.
- Container status must be **greater than In Packing** and **less than or equal to Ship Confirm Pending**.
- Carrier and load must match those of the containers already on the pallet.
- Shipments on the pallet cannot be assigned to a closed shipping load.
- The wave must be released.
- Pending shipment work, or pending/active dock-management work, prevents nesting.

Nesting does not change the manifest state of the affected shipping containers. The final source sentence contains an incomplete phrase about an existing MOP assignment; this guide does not invent an additional rule from that fragment.

Source: [Shipping Nest Container onto MOP](../../AIM/reading/884e0d9b035fd9daaa96ab3b7c84f3301694caa1425e78a985cd0e56995d657e.md), nodes n81–n118.

<a id="receiving-container-nesting"></a>
## Nest receipt containers under a parent license plate

Use **Receipt Container Nesting** to group inbound license plates under a parent pallet. This is a separate entry from the [nest-during-check-in branch](WAREHOUSE_MOBILE_INVENTORY_RECEIVING_FLOWS.md#receiving-checkin-variants).

1. Open **Receipt Container Nesting**.
2. Enter or scan the receipt container's **License Plate**, then tap **Go**.
3. Enter the **Parent License Plate** and tap **Go**. For the first container the parent field is blank; enter a new or existing parent. For subsequent containers the most recently used parent is offered, and you may accept or change it.
4. Review the **Container Type** step. A new parent receives the configured default type; an existing parent keeps its original type.
5. Review the **Locating Rule** step. A new parent defaults from the nested container or receipt line; an existing parent keeps its current rule.
6. Tap **Go** through the applicable prompts and check the nesting success message.
7. Repeat for additional receipt containers, checking the proposed parent each time.

The source presents type/rule selection steps while also stating that an existing parent's type and locating rule cannot be overridden. Do not interpret the presence of a field as permission to replace those existing-parent values.

The SRC registry's **340 — Nest** is a short contextual label. This article supplies a real receipt-nesting procedure, but the registry alone does not prove that every installation maps identifier 340 to this exact entry.

Source: [Receipt Container Nesting](../../AIM/reading/cb69e28bbebf37c8567b4b9c1c28a82c204ff1b4024c06c8dd115817ef33e095.md), nodes n58 and n77–n106.

<a id="shipping-container-qc"></a>
## Mark and inspect a shipping container for quality control

The **Quality Control** option in the user's packing preference selects **Grocery Store** or **Total Quantity** mode. Marking a container for QC and completing its inspection are distinct actions.

### Mark a container for QC

1. Open **Shipping Container QC**.
2. Enter or scan the **Container ID**, then tap **Go**.
3. When asked whether to mark the container for QC, select **Yes**.
4. Check the message confirming that the container is marked.

That message confirms the mark, not a passed inspection.

### Inspect in Grocery Store mode

1. Open **Shipping Container QC** and identify the container.
2. Enter the item in **Item**, then tap **Go**.
3. Review the returned item name and counted quantity as items are processed.
4. Choose **Actions > Complete** when the inspection count is ready.
5. SCALE compares the counted items with its system count. Matching counts produce the documented QC-success message.

### Inspect in Total Quantity mode

1. Open **Shipping Container QC** and identify the container.
2. Enter the item in **Item**, then tap **Go**.
3. Enter its count in **Quantity** and tap **Go**.
4. Review the item and counted quantity, completing the required item entries.
5. Choose **Actions > Complete**. Matching counts produce the documented QC-success message.

### Handle a count mismatch

When completion finds a mismatch, the source describes **QC failed** and a rescan prompt. Choose **Yes** to rescan and recount. Choose **No** to return to the **Container ID** entry screen. The source does not say that declining the rescan passes QC or releases the container.

Source: [Shipping Container QC](../../AIM/reading/7850f745854156f9817432e534eb93bf1aa0c4fe36b8f7b7c0751962fd0c42ac.md), nodes n57 and n74–n141. Published SRC: **410**. The retained document's metadata title incorrectly says “Close Container”; its heading, URL and body identify Shipping Container QC.

<a id="immediate-dock-transfer"></a>
## Move a container directly to a shipping-dock location

**Immediate Dock Transfer** moves containers without starting work execution or creating a work unit as the initiation method. The source states that it transfers their on-hand inventory to the destination. It can also affect shipping-load assignment. Use the flow only with the appropriate Warehouse Mobile screen configuration and security permission.

1. Open **Immediate Dock Transfer**.
2. Scan or enter the top-level **Container ID**, then tap **Go**.
3. Review the container and **Assigned Location**. MOP containers are supported, and their MOP ID is displayed.
4. Move the container to the intended dock location, then scan the destination dock location as directed by the source procedure.
5. Tap **Go** and check the transfer response. A success message is the documented completion response.

Before confirmation, the documented validations include:

| Check | Requirement described by the source |
| --- | --- |
| Container | It exists and is the top-level/parent container. Its associated containers must also be considered. |
| Work | The container and associated containers must not have conflicting open work. The source does not define every work-condition code in this article. |
| Destination | It is not frozen, has location class **Shipping Dock**, and has a dock-management flow detail for its location subclass. |
| Dock door | Another load cannot occupy the destination door. The shipment's load must have that door or no door. |
| Carrier | A shipment unassigned to a load cannot be transferred if it has no carrier. |

If the container is assigned to a load, the dock-door field can default from that assignment. The notes also describe possible shipping effects: creation of a load for an unassigned shipment, assignment of a door to a load that has none, or addition of a shipment to a compatible carrier's load at the door. These are configuration-dependent behaviors documented in the source, not a promise that every transfer creates or changes a load.

If work is created for the container while the transfer is in progress, the source says the final transfer action can be rejected. Do not assume that starting this direct-transfer screen protects the container from concurrent work creation.

Source wording is uneven: the notes introduce some load-assignment effects under an incomplete “transfer does not happen” sentence, and the final note calls the confirmation **Transfer Button** while the numbered procedure says **Go**. This guide preserves the possible effects and rejection boundary without inventing a precise failure/recovery sequence or a different current button label.

Source: [Immediate Dock Transfer](../../AIM/reading/838a020258ef840157ff58cbf2976040e90b5843a8ef1d4a715641e354227816.md), nodes n57–n60, n89–n133. Published SRC: **90**. Work-driven dock movement is a separate SRC family and uses the [shared work flow](WAREHOUSE_MOBILE_WORK_FLOWS.md#shared-work-types).

<a id="image-capture"></a>
## Photograph returned or damaged product during receiving

The documented built-in image-capture flow is available during **Warehouse Mobile Receiving** on a camera-equipped device. The source says the camera control is not displayed in the browser application. Other flows require the documented extensibility path; their support is not implied here.

1. On the device, open **Receiving** and select the receiving preference.
2. During the receiving flow, tap the camera icon and take a picture.
3. Accept the picture with **OK**, or choose **Retry** to retake it. Device and Android versions can use different capture/save/retry/cancel controls.
4. On **Save Image**, select the reference type and enter its corresponding reference ID. Built-in receiving types are **Receipt ID** and **License Plate**.
5. Add an explanatory note in **Notes** when needed.
6. Tap **Go** to save the image as JPEG in the configured application storage.

Reference defaults depend on the available receiving context:

| Available information | Documented default |
| --- | --- |
| Neither usable reference is available | Reference type remains unselected and the ID is blank. |
| Receipt ID is available, license plate is not | Receipt ID is selected. |
| Receipt ID and license plate are available | License Plate is selected. |

The filename includes the reference ID and timestamp. Simultaneous images for the same reference use an incrementing suffix. **Path for storing captured images** controls storage: the source describes a Windows share for on-premise installations and cloud storage for Active installations. This does not establish the location or accessibility of this warehouse's storage.

The application records an internal reference in Document Management. Use **Document Management Insight** to find the image by reference category/type/ID or supported filters such as filename, company, warehouse and timestamp. The source permits extending reference types through **Generic Config Header — Image Capture Reference Types**; adding a type is an administrator/configuration task.

Source: [Image Capture](../../AIM/reading/364c76525462d80ff1452e5fe179cda70ded716e3c95e1bd34467a95c546d7f2.md), nodes n57–n158.

<a id="indirect-labor"></a>
## Start and finish indirect labor

The retained documentation describes an **Indirect Labor** menu option. It was not one of the 16 choices reported in the inspected session menu, so availability requires checking the user's configuration and installed functionality.

1. Open **Indirect Labor** to display **Start Indirect Labor Activity**.
2. Select the **Activity Type**, then tap **Go**.
3. The **End Indirect Labor Activity** screen displays the user, activity type and start time. The activity remains open while the end time is blank.
4. When the activity is finished, tap **Go** again. The system records its end time and displays a success message.

If the user starts a direct activity before finishing an indirect activity, the documented behavior is to end the indirect activity at the direct activity's start time; the direct activity then remains active. The article names Receiving Check-In, Container Close, Picking, Putaway and Cycle Count as supported areas. It does not define every labor configuration or prove the behavior of an installed activity integration.

Source: [Warehouse Mobile — Indirect Labor](../../AIM/reading/5aaa5f77698df60269720bad37b9a8b09f90134d31c6d0a2850f2e6377c36810.md), nodes n57–n92.

<a id="source-limits"></a>
## Source and configuration limits

All nine source articles above were read from their retained structured bodies, including procedural lists, notes and nested validation items. Their exact original hashes and source paths are in the [source catalog](warehouse-mobile-source-catalog.json). No source text or source configuration was modified.

The main qualifications are specific: MOP identification/removal prose is incomplete; receipt nesting mixes selection wording with fixed existing-parent values; dock-transfer notes mix confirmation labels and an unfinished failure sentence; source metadata mislabels the QC article. These gaps remain visible rather than being converted into invented screen behavior.

No receiving, inventory transfer, container close, nesting, QC, labor recording, photograph capture, printer output or load change was executed to verify these procedures. Reading a menu or entry screen supplies navigation evidence only.
