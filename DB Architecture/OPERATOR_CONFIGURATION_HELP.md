# Operator and configuration help

Manually authored explanations from retained SCALE AIM documentation. The owner accepts the current replica as the documentation baseline. No version/build gate applies. These are source-document explanations; no screen navigation or warehouse action was performed.

## Work unit remains open: confirmation and holds

A pick is one step of work execution. Remaining picks, putaway, a partial quantity or a release hold can leave work unfinished. Check the header and its detail instructions before confirming anything; Work Insight confirmation has different rules for a header and a single detail.

1. In Work Insight, find the work unit and inspect the condition, hold code, assigned user/team and individual open or in-process details. Opening a header alone does not show that all work has completed.
2. Confirming a header executes every open and in-process detail under it. Header or multiple-row confirmation permits full picks; partial, short, over picks and serial prompts require a single detail.
3. Mobile partial picks normally leave the remainder open. Close After Partial Pick can remove the remainder and close the instruction only for supported replenishment/work-order picks. It is not a general close-work switch.
4. Mobile Skip moves past an instruction; Pass stops processing the work unit. Neither description says that the outstanding quantity is completed. Putaway confirmation is a separate step.
5. Work Insight Remove Hold cannot clear wave-not-released, cycle-count-plan-not-released or work-order-not-released holds. Check the associated release process instead of treating Remove Hold as a universal remedy.

Configuration: Work Special Handling: partial/short permissions, Close After Partial Pick and verification. Work profile and underlying wave, count-plan or work-order release.

Checks: Record the failing action, exact message, instruction level, condition and remaining pick/putaway step. A support reviewer can then distinguish a release issue from quantity/verification handling.

Sources: operator-work-insight, operator-work-mobile

## Work Insight and Warehouse Mobile: choosing the screen

Use Work Insight to find and manage instructions across a work unit; use Warehouse Mobile to follow the operator pick/putaway flow and scan the required values. Both can confirm work, but they expose different controls. The documentation is not a complete permission-by-permission feature matrix.

1. Work Insight offers filters, a results list and a detail pane. Its documented management actions include header user/team assignment, priority changes, holds, eligible unassignment, pick/putaway overrides and paperwork.
2. Its Edit action requires Change access. User/team assignment applies to headers; changing a header priority affects its details. Unassign requires inactive header work and clears both user and team.
3. Warehouse Mobile starts with an authorized work profile and work unit, then walks through pick and putaway. Work Special Handling controls location, item, quantity, license-plate and lot verification.
4. Mobile supports operator actions such as Skip, Pass, short/partial pick and configured overrides. Work Insight header or bulk confirmation handles full picks; use a single detail for exceptional quantities or serial prompts.

Configuration: Security checkpoints determine which actions are visible. Work profiles and Work Special Handling determine mobile flow.

Checks: For a missing action, name the screen and action first. Compare the applicable permission and profile rather than assuming a desktop action exists identically on mobile.

Sources: operator-work-insight, operator-work-mobile

## Configuring a work profile and its sequence rules

A work profile groups sequence rules for the users and teams that execute work. Configure who can use it, which warehouses/zones it covers, then the numbered rules that choose work and control picking and putaway. A user can be associated with one work profile at a time.

1. On the header, define Authorized Users, Warehouse Access, Work Team/Equipment Type and Work Zone. Apply the header, then create its detail sequences.
2. Sequences run in numeric order. Choose work types for each sequence; selecting none means all work types. The next sequence is used when available work for the current types is completed.
3. Choose User Initiated, Cart Picking or System Initiated. From Assign Method orders system-directed work by the documented priority/location/FIFO combinations. To Assign Method selects LIFO or location order for putaway.
4. Set the container picking method and putaway options for the intended operation. Automatic Putaway and Consolidation After Putaway are not simultaneously selectable; automatic putaway is unsupported for dock-management work.
5. On mobile, an authorized default profile in User Profile can bypass profile selection. Different prompts may come from Work Special Handling even when the work profile is the same.

Configuration: Assign Multiple Work Units is restricted to system-directed work and the documented receiving-dock location option. Print at WM Work Start also needs the document type flag and work created from shipping containers.

Checks: Check the actual authorized/default profile and its first applicable sequence before changing sequence order. Compare work type, zone, warehouse and equipment eligibility.

Sources: operator-work-profile, operator-work-mobile

## Pick fails or requests a reason: verification and short picks

First distinguish a field-validation failure from a short pick. Mobile validates the fields selected in Work Special Handling; a short pick follows its own quantity and reason-code flow. Capture the precise message and failing field before retrying, because the available action depends on work type, permissions and grouping.

1. Check the highlighted field: location/check digit, item, quantity, shipping container, license plate or lot. Work Special Handling overrides location-level verification when both define it.
2. In verification mode each field must pass; submitting the last valid field sends the pick for processing. Check whether that submission already produced a success message or moved to putaway before retrying.
3. A short pick requires its reason-code flow; Work Insight explicitly requires a reason code. Partial pick is a different action and normally keeps the remainder open.
4. For mobile batched work, different attributes require ungrouping before a short or partial pick. The separate Partial Pick action is unavailable when the user lacks the permission or quantity verification is turned on.
5. Short-pick inventory actions can have material inventory consequences. The source warns that certain no-count options remove serial numbers automatically; a reason code alone does not determine that policy.

Configuration: Work Special Handling verification and short-pick behavior. Short/partial permissions, grouped attributes, serial tracking and inventory-control short-pick policy.

Checks: Capture the exact message, failing field, intended quantity and unit, work type, grouped/single instruction state, and whether the screen advanced after submission. Do not repeatedly submit an uncertain action.

Sources: operator-work-mobile, operator-work-insight

## Using the Packing screen

Initiate the shipment or other configured identifier, choose the container, identify the item and quantity, then Pack. The screen shows open lines for that entity. No lines left to pack, a different initiation field, an unreleased wave or line eligibility can explain why the expected work is absent.

1. Check Packing Preferences Initiation Field: it may expect shipment number, ERP order or invoice. After initiation the screen lists open lines; if nothing remains to pack it reports no available lines.
2. Choose Existing for an associated packed container or New for a new one. Manual container assignment allows an entered ID; System creates the ID. An existing container keeps its established container type.
3. With Validate Item enabled, scan/enter the item or cross-reference and quantity. Otherwise select the grid row and use quantity controls. Read header instructions and any line instruction popup.
4. Pack applies the selected quantity. Pack All applies all remaining item quantities. Completed lines leave the grid; totals update. Serial-tracked and catch-weight items can require additional entry.
5. Use the Error-column checkbox to read a packing error. The Close button opens Close Container after the container is completely packed; it does not itself establish successful closure.

Configuration: Packing Preferences: initiation, status range, validation, quantity entry and container assignment. Wave release, available lines, container-type authorization and item tracking.

Checks: Confirm the input identifier and remaining lines, read Status Info and the exact row error. Check the effective Status Range before assuming every In Picking line is excluded.

Additional limits: The basic Packing article says unpicked lines cannot be packed, while the preference article explicitly permits a configured range starting at In Picking. Preserve this qualification; do not universalize either statement without the effective range.

Sources: operator-packing-screen, operator-packing-preferences

## Configuring packing preferences for users

Packing Preferences controls how an assigned user identifies a shipment, enters items and quantities, creates container IDs and closes containers. Start with the user assignment, then configure each tab for the intended process; a setting on an unassigned preference does not explain that user’s screen.

1. Create a preference record with a description. Use Assigned Users to associate it with users. *Default automatically takes users without a specific packing preference and newly created users unless specifically assigned.
2. Set Initiation Field, Status Range and Validate Item. Validation enables item/quantity inputs; without it, operators select items in the grid. Allow Over Packing permits quantities above those available on a shipment line.
3. Verify Container ID selected resets the displayed container to New after packing; unchecked retains the previous container and type. Container Assignment Method selects System or Manual IDs.
4. Read quantity behavior carefully: the retained article says Require Entry Of Quantity unchecked sets Packed Quantity to zero and requires manual entry. Do not infer the opposite from the checkbox name.
5. Configure close options separately: auto manifest, load assignment, pending-VAS handling and Auto Print at Close. Packing Work Type is for labor tracking; the documented packing action does not create work instructions.

Configuration: User assignment, *Default fallback and the relevant Packing/Close Container tab. Workbench Modify changes lot/quantity; Verify confirms actual contents.

Checks: Compare the user’s assigned preference and exact checkbox value with the documented screen behavior before changing it.

Sources: operator-packing-preferences

## Container will not close: packing, QC, VAS and weight

Read the close error first. Documented causes include pending or failed QC, pending VAS under the applicable preference, and scale or weight handling. Closing advances the container beyond packing, so it is separate from picking, packing and printing. This library cannot identify the current blocker on a particular container.

1. Confirm the intended container and completed packing. From Packing, Close becomes active after complete packing. In Close Container, verify the ID, container information, weight and applicable carrier/service.
2. Pending or failed QC prevents closure until the inspection is performed or resolved. Treat the QC result as a distinct check from whether the container is physically full.
3. When pending VAS exists, Allow VAS Override unchecked blocks closing. If checked, closing offers an override choice and records history when used. This explanation does not authorize bypassing VAS.
4. Weight tolerance can prompt confirmation. For desktop Use Scale Weight, an unavailable service or client configuration error produces a close error; the source points respectively to audit or client event logs. RemoteApp/RDP uses the documented wedge input behavior instead.
5. After successful close, additional product cannot be packed into that container. Auto manifest, auto print and load assignment depend on separate preference and integration settings.

Configuration: Packing Preferences: VAS override, auto manifest/print and load assignment. QC result, weight/tolerance and the configured scale path.

Checks: Record screen/action, exact error, QC/VAS indication and whether weight entry is manual or scale-based. Resolve the named prerequisite through the warehouse procedure before retrying.

Additional limits: VAS behavior at load confirmation differs: with override allowed, the source describes ignoring pending VAS while retaining VAS Pending and writing no history. Do not substitute close-container history behavior for load confirmation.

Sources: operator-close-container, operator-packing-preferences, operator-packing-screen, operator-mobile-close

## Printing packing and closing documents

Check the trigger and document type before the printer. Auto Print at Close can print automatically, ask which documents to print, or print none. Close Last Container documents also require that print procedure on the document type and the qualifying last-container condition.

1. Auto Print at Close Yes prints packing documents; Prompt opens document selection; No suppresses automatic close printing while manual printing remains available.
2. Close Last Container must be selected on the document type. The desktop source says that closing while quantities remain unpacked does not print those documents, except for its stated create-container-at-close case.
3. For mobile label routing, Assign Printer accepts the label-printer name and stores it in User Profile Preference > Default Label. An invalid name produces an error; Clear removes the assignment.
4. Print at WM Work Start is a different trigger. It requires that work-profile option, a Start WM Work document-type flag, and work created from shipping containers.

Configuration: Packing preference, document-type print procedure and user label-printer assignment. The selected trigger may be work start, each close or the qualifying last close.

Checks: Identify which trigger was expected, check its document-type selection and assigned printer, then retain the precise print error. These sources do not prove printer connectivity or physical output.

Sources: operator-close-container, operator-packing-preferences, operator-printer, operator-work-profile

## Configuring over-receiving and receipt execution

Receiving Preferences Allow Over Receiving determines whether an employee can receive above the receipt line’s Original Total Quantity. Leave it unselected when the intended policy disallows that capability; confirm the preference actually selected for the user and receiving flow. Do not substitute an unrelated purchase-order tolerance for this setting.

1. Create or select the relevant receiving preference and set Allow Over Receiving on its General tab. With it selected, the cited source says RF over-receiving raises no warning and requires no override.
2. Use Authorized Users to restrict which preferences the user can choose. A user can be authorized for multiple receiving preferences; newly created preferences initially authorize all users.
3. Execution Method controls check-in versus locate, batch versus immediate processing and Quick Receive. In the documented check-in/locate flow, Create Putaway Work determines whether locating creates released work or directly places quantity on hand at the destination. Quick Receive-User and Quick Receive-System do not create putaway work.
4. Single Unit Scan is disabled by several incompatible choices, including Allow Over Receiving, manual LP assignment, disposition, QC and dimension/unit verification. Review these interactions when the entry screen differs.

Configuration: Selected receiving preference and its authorized users. Allow Over Receiving, Execution Method, Create Putaway Work and Single Unit Scan.

Checks: For an unexpected over-receipt, compare the selected preference, original receipt-line quantity and requested unit/quantity through authorized support evidence. No operational rows are read by this library.

Sources: operator-receiving-preferences

## Receiving returns or damaged stock

Receiving Preferences can set an initial inventory status such as hold or damaged and require disposition/reason details. A status name alone does not stop allocation: the inventory-status documentation explicitly says allocation rules must exclude held inventory. Configure the receiving and allocation policies together.

1. Default Inventory Status supplies the status during check-in. A dedicated receiving preference can support a returns process with hold or damaged status.
2. Disposition Code Required records condition during check-in. Reason Code Required is available only when disposition is required; the cited configuration uses Quality History Reason Codes for Receiving.
3. QC Inspection Active checks received items for QC eligibility. That setting and a disposition code are distinct from the allocation rules that determine whether inventory can be shipped.
4. Review allocation rules before relying on a held/damaged status to exclude stock. The retained documentation does not automatically prohibit allocation merely because an inventory status sounds unavailable.

Configuration: Receiving preference, disposition and receiving reason codes, QC eligibility and allocation-rule exclusions.

Checks: Keep the stock within the warehouse’s approved damaged/return handling process while the responsible owner verifies the receiving and allocation rules. This topic does not authorize releasing it.

Sources: operator-receiving-preferences, operator-inventory-status

## Keeping container contents together or separate

Packing classes choose eligible container types during wave container creation and link packing criteria. Criteria compare shipment-line field values to decide which items may share a container. Full-screen packing can warn or block on a mismatch; container creation and RF pick/pack require matching values regardless of the Required checkbox.

1. Select the packing class on the shipment line when required. Item packing class defaults onto the line when interfaced but does not override an existing line value. If neither supplies it, the documented fallback is *Default.
2. On the packing class choose Container Group for candidate container types, and Packing Criteria for content compatibility.
3. Create criteria details with sequence and Field Name. The compared shipment-line fields must match; choose fields that represent the actual separation requirement, such as destination.
4. Required selected blocks differing values during full-screen packing. Unselected prompts for confirmation there. Wave container creation and RF pick/pack ignore that warning option and require all fields to match.

Configuration: Shipment-line/item/default packing class precedence. Container Group, criteria detail fields and screen-specific Required behavior.

Checks: Compare the actual class and mismatching criterion before changing container contents. Clearing Required is not a universal way to allow mixing.

Sources: operator-packing-classes, operator-packing-criteria

## Choosing a replacement license plate during picking

Use the documented Override Pick flow only when the work type, security and Work Special Handling allow it. Matching the item name alone is insufficient: location, lot, available quantity, grouping and container verification can affect the permitted replacement. The library cannot certify a particular replacement license plate.

1. Override Pick is documented for outbound allocation/container, replenishment and inventory-transfer work. License-plate override requires Override Pick security and the relevant override/LP verification settings.
2. The mobile override article explicitly describes different-quantity replacements under Allow Override To Different Quantity and related container/grouping settings. The work-execution article separately lists same-quantity cases; its short list is not a universal equal-quantity restriction.
3. Location and lot overrides have their own settings. The source gives specific same-location lot cases for replenishment or full-unit shipping containers; do not generalize those examples to every work type.
4. Container verification can require pallet and nested-container scans. After an accepted override, the source says location inventory, work instructions and relevant records are updated; this is an operational change.

Configuration: Override Pick security; Work Special Handling LP/location/lot override and verification. Allow Override To Different Quantity, Container Verify and Group Picks By Loc/LP where applicable.

Checks: Compare intended replacement item, location, lot, quantity/unit and tracking with the failed validation. Escalate the exact message if the documented eligibility does not explain it; do not bypass validation or infer attribute equivalence.

Sources: operator-override-pick, operator-work-mobile

## Desktop packing and mobile picking/closing settings

No. Desktop Packing enters shipment lines into containers, while mobile can pick directly into shipping containers through work-profile settings and close them through a separate screen. Some preferences apply across flows; other controls are explicitly restricted to a screen.

1. For desktop Packing, check the assigned packing preference: initiation, status range, item/quantity entry and container assignment.
2. For mobile pick/pack, check Work Profile Container Picking Method and Work Special Handling verification/override. Pick Into Shipping Container, Pick Into Tote and no RF pick/pack describe different behaviors.
3. Mobile Close Container takes a container ID and displays system/actual weight. The operator can use calculated weight or enter actual weight; tolerance can require confirmation.
4. The retained Packing Preferences article limits its described QC tab settings to the full-screen QC Workbench and excludes RF Shipping Container QC. It limits create-container-during-close to the specified remote-desktop menu path. Do not transfer these options to every mobile screen.

Configuration: Packing preference, work profile, Work Special Handling, security and the exact screen being used.

Checks: Name the screen and intended action first: Packing, mobile work execution, Close Container or QC. Check the settings documented for that flow.

Sources: operator-packing-preferences, operator-work-profile, operator-work-mobile, operator-mobile-close

## Understanding lot, license-plate and serial prompts

Tracking prompts depend on both the item and the operation’s configuration. Mobile lot and license-plate verification comes from Work Special Handling; desktop packing can prompt for serials based on outbound or inventory tracking. Grouped work and full-unit containers have documented exceptions.

1. Mobile verifies the lot for lot-controlled quantities and the LP for LP-tracked locations when the relevant verification is configured. Each enabled field is validated before the instruction is submitted.
2. For receipt putaway, parent locating can group nested containers going to the same destination without honoring item/lot verification; child locating honors those verifications. Entire Quantity also has a quantity-verification exception.
3. Packing prompts for serials when configured for outbound or inventory tracking. Mobile full-unit containers created in the wave have a documented no-serial-prompt exception; do not treat every missing prompt as a fault.
4. In full-screen QC, Lot Verification Required changes the entry fields and item/lot grouping. The documentation advises against switching it off during an active inspection because failed quantities can lose their correct lot association.

Configuration: Item/location tracking, Work Special Handling, grouping/locating method and the specific packing or QC flow.

Checks: Compare the exact tracking mode, work type and grouped/full-unit state before changing a verification flag.

Sources: operator-work-mobile, operator-packing-screen, operator-packing-preferences

## Describing a runtime problem for support

Describe the exact screen, action, message and point where progress stopped. Work confirmation, packing, QC/VAS checks, close-container weight and print triggers are separate stages. A small, sanitized description lets support select the relevant configuration instead of guessing from a generic symptom.

1. For work execution, note header versus detail, work type, remaining pick/putaway step, hold indication and the field being verified. Say whether a success message appeared or the screen advanced after submission.
2. For packing, record the initiation field used, whether lines remain, Status Info and the specific Error-column message. For close, identify QC/VAS and manual/scale weight conditions.
3. For configuration, give the setting label, screen/tab, intended result and the applicable preference/profile scope. A total count of profiles does not identify which one applied.
4. For printing, distinguish work start, close and last-container print triggers. Record document type, assigned printer and the observed error without assuming that a successful close means printing succeeded.

Configuration: The relevant preference/profile and permission depend on the action.

Checks: Suggested support summary: screen/action; expected result; exact message; last successful step; applicable preference/profile; whether it affects one flow or several. Omit credentials, personal data and transaction exports.

Additional limits: The support-summary format is an authored troubleshooting aid derived from documented decision points, not a vendor-mandated ticket format or proof of an actual incident.

Sources: operator-work-insight, operator-work-mobile, operator-packing-screen, operator-close-container, operator-packing-preferences

## Stuck work: deletion, wave cancellation and receipt reversal

Cancellation depends on what created the work and what has already happened. Work Insight Delete, Cancel Wave, receipt Unlocate and Cancel Check In are separate actions with different restrictions. First compare the instruction and transaction history with the physical product location; deleting a record does not establish that product has physically moved back.

1. Identify the work type, originating wave or receipt, From/To location, license plate, lot, remaining detail and current condition. Compare the last confirmed pick/putaway and transaction history with the product location reported by the operator. This comparison is an authored triage step, not an automatic reconciliation function.
2. Work Insight Delete removes the instruction and supporting inventory allocations; for shipment work it also updates shipment header, details and containers using Default Status When Shipment Is Rejected. The Processing Work article explicitly lists work that is not closed, active work, unreleased-wave work, allocated replenishment/inventory-transfer work at the To location, and specified shipment-allocation/container links as deletion restrictions. Do not reverse its not-closed wording into permission to delete open work.
3. Cancel Wave is documented for a wave that has run but has not been released. It validates eligibility, reports a rejection and writes history when ineligible. Allocation rollback and replenishment retention depend on the wave and its configuration; replenishments supporting another wave may be retained/extracted or prevent cancellation. It is not a general rollback for released work.
4. For receipt work, Cancel Check In applies only to product that has not been located. Unlocate is a separate preceding possibility for located product, but the source disallows it when created work has already executed. Cancel Check In returns the quantity to open receipt quantity; an interface-upload warning needs separate ERP reconciliation under the authorized procedure.
5. If physical movement and recorded confirmation disagree, retain the precise discrepancy and escalate to the authorized warehouse owner before selecting a reversal. The retained documentation does not establish a universal repair for partially moved or already executed work. An operator must verify the permitted action and actual result; this help cannot authorize cancellation.

Configuration: Work type and condition; wave release and Wave Master replenishment-retention policy; receipt locating/executed-work state. Default Status When Shipment Is Rejected controls shipment statuses for the documented deletion route.

Checks: Record the screen/action, exact rejection, last successful confirmation and whether the product is at From, To or another observed location. Review the corresponding process/transaction history before deciding whether a reversal fits.

Sources: [operator-work-processing](../AIM/reading/2a849da2c18bc5244f4e44f5346f871a765c86c96d43a011314a5857cfea60c5.md), [operator-wave-cancel](../AIM/reading/f95431ca9a42f8cc326def4b0c44563876797b45e44e9268cf9b9a4d634f5f9f.md), [operator-receipt-workbench](../AIM/reading/a357eac1f7ebf1b8fcf6edee90c086783da65f07d18fbdcc06236891e314cebc.md), [operator-container-insight](../AIM/reading/56f58af05b639903354ee78fe799f51fefee04136179aa4cf2c434fc9c82a65a.md)

## Unexpected putaway destination: ordered rules and decision history

An empty-looking slot is not enough to make it an eligible putaway destination. SCALE evaluates the applicable locating rule in sequence, with each strategy restricted by its location selection and capacity rules. Use Process History for locating decisions and Transaction History for actual locating events; the word exception alone does not identify a documented fallback rule.

1. Identify the receipt container and its locating rule. Receipt Workbench first shows the assigned rule in Destination after check-in, then the chosen location after successful locating. Parent locating uses the parent rule; child locating uses the nested container rule.
2. Read the rule details in ascending sequence. For each detail, inspect the locating strategy and optional Location Selection, including its sort. A location outside that selection is not a candidate just because it looks empty.
3. Compare rejected or unsuitable candidates with the actual strategy: Empty Location excludes an empty permanent location assigned to another item; same-lot consolidation has a lot requirement; Fill One And Only One Location stops looking within that selection after the selected location is full. These examples are distinct algorithms, not universal rules applied together.
4. Check quantity/unit compatibility and capacity. Item/location capacity records take precedence over the documented multi-item volume calculation. Split Quantity permits remaining quantity to continue to another rule detail; a serial-number-linked receipt container cannot be split. Without a satisfiable detail, locating can fail.
5. Check whether Delayed Locating and Create Putaway Work both apply: that combination uses a receiving pre-locate location. Otherwise rule details govern. Quick Receive can ask the user for a location if none is found; that is not proof of an automatic exception destination.
6. Research Process History for the locating decision and any recorded failure or rejected choice, and Transaction History for the actual event. Compare the recorded rule/sequence and reason with the candidate checks above. The source identifies these history purposes, but does not promise a complete list of every rejected location.

Configuration: Receipt container locating rule, parent/child locating mode, ordered detail strategy and location selection. Item/location capacity, unit of measure, lot restrictions, Split Quantity and delayed-locating/putaway-work flags.

Checks: Provide the exact destination description, effective rule/sequence, selected strategy and the recorded decision or error. If history does not expose a rejected candidate, its rejection reason remains unestablished.

Sources: [operator-locating-process](../AIM/reading/4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa.md), [operator-locating-rules](../AIM/reading/a3869416433c59c85b566e9a0be734881a8f8c0a3757934f651c97c14db936eb.md), [operator-receipt-workbench](../AIM/reading/a357eac1f7ebf1b8fcf6edee90c086783da65f07d18fbdcc06236891e314cebc.md), [operator-mobile-receiving](../AIM/reading/21b18b42c82e530935c24cb0848bb4d666bef09aa74cbd6ce61dd8b24e457e99.md)

## Receiving prompts for lot and serial numbers

Receiving prompts start with the item tracking requirements and the exact receiving flow. A lot-controlled item may need a lot ID when the receipt line does not already supply it. Serial-number tracking has separate inbound, inventory and outbound options; inspect those options and any template before treating a prompt as an error.

1. On the item definition, inspect Lot Controlled and Lot Template, then Serial Number options and its Template field. The lot template controls the lot-ID structure; serial options specify the warehouse flow being tracked. A serial template constrains the serial format; without one the article allows free-format characters. These are item controls, not a Packing preference.
2. In Warehouse Mobile Receiving, a lot-controlled item with an assigned lot template uses the Enter Lot screen for header-item, license-plate and blind receiving. Template autofill can populate the lot and expiration date. Without a template the documented flow still asks for lot, expiration/frozen state and inventory status; no template does not mean no lot control.
3. Compare the receipt line with the prompt. Mobile documents a lot prompt when no lot is configured on the receipt line. Existing lot data can supply expiration/status, and changing expiration or frozen inventory status can lead to Confirm Lot Update. Do not change tracking solely to suppress that confirmation.
4. For serial entry in mobile receiving, the documented prompt count follows check-in quantity: one serial for one unit and serials for multiple units. Duplicate serial entries are rejected and linked serial-number templates are validated. Inspect the applicable inbound/inventory tracking and whether serials already arrived through the interface. The nested-parent flow specifically supports inbound/inventory serials already supplied in the interface, and outbound-only tracking.
5. For Receipt Workbench, the documented Lot Entry and Serial Number Entry screens collect tracking values during check-in. Review the selected user-authorized receiving preference and the exact displayed screen; mobile and Workbench have different prompt sequences. A receipt line with an existing lot can follow a different path from a line without one.
6. If check-in splits quantity into multiple receipt containers, mobile can request tracking information for each container. Check the storage-template Group During Check In setting and unit of measure before interpreting repeated prompts as duplicate work.

Configuration: Item Lot Controlled, Lot Template, Serial Number flow options and serial Template. Receiving initiation/execution method, receipt-line supplied lot/serial data, storage-template grouping and check-in quantity/unit.

Checks: Record the exact screen label and tracking prompt, receipt entry method, item tracking flow, template presence and whether values were already supplied. These checks distinguish a required collection prompt from duplicate or format validation; current item values are not available to this library.

Sources: [operator-item-tracking](../AIM/reading/505c5c4630e085fc146ea8699fd6ca8b29c4f269b413b1ce93e0e981d01241b2.md), [operator-mobile-receiving](../AIM/reading/21b18b42c82e530935c24cb0848bb4d666bef09aa74cbd6ce61dd8b24e457e99.md), [operator-receipt-workbench](../AIM/reading/a357eac1f7ebf1b8fcf6edee90c086783da65f07d18fbdcc06236891e314cebc.md)

## Packing station container choices: company and warehouse access

Define the container types used for packing, then authorize them for the shipment company and warehouse. The user packing preference controls how packing starts and how container IDs are assigned; it is not the same as the type authorization. An existing container keeps its established type.

1. In Defining Container Types, the Company Access and Warehouse Access tabs govern eligibility during Packing, Close Container, nesting and picking/putaway into shipping containers. If the shipment header has a company, both company and warehouse authorization are required; warehouse authorization also applies when company is blank.
2. Check the employee User Profile Packing Preferences field. A blank field selects the preference named *Default. In Packing, compare New versus Existing and manual versus system container assignment; an existing container type cannot be changed through the Packing type field.
3. For a new package, choose a type eligible for the shipment context and appropriate for its dimensions/weight. Defining a physical workstation supports document routing and printing; this retained Workstation article does not establish a separate workstation-specific list of container types.
4. Keep wave Container Group choices separate from manual Packing authorization. The Container Types article explicitly says company/warehouse authorization is not used by wave container creation or pallet building; those paths use packing classes/groups/types or pallet-building criteria/masters.
5. Do not use Use As Default as a universal Packing default. The documented checkbox supplies a default type for scan-and-weigh container creation when no type is interfaced, and sets company authorization to All. It has no stated effect outside that scan-and-weigh use.

Configuration: Container Type Company Access and Warehouse Access; shipment header company/warehouse. User Profile Packing Preferences (*Default when blank), Packing initiation and container-assignment method.

Checks: For a missing type, compare the shipment company and warehouse with the type access lists, then check whether the selected container already has a type. Capture the exact field/action and error; this does not establish the current user permission or installed configuration.

Sources: [operator-container-types](../AIM/reading/b8520236e77bf1d9729a56d56a398123183351403f9a3eff7e86595795483b9e.md), [operator-user-preferences](../AIM/reading/80b3ffb7968806f7f9c954f5e2af42c649492c456ff19cd59e91cecca1bd3f51.md), [operator-packing-screen](../AIM/reading/9b67b9530e31965bd804c9ba287844c4c4e58e604703f6bffbfb9b24b1d819ac.md), [operator-workstation](../AIM/reading/b8d6ad6ff9d28497e03fe77e2e384a39d93718f9fb7bb39c83706b3b8c603bf7.md)

## Replacement license plate rejected: distinguish Packing from Override Pick

The retained SCALE Packing instructions describe selecting a shipping container and packing shipment-line items. They do not establish a Packing action called replacement LPN or its validation rules. First identify whether the rejection is in Packing or in Warehouse Mobile Override Pick; an item that looks the same does not prove that either action accepts it.

1. In Packing, identify whether the scanned value is the shipment initiation value, shipping Container ID, item/item cross-reference or serial number. Check Status Info and open the specific Error-column message. Existing shipping-container selection is documented; replacement of an inventory license plate in Packing is not established by these sources.
2. If the actual screen is mobile Pick Confirmation or Override Pick, apply the separate picking contract: Override Pick security and the relevant Work Special Handling license-plate override must allow it. Quantity differences, grouping and container verification have their own documented conditions. These are picking controls, not a Packing substitution procedure.
3. For an Override Pick from another location/license plate, the inventory-attributes article requires the new pick location to have the same attribute values as the original. Lot/location/LP changes must also pass the applicable override validation. Visual similarity or an item name alone is therefore insufficient evidence that a pick override is eligible.
4. Provide the exact screen/action label, error text, scanned identifier type, whether the item has already been picked/packed, and a sanitized description of differing quantity, lot or inventory attributes. If it is truly a Packing-specific replacement action, the missing evidence is its installed screen/action contract or source documentation; do not borrow another product's LPN rules.

Configuration: Packing preference initiation/item validation versus Override Pick security and Work Special Handling; these apply to different flows. Picking inventory attributes, lot, quantity/grouping and LP/container verification, only when the actual action is Override Pick.

Checks: No current-state diagnosis or replacement-LPN permission is supported. Use the exact application error and screen context to choose the documented action, and retain the unknown if it is a separate/custom Packing action.

Sources: [operator-packing-screen](../AIM/reading/9b67b9530e31965bd804c9ba287844c4c4e58e604703f6bffbfb9b24b1d819ac.md), [operator-override-pick-continuation3](../AIM/reading/f586c2d66cc03deffc95bea01eb4a2ab97713125c8aabc4d2e37f152b3ddf672.md), [operator-inventory-attributes](../AIM/reading/c3f65ac4de2fc3dce97e4180f4db0eaaa010a10166193e50df4370c1ee3c7799.md), [operator-work-processing](../AIM/reading/2a849da2c18bc5244f4e44f5346f871a765c86c96d43a011314a5857cfea60c5.md)

## Moving packed items: unpack, repack or nest

For an individual item in a loose packed container, Shipping Container Insight provides Update Packed Quantity to unpack some quantity. Enter the quantity that should remain, then use the documented Packing flow for an eligible open destination. Moving a whole child container through nesting is a different action. A closed destination cannot accept more items.

1. Identify whether the selected record is an individual item in a loose packed container, a full container, or a parent/child container. Update Packed Quantity is documented only for individual items in a loose packed container; it is unavailable on parent records and full-container records.
2. Update Packed Quantity takes the quantity remaining in the source container, not the quantity to remove. SCALE unpacks the difference and writes transaction history. Serial-number or catch-weight tracking prompts for the serials or weights removed. For example, to remove 2 from 8, the remaining quantity is 6.
3. Before repacking, verify that the intended shipment line has quantity available to pack and that the destination is an eligible existing or new shipping container for that entity. Packing works with picked lines and reports errors for ineligible input. The documented close process means packing is complete and no additional items can be packed into that closed container.
4. If moving an entire child container, evaluate Nest/Combine or the documented re-nest flow instead of treating it as an item-quantity move. Nesting requires the same shipment and dock, and active work can block it. Combining two loose containers nests the source under the destination; it does not merge their item quantities into one loose container.
5. Check both container statuses, outstanding work, shipment/dock relationship and the exact allowed action before physical movement. Re-nesting has additional release/pending-work/security constraints. The Update Packed Quantity paragraph does not define every closed-source status or a general reopen action, so those permissions remain unestablished. Verify the resulting source quantity, destination quantity and transaction history after any separately authorized operation.

Configuration: Container structure (loose item/full/parent/child), source and destination status, available picked quantity and tracking. Shipment/company/warehouse eligibility, dock location, work/release state, and permission for the selected item or nesting action.

Checks: Record source/destination structure and status, quantity remaining versus quantity moved, exact error, and whether the move concerns an item or an intact child container. Do not physically shift contents on the assumption that a container-ID change updates inventory.

Sources: [operator-container-insight](../AIM/reading/56f58af05b639903354ee78fe799f51fefee04136179aa4cf2c434fc9c82a65a.md), [operator-unpack-quantity](../AIM/reading/a1faa0e1355de431b077b9a3474599d133c6df165074b84f2689fab45de39271.md), [operator-packing-screen](../AIM/reading/9b67b9530e31965bd804c9ba287844c4c4e58e604703f6bffbfb9b24b1d819ac.md), [operator-close-container](../AIM/reading/f992a81240ef21071a0c60e111f7a41770da3bcd1ad4ca55d2f3db634e255a7f.md), [operator-container-nesting](../AIM/reading/7b4a6ef1c835af34ee3893ec7445fc39b81925227dcfef1fff39adfb2392e9e9.md)

## Evidence limits

- This is an explanation of the cited SCALE documentation. The owner accepts the current replica as the documentation baseline; no version/build prerequisite applies.
- The library cannot inspect the current work unit, container, user permissions or effective settings. These checks identify possible causes, not a diagnosis of a specific record.
- No warehouse action was executed and no live screen navigation was tested. Follow the authorized warehouse procedure before changing configuration or confirming work.

The separate 24-question survey remains outside the retrieval index. These authored regression questions are not an independent holdout.
