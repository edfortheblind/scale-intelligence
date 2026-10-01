# SCALE Functionality Reference SDD

A consolidated functional guide from retained SCALE references

This reference explains warehouse functions, their configuration relationships and the limits of the available evidence. It brings the retained SCALE training and implementation guides into one neutral account of functionality.

Implementation guides describe particular design decisions. Their useful process explanations are retained here without treating those decisions as standard product defaults or the configuration of a current warehouse. Each topic states the qualifications that matter to its use.

Use the contents to find a functional area. Read the summary first, then the process explanation and its limits. Source codes identify the supporting references; the companion provenance register binds every entry to exact retained passages.

## Contents

1. [Using this functionality reference](#reference-scope)
2. [Foundations and master data](#foundations)
3. [Receiving](#receiving)
4. [Putaway and replenishment](#putaway-replenishment)
5. [Inventory control, counting and traceability](#inventory-counting)
6. [Outbound orders and waves](#outbound-orders-and-waves)
7. [Allocation and container planning](#allocation-and-container-planning)
8. [Work creation and management](#work-creation-and-management)
9. [Picking execution](#picking-execution)
10. [Packing, loading and shipping](#packing-loading-shipping)
11. [Interfaces and data exchange](#interfaces)
12. [Documents and labels](#documents-labels)
13. [Administration and Insight configuration](#administration-insight)
14. [Labor planning and activity visibility](#labor-visibility)

Citations use neutral reference codes. Each entry has an identifier in the [source-binding register](derived/scale-functional-reference.json), which retains exact source hashes and passage locations.

<a id="reference-scope"></a>
## Using this functionality reference

Read the following chapters as an explanation of SCALE mechanisms and configuration relationships. They consolidate retained training and implementation references; they do not describe an installed environment.

<a id="reference-applicability"></a>
### Scope and release applicability

A design revision, training date or printed date does not establish the release or configuration of an installed SCALE system.

The source set includes work and picking training, a configuration walkthrough, label training, screen configuration guidance and three implementation guides. A mechanism can be explained from those references while its availability, precise fields and configured behavior remain dependent on release and implementation.

Use each entry’s local limits with its explanation. Configuration values selected in an example are not universal defaults. Proposed extensions, unresolved comments and unverified interface contracts do not become standard functionality when implementation names are removed. Confirm release support and actual configuration before using this reference to make an operational change.

**Limits:** This is a bounded functionality synthesis of seven retained SCALE sources. It is not a complete product specification or evidence of current deployment behavior.

*Sources: R03, R04, R07, R02; entry `reference_applicability`.*

<a id="foundations"></a>
## Foundations and master data

Warehouse processes depend on consistent item, company, unit, location and capacity definitions. These concepts explain how configuration records connect; they do not prescribe an implementation or supply universal defaults.

<a id="configuration-dependencies"></a>
### How configuration areas connect

Configure the records a process depends on before connecting its execution rules.

Items, locations, inventory management, receiving, work, allocation, waves, counting and replenishment form connected functional areas. A receiving flow can depend on docks, inventory statuses and work types; a movement flow then connects those definitions to its work configuration. Some operations need only a subset of the available areas.

Treat configuration order as a dependency check. Identify which records must exist for the next rule or preference to refer to them. A short configuration walkthrough is an introduction to these relationships, not a complete setup specification.

**Limits:** The reference does not mandate one configuration sequence. Feature-specific Help is needed for complete fields, constraints and release behavior.

*Sources: R02; entry `configuration_dependencies`.*

<a id="company-item-identity"></a>
### Company and item identity

Company is part of the inventory context and can accompany incoming business records.

The reference model associates item master records and inventory with a company. Receipts and shipments can carry company information through interfaces, so a product identifier must be interpreted in its intended company context. This matters when reading inventory or comparing quantities across business records.

Define the ownership relationship before interpreting an apparent stock match. A company association in an item record and a company supplied on a receipt or shipment are related inputs; they are not evidence that stock can automatically satisfy another company’s demand.

**Limits:** The sources describe separate-company inventory choices. They do not establish a universal sharing prohibition, cross-company transfer contract or default company assignment.

*Sources: R05; entry `company_item_identity`.*

<a id="item-units-measurements"></a>
### Item units and measurements

Handling quantities, dimensions and weight must be interpreted with their unit of measure.

Item unit-of-measure configuration describes the quantity in which an item is handled and its associated dimensions and weight. The configuration explanation permits identifying the subject by an individual item or an item class. Conversion quantities connect handling units to the quantities used by warehouse processes.

Keep the quantity unit separate from dimension and weight units. A case quantity is meaningful only with the corresponding conversion definition; a numeric size is meaningful only with its measurement unit. These distinctions support interpreting receiving quantities and location-fit decisions.

**Limits:** The retained walkthrough has a prose/image disagreement about multiple units for one item. It does not establish unit cardinality, item-over-class precedence or a standard conversion value.

*Sources: R02; entry `item_units_measurements`.*

<a id="location-identifiers"></a>
### Location identifiers and generation

A location identifies a warehouse position used by picking, putaway and replenishment.

A location template defines the naming structure for a group of locations. Its components have a character length and an alphabetic or numeric field type. A set of locations is generated using the selected template and warehouse, with starting values, ending values and increments.

The increment controls which identifiers are generated within that range; it is not a physical travel sequence. For example, a larger numeric increment selects fewer identifiers between the same endpoints. Establish the intended naming structure before using the generated identifiers in process rules.

**Limits:** The reference examples explain generation mechanics, not a required warehouse naming convention or verified picking order.

*Sources: R02; entry `location_identifiers`.*

<a id="zones-processing-roles"></a>
### Zones and processing roles

Zones group locations for a particular kind of warehouse processing.

Allocation, locating and work zones serve different purposes. A zone groups locations to control the locations considered during a process; it is not itself a physical position. The same physical location can therefore have different zone values for allocation, locating and work.

Work-zone configuration can associate relevant work profiles. When explaining a rule, identify the actual zone type and association rather than relying on a familiar prefix in its name. A name can help a person recognize a convention but does not create the functional relationship.

**Limits:** The walkthrough describes SCALE 2020 configuration. It does not establish precedence between zone associations and every other work-profile restriction.

*Sources: R02; entry `zones_processing_roles`.*

<a id="capacity-and-fit"></a>
### Location capacity and fit

Quantity capacity and dimensional fit are related controls with different inputs.

Item/location capacity defines a maximum quantity for an item or item class at a location or location type. The reference says this capacity is considered during putaway and replenishment. Location types can also supply length, width, height and weight constraints; their dimensions are used when item location capacity is not configured for the item.

A large value shown in an example is still a configured value, not proof of an unlimited-capacity sentinel. The absence of an optional dimension or weight limit must also be distinguished from a measured physical capacity.

**Limits:** The SCALE 2020 walkthrough explicitly says manual location override and RF transfer disregard item/location capacity. Do not assume every movement path enforces the same fit checks.

*Sources: R02; entry `capacity_and_fit`.*

<a id="receiving"></a>
## Receiving

Receiving connects expected goods, the physical arrival and the creation of inventory. Keep receipt identity, check-in, locating, quality disposition and closure distinct when tracing an inbound flow.

<a id="receipt-record-levels"></a>
### Receipt, line and container records

Use the record level that matches the question being investigated.

Receipt Insight provides the receipt-level view. Receipt Line Insight exposes its lines, while Receipt Container Insight provides the container view for downloaded or created advance shipping notices. These levels support different questions: the overall receipt, the expected products and the received container identity should not be treated as interchangeable.

Receipt ID Type is a configured classification separate from the Receipt Type value. The reviewed receiving descriptions call Receipt Type a free-format field and say it is not validated. A descriptive type value therefore does not by itself prove a particular receiving workflow.

**Limits:** Permitted identifiers, interface mappings and receipt-type names are configuration contracts; no named example is a required value.

*Sources: R06, R07; entry `receipt_record_levels`.*

<a id="receipt-creation-paths"></a>
### Receipt creation paths

A receipt can originate through an interface or an authorized creation workflow.

The references describe manual creation in Receipt Insight, receipt creation from shipment data for returns, and receipts downloaded from another system. They also describe blind receiving as creating a receipt and adding lines when an advance shipping notice is absent. These are alternative entry paths, not a requirement to enable every path.

A permission can prevent manual creation even where the product supports it. The presence of an existing shipment also does not establish every desired return automation: a scan of an outbound container that reconstructs a new receipt may require a separate custom design.

**Limits:** Blind-receiving adoption is described inconsistently in the references. Treat its use as configuration-dependent; do not infer installed availability or a universal interface format.

*Sources: R06, R07; entry `receipt_creation_paths`.*

<a id="receiving-preferences"></a>
### Receiving preferences and check-in

Check-in creates inventory using the receiving preference for the selected workflow.

Unloading and inspecting goods are physical activities; systematic check-in is the step described as creating inventory in SCALE. A receiving preference can specify a receiving dock, inventory status and work type. Its RF settings determine the check-in initiation workflow and execution method.

The documented execution choices include check-in only, check-in with locating and quick receiving. These choices determine which process stages are combined. Immediate locating is described as a prerequisite for putaway-group creation, but satisfying a prerequisite alone does not establish that every group-related option is enabled.

**Limits:** These are configuration mechanisms, not recommendations to activate a particular method. Group receiving has additional release and configuration limits described under putaway.

*Sources: R05, R02; entry `receiving_preferences`.*

<a id="receiving-quantities-lots"></a>
### Quantities, units and lot information

Receiving must associate the physical quantity with the intended receipt line and inventory identifiers.

The item-receiving flow identifies the receipt and product, then accepts a quantity in the applicable unit of measure. Lot and expiration information can be prepopulated when supplied on the receipt detail. Where the same item appears on several details with different lots, the documented mobile flow asks the receiver to select the relevant line.

When information is not supplied, the workflow may request entry or scanning. Serial capture is separately conditional on inbound serial tracking. Automatic parsing of a composite barcode must not be assumed from the presence of a product barcode.

**Limits:** Lowest-unit defaults and required scans depend on the receiving preference and item. The references identify enhanced barcode parsing as extension work, not a universal base behavior.

*Sources: R06, R05; entry `receiving_quantities_lots`.*

<a id="inbound-appointments"></a>
### Inbound appointment visibility

Appointments connect an expected receipt to a dock and a time window.

The documented appointment workflow starts with a receipt already visible in SCALE and permits scheduling only open receipts. Appointment details include trailer identification, dock door, and start and end dates and times. Receipt Insight and an appointment calendar provide views of the resulting schedule.

The calendar supports inspecting details and managing appointments, while a dock assignment remains a distinct operational choice. The existence of appointment functionality does not establish that scheduling is performed inside SCALE for a particular operation or that a dock was assigned automatically.

**Limits:** This entry describes the referenced inbound workflow only. It establishes neither an outbound appointment contract nor a universal dock-assignment strategy.

*Sources: R07; entry `inbound_appointments`.*

<a id="receiving-exceptions"></a>
### Missing records and receiving discrepancies

Resolve the missing prerequisite before interpreting a receiving failure as a quantity problem.

A check-in flow requires receipt information in SCALE. An unknown product can also lack both a receipt line and an item master record; the reference workflow resolves the item identity and receipt information before normal receiving resumes. Missing unit, weight or dimension information is a different prerequisite problem.

Overages and shortages need explicit handling. The references give examples of creating an additional expected receipt for excess goods and manually closing an incomplete receipt when no further balance is expected. These examples explain the decisions involved without prescribing one correction procedure.

**Limits:** Over-receiving permissions, data ownership and host correction procedures are implementation choices. Do not create inventory for goods that are physically missing merely to follow a reference example.

*Sources: R06, R07; entry `receiving_exceptions`.*

<a id="receiving-disposition-quality"></a>
### Disposition and quality decisions

Disposition can connect received inventory condition to status and a locating rule.

The documented returns and damaged-goods workflows use disposition information to represent the received condition and to select a locating rule. This permits separate handling for inventory awaiting a decision, damaged stock and stock ready for normal use. A reason for return and the inventory’s disposition are distinct pieces of information.

Physical inspection and a status change are also distinct actions. In the reviewed pattern, goods may be put away while a held status remains, then receive a new status following inspection. An unfavorable result can require movement to a designated location.

**Limits:** No universal receiving status, inspection percentage or quality workflow is established. Manual inspection procedures and customized quality processes must not be presented as an automatic base quality engine.

*Sources: R06; entry `receiving_disposition_quality`.*

<a id="receipt-completion-upload"></a>
### Receipt completion and upload timing

Leaving a receiving screen, closing a receipt and notifying another system are separate events.

Exiting the mobile receipt flow does not close the receipt. The described completion flow closes a fully received receipt after final putaway; an incomplete receipt can require a separate manual close. Closing prevents further receiving until the receipt is reopened through a permitted action.

Receipt upload eligibility depends on configured status and upload level. If an interface reports inventory before final completion, canceling and receiving it again can create duplicate inventory in the receiving system unless the correction process handles that earlier message. Screen exit alone says nothing about interface completion.

**Limits:** Automatic closure and upload thresholds are workflow-dependent. The references do not establish one required status, schedule, integration transport or rollback contract.

*Sources: R05, R07; entry `receipt_completion_upload`.*

<a id="putaway-replenishment"></a>
## Putaway and replenishment

Locating selects a destination; movement work carries out the move. Replenishment adds a request-generation decision based on storage need or order demand before that movement is executed.

<a id="locating-and-movement"></a>
### Locating versus putaway

A selected destination is not yet a completed physical movement.

Locating evaluates a checked-in receipt container to find a storage destination. The reviewed rules combine a strategy with location selection and evaluate a sequence of alternatives. In the documented flow, successful locating creates work to move goods from the receiving dock.

Putaway executes that work and confirms the destination. A rule can be assigned at receipt-line level while the container or license plate remains the object being located. This distinction helps explain why changing line configuration is not equivalent to confirming every container’s movement.

**Limits:** The references describe particular receiving flows. Work creation and locating execution timing still depend on the selected receiving preference and applicable release.

*Sources: R06; entry `locating_and_movement`.*

<a id="locating-sequences"></a>
### Locating strategies and eligible destinations

A strategy chooses how to search; location selection defines where that search is allowed.

The reviewed locating examples distinguish an item’s assigned location, consolidation into a location already holding the item, an empty location and a specified exception location. A rule combines such a strategy with a location selection and sequence. Separate rules can address ordinary, damaged or inspection-held inventory.

A split-quantity option is another part of the rule detail. Allowing a quantity to split can affect resulting work identities when the license plate is used as the work-unit identity. The visible order of one example should not be copied as a universal storage policy.

**Limits:** These strategy examples do not establish a mandatory sequence, a universal fallback location or the complete predicates used by an installed rule.

*Sources: R06, R05; entry `locating_sequences`.*

<a id="putaway-execution"></a>
### Starting and completing putaway work

The work profile controls how a user selects and confirms the movement.

In a user-directed receipt-putaway pattern, the pallet or license-plate identifier is the work-unit identifier. Scanning it assigns the work to the user and displays the receiving dock, item and quantity. Confirmation starts the movement and the workflow displays a destination for verification.

The described flow returns to skipped instructions after other instructions in the work unit. Final destination confirmation updates the destination on-hand quantity and the receipt container’s state. Host notification remains a separate eligibility and interface decision, not a consequence established solely by scanning the destination.

**Limits:** Work-unit composition, location ordering and required verification fields are configured. The example does not require every putaway flow to use a license plate as its work-unit identifier.

*Sources: R06, R05; entry `putaway_execution`.*

<a id="license-plate-verification"></a>
### License-plate verification during putaway

Display, verification and replacement of a license plate are different confirmation behaviors.

Receipt Putaway verification can display the existing license plate without allowing a change, require the user to enter that same identifier, display it while allowing an override, or require a user-specified identifier. The verification option rejects an entered identifier that differs from the existing one.

Choose the meaning of the prompt before interpreting its result. Seeing an identifier on screen is not the same as scanning it for confirmation, and an editable field is not the same as a guarantee that a new plate should be created.

**Limits:** These are documented work settings. They do not establish the active choice, plate-number generation rules or permissions in an installed environment.

*Sources: R01; entry `license_plate_verification`.*

<a id="putaway-override"></a>
### Destination override and relocating

A manual destination and a rerun of locating are two different correction paths.

The override workflow permits an authorized user to enter another location, validates it, updates work and license-plate destination information, and records transaction history. The user then completes the usual putaway confirmation. The described Locate option instead asks for a locating rule and lets the system select a destination using that rule.

The reference also identifies an optional activity-based count at the original destination. That is a configurable follow-up, not an inevitable result of every override. Review which destination was selected and which action changed it when investigating the movement.

**Limits:** Validation details and capacity checks differ by action and release. Permission to override does not establish that every ordinary locating constraint is re-applied.

*Sources: R06, R07, R02; entry `putaway_override`.*

<a id="putaway-groups"></a>
### Optional putaway groups

Grouping can organize received containers into a common movement unit.

A putaway location group can be defined through destination ranges or locating zones. The described configuration keeps the chosen grouping method consistent within a warehouse and associates the group with the parent license-plate field. Receiving examples build a pallet or cart from smaller received containers and close the group before group work is created.

This is a documented pattern with a material release limitation: one reference explicitly records Receiving with Putaway Groups as unavailable in Warehouse Mobile version 24.1.2278. A design diagram or configured preference therefore cannot prove executable support.

**Limits:** Use only where the actual product release and receiving workflow support it. No later delivery date or removal of that recorded limitation is established by these sources.

*Sources: R05, R07, R02; entry `putaway_groups`.*

<a id="replenishment-need"></a>
### Replenishment need and selection

A replenishment master connects why stock is needed with what stock and destinations are considered.

Replenishment can be based on a location’s need or demand generated by a wave or order pool. Location criteria identify the locations evaluated for capacity needs or the destinations considered for demand replenishment. Item criteria narrow eligible items for wave or pool demand.

The master links these selections with an allocation rule, request-generation method, increment and replenishment strategy. Capacity-based examples require item/location assignment and capacity records and evaluate locations against a minimum percentage. The threshold is configurable; neither a daily schedule nor one fixed percentage follows from this mechanism.

**Limits:** Manual inventory transfer is a separate movement path. Real-time or scheduled replenishment must be enabled and coordinated with other request-generation flows.

*Sources: R06, R05, R02; entry `replenishment_need`.*

<a id="replenishment-demand-work"></a>
### Demand replenishment, rounding and work

Demand calculation, replenishment allocation and execution work are separate stages.

A wave can evaluate picking-location availability against order demand and request replenishment in a configured unit increment. The documented pattern rounds requests upward and creates in-transit inventory directed toward the forward location. A subsequent allocation step can use that expected inventory under the applicable configuration.

Work creation for wave replenishment acts on demand-based requests already created; it does not itself define the entire replenishment policy. Distinguish the requested quantity, the selected source inventory and the work instructions used to move it when explaining a shortage or delayed pick.

**Limits:** No universal FIFO or FEFO rule is asserted: the source prose and sequence tables disagree for some items. Use the actual rule details and tracked attributes to determine selection.

*Sources: R06, R02; entry `replenishment_demand_work`.*

<a id="inventory-counting"></a>
## Inventory control, counting and traceability

Inventory control distinguishes where stock is, how much exists, its recorded condition and the identifiers used to distinguish it. Counting verifies that record; reconciliation makes an authorized correction.

<a id="inventory-inquiry"></a>
### Inventory inquiry

Read the relevant inventory record before choosing a corrective action.

Warehouse Mobile location inquiry provides access to location inventory records and supports comparing recorded quantities with what is physically present. The reference also exposes adjustment and transfer actions from this inquiry. The inquiry itself is a view; opening it does not make a physical count or change the inventory.

An adjustment changes recorded quantity, a transfer moves quantity between locations, and a status change records a different inventory condition. Identify which mismatch is being resolved before selecting the action. A correct quantity at the wrong location requires a different explanation from a missing quantity.

**Limits:** Available actions depend on security and configuration. A displayed result is not evidence that every inventory identity or physical condition has been independently verified.

*Sources: R06, R05, R07; entry `inventory_inquiry`.*

<a id="inventory-adjustments"></a>
### Quantity adjustments

An adjustment increases or decreases on-hand quantity and records the transaction.

Inventory Management adjustments operate on located inventory. The described workflow accepts a location and item directly or from a selected inventory record, then applies the entered adjustment quantity. Negative quantities represent reductions. Confirmation changes the inventory quantity and creates a history record.

Adjustment types provide reason-based control and can include minimum and maximum quantities, user access and host-upload exclusions. These settings govern the correction path; they are not a reason to treat a general-purpose manual tool as an unrestricted way to rewrite stock.

**Limits:** The documented Inventory Management path excludes receiving-dock inventory. Specialized tracking restrictions and custom adjustment tools need their own contracts.

*Sources: R06, R05; entry `inventory_adjustments`.*

<a id="inventory-transfers"></a>
### Transfers and movement work

A transfer changes the location of existing inventory.

A transfer moves on-hand quantity from one location to another within the warehouse. Transfer types can represent the reason for movement and restrict quantities and user access. Starting from a selected location/item supplies that source context; starting without a selected record requires the user to identify it.

Transfers can also create work so that a supervisor selects the inventory to move and an operator executes the physical movement. The referenced transfer-with-work path is created in Insight and can be executed on an RF device. Request creation and movement confirmation remain separate stages.

**Limits:** The source does not define a complete cross-warehouse or inter-building transfer and interface contract. Do not extend the within-warehouse description to those movements.

*Sources: R06; entry `inventory_transfers`.*

<a id="inventory-status-identity"></a>
### Inventory status and record granularity

A status describes inventory condition; it does not identify a physical movement.

Inventory Status Change updates the recorded status for selected inventory and creates transaction history. Status-change types and user access are configurable. Putaway does not necessarily release a held status: the references show inventory remaining held after storage until an inspection decision authorizes another status.

Mixed conditions also depend on inventory identity. The cited note restricts mixed Available/Damaged quantities when the location is not license-plate tracked or lacks different inventory attributes. It does not establish a complete rule for when mixed statuses are permitted. A status name alone does not establish whether all allocation selections exclude that stock.

**Limits:** Status values and release procedures are configured. The references show location-selection exclusions as a separate way to keep damaged stock out of ordinary allocation.

*Sources: R06, R07; entry `inventory_status_identity`.*

<a id="cycle-count-requests"></a>
### Plan-based and activity-based counts

A count request can come from a planned selection or a warehouse event.

A cycle-count plan defines eligible items and locations and generates count work for the selected locations. The described plan creates a separate work unit for each selected location. Selection criteria can narrow the population, such as by previous count information, without requiring every location to be counted together.

Activity-based counting evaluates a processed location after an event such as a short pick or a quantity crossing a configured threshold. Threshold configuration can include a minimum interval between counts. Generating a request does not by itself reroute the operator into the count screen.

**Limits:** Threshold values, enabled events and plan criteria are configuration choices. No fixed count frequency or automatic immediate screen transition is established.

*Sources: R05, R07, R02; entry `cycle_count_requests`.*

<a id="cycle-count-execution"></a>
### Count assignment and count level

The assignment method chooses the work; the count level determines what the operator must report.

The referenced mobile flow selects a cycle-count work profile and can use a scanned location to find nearby work or a user-directed location to select the intended count. Once assigned, the workflow presents the location and requests the relevant quantity.

Standard Count presents individual counts. Blind Count presents only the location identifier, requiring the operator to identify what is physically present. Count License Plates asks for plate counts, but a discrepancy requires counting their actual contents; multi-item locations require individual quantities even when plate counting is selected.

**Limits:** The nearby-work example does not define a distance algorithm. Available count levels and prompts depend on work configuration and the inventory being counted.

*Sources: R06, R01; entry `cycle_count_execution`.*

<a id="count-verification-reconciliation"></a>
### Verification, tolerance and reconciliation

Repeating a physical count and authorizing an inventory correction are different decisions.

With Verify Bad Count in the described workflow, an initial discrepancy prompts another count and two consecutive equal counts complete verification. Verification establishes the reported quantity; it is not the same as accepting every variance automatically.

Counts outside the user’s tolerance move to Pending Review. Reconciliation lets an authorized reviewer confirm the correct on-hand quantity, update location inventory, record an inventory transaction and close the count request. Tolerance and review rules therefore determine whether a counted variance can proceed directly or needs additional action.

**Limits:** No universal zero tolerance is asserted. A restriction preventing an entire plan from closing while requests await review is separately described as an extension and is not included as base behavior.

*Sources: R05, R07; entry `count_verification_reconciliation`.*

<a id="grouped-counts-new-plates"></a>
### Grouped counts and newly found license plates

Grouping simplifies a count only while its identity and verification conditions remain satisfied.

Group Count By Item/Company combines a location’s quantity for that item and company across lot, inventory-attribute and license-plate values. A quantity mismatch, adding an item, or enabled lot/plate verification ungroups the work. Multi-item and empty-location counts require individual confirmations.

Adding a newly found license plate is governed separately by count settings and user tolerances. In the documented user-initiated plate-selection mode, the workflow can accept an addition within tolerance or send it to Pending Review; another option sends all such additions for review.

**Limits:** Permission to add items changes how the new-plate settings are applied. Grouping does not eliminate the need to preserve lot or plate identity when verification requires it.

*Sources: R01; entry `grouped_counts_new_plates`.*

<a id="lot-serial-traceability"></a>
### Lot and serial traceability

Tracking identifies inventory more precisely than item and quantity alone.

Receiving can associate lot and expiration information supplied on a receipt detail, or request entry where it is absent. Inbound serial tracking adds capture of the individual serial number. The item’s tracking definition determines whether that additional identity is needed; one receiving flow does not establish tracking for all items.

The references also distinguish a serial value from its item context: a reviewed clarification permits the same serial value for different items. That does not make duplicate acceptance a universal setting or establish a complete regulatory serialization workflow.

**Limits:** Enhanced barcode parsing, specialized serial tables and external tracking-system events are separately designed extensions. None is promised here as automatic base traceability.

*Sources: R06; entry `lot_serial_traceability`.*

<a id="inventory-host-messages"></a>
### Inventory history and host messages

A recorded inventory change and its communication to another system are distinct events.

Inventory transactions can describe quantity adjustments and status changes for host communication. The references identify these changes as eligible for upload, but also show configuration that suppresses upload for selected adjustment types or does not interface every change when it occurs.

A cycle-count flow may additionally report an initial discrepancy as a suspense transaction. That intermediate message must be distinguished from the final reconciliation quantity. Use the configured transaction type and interface behavior to explain which stage is being reported rather than treating every history entry as a final stock balance.

**Limits:** Eligibility does not establish timing, successful delivery, retry behavior or automatic host reconciliation. The intermediate count-upload behavior is a documented integration pattern, not a universal requirement.

*Sources: R06, R07; entry `inventory_host_messages`.*

<a id="outbound-orders-and-waves"></a>
## Outbound orders and waves

A shipment expresses demand. A wave selects shipments and runs a configured sequence that can allocate inventory, create containers and work, and produce paperwork. Implementation examples supply reference patterns rather than universal settings or a prescribed warehouse procedure.

<a id="shipment-structure"></a>
### Shipment structure and entry

A shipment combines order information with item-level demand.

The documented structure contains a warehouse-specific header, one or more details, and optional comments associated with the header or a detail. Header examples include addresses, carrier and scheduled ship date; details identify items and ordered quantities. Comments carry additional handling information.

Manual creation and host downloads are alternative entry patterns in the references. An implementation can use different paths for different accounts. Determine the required fields and responsibility for creating them through the selected interface and operating procedure.

**Limits:** The references do not establish a complete message schema, mandatory transport or universal entry default.

*Sources: R06; entry `shipment_structure`.*

<a id="shipment-validation-recovery"></a>
### Shipment validation and reprocessing

An unsuccessful import needs correction before it becomes usable demand.

The reference flow logs failed validation for review in Interface Error Insight. After correction, a shipment can be processed at a subsequent scheduled download or through a manually invoked interface. Successfully imported shipments become visible in the Planned Shipment pool.

Diagnosis, correction and reprocessing are separate steps: appearing in an error view does not mean a shipment has reached the pool, and invoking an interface does not establish successful validation. The referenced discussion leaves responsibility for making corrections unspecified.

**Limits:** Retry timing, permissions and correction ownership remain implementation decisions; automatic recovery and guaranteed delivery are not established.

*Sources: R06; entry `shipment_validation_recovery`.*

<a id="planned-shipment-selection"></a>
### Selecting shipments from the planned pool

Planned Shipment filters select shipments using header or detail conditions.

A filter can combine carrier, order type or other shipment attributes. Where a shipment-line condition is used, one matching line can include the entire shipment in the view. Every line need not match; the result is not a new shipment containing only matching lines.

The documented manual process selects shipments, adds them to an existing open wave or creates a new wave, and chooses a wave master. A new wave receives an identifier and groups the selected shipments for subsequent processing.

**Limits:** Manual shipment-consolidation practices differ within the references and are not inferred from filtering or wave membership.

*Sources: R06, R05, R02; entry `planned_shipment_selection`.*

<a id="shipment-progress"></a>
### Shipment progress and pool states

Leading and trailing status summarize different ends of container progress.

Trailing status is the least advanced associated status; leading status is the most advanced. Reviewing both helps identify a shipment whose containers are at different stages. A header summary therefore cannot prove that every container has completed the most advanced stage.

The reference model distinguishes In Pool Pending, which prevents wave selection during incomplete interface processing, from In Pool, where a shipment exists but has not been processed in a wave and has no work available against it.

**Limits:** These documentary meanings do not establish every configured intermediate status or a universal numeric status contract.

*Sources: R06, R07; entry `shipment_progress`.*

<a id="wave-components-and-capacity"></a>
### Wave components and capacity

A wave master connects a processing flow with its supporting configuration.

The master identifies the wave flow, eligible replenishment masters and paperwork master. The flow supplies ordered steps such as allocation, container creation and work creation. Replenishment associations determine eligible demand evaluations; paperwork associations identify output documents.

Wave maximums can limit shipment lines, shipments, quantity, weight or volume. The walkthrough describes stopping admission at a limit and creating another wave for remaining demand. These controls size processing batches, while later load building groups shipments using carrier, date and route.

**Limits:** Example sequences, thresholds, execution modes and custom overrides are not mandatory defaults; wave size does not establish vehicle capacity.

*Sources: R06, R05, R07, R02; entry `wave_components_and_capacity`.*

<a id="wave-review-release"></a>
### Reviewing results and releasing work

Running a wave and releasing its work are distinct checkpoints.

The reference process reviews results through Transaction History Insight and Work Insight before choosing the next action. Release removes the Wave Not Released hold from generated work so it becomes eligible for picking. Applicable wave documents and labels may also print.

Hold codes can independently stop processing and can be added or removed through Work Insight. Generated work is therefore not necessarily immediately executable: review its hold state alongside wave results and the worker’s profile eligibility.

**Limits:** Release does not prove that later picking, packing, label printing or interface transfer has completed.

*Sources: R01, R05, R07; entry `wave_review_release`.*

<a id="cancellation-boundaries"></a>
### Wave and shipment cancellation

Cancellation reverses selected system preparation but does not physically return goods.

The documented wave-cancel path backs out allocations and removes work instructions and shipping containers, allowing shipments to return to the pool or another wave. Its review qualification excludes cancellation after release and deletion of work already in process.

Shipment cancellation is separate. It can remove shipping work and containers and deallocate demand, while picked goods require a distinct transfer back to inventory. Replenishment work is not automatically canceled with shipping work. Host-change eligibility differs from warehouse-user cancellation.

**Limits:** Active-picking cancellation is disputed in one source. Verify the installed version, authority and current state before relying on a cancellation rule.

*Sources: R06, R07; entry `cancellation_boundaries`.*

<a id="allocation-and-container-planning"></a>
## Allocation and container planning

Allocation selects eligible inventory for demand. Container and pallet planning organize allocated quantities for handling. Selection criteria, planning constraints and implementation choices remain distinct; the reference does not prescribe a universal allocation strategy or packing policy.

<a id="allocation-rule-assignment"></a>
### Assigning an allocation rule

The shipment detail identifies the rule used for its allocation demand.

A rule can default from the Item Master, arrive through the interface or be assigned during a wave before allocation. The reference uses *Default when no rule is present on the detail. Assignment records are considered in priority order and apply linked criteria to eligible details.

Always Override matters when a previous assignment sequence has already placed a rule on a line: the cited description requires it before a later sequence replaces that assignment. Assignment priority is distinct from the sequences inside the allocation rule.

**Limits:** The source does not establish a complete precedence hierarchy among every manual, item, interface and wave update.

*Sources: R07; entry `allocation_rule_assignment`.*

<a id="allocation-sequence-strategy"></a>
### Allocation selection, strategy and sequence

An allocation rule combines inventory eligibility with an allocation strategy.

Location Selection supplies criteria over location or location-inventory information. The strategy is the predefined algorithm used to choose among eligible inventory for a storage-management objective. Each rule detail combines these elements, with units of measure also contributing to eligibility.

Processing begins with the first sequence. If it does not allocate the complete requirement, later sequences attempt the remaining quantity. A later sequence handles the unallocated remainder rather than automatically replacing everything previously selected.

**Limits:** Strategy names do not supply complete algorithms or tie-breakers; illustrative rules and locations are not universal selections.

*Sources: R07; entry `allocation_sequence_strategy`.*

<a id="allocation-completeness"></a>
### Complete allocation and inventory exclusions

Shipment completeness and stock eligibility are separate allocation controls.

With Allocate Complete enabled on the shipment header, the references describe withholding allocation unless the whole shipment can be allocated. The examples apply this selectively, so it remains an explicit order-policy choice.

Location selections can separately exclude stock from ordinary demand. One reference pattern keeps damaged goods outside regular selections and exposes them through a special shipping selection. Another described shortage path returns an unallocated portion to the pool on a backorder. Its rejection scope and status should be retained as configuration choices.

**Limits:** Do not assume every order requires complete allocation or every shortage uses the same rejection policy.

*Sources: R06, R05, R07; entry `allocation_completeness`.*

<a id="container-creation"></a>
### Planning shipping containers

Container creation determines container identities and proposed contents for wave shipments.

The documented process first handles allocated units configured as shippable units as full containers. It groups remaining loose items by packing class and the associated container group. Weight, volume and critical dimensions contribute to selecting container types and distributing quantities.

The cited description treats an item without a unit-of-measure record as having zero dimensions and weight. Missing master data can therefore undermine a calculated packing plan. Container assignments still need reconciliation with physical goods during execution.

**Limits:** Shippable-unit flags, packing classes and container sizes are configuration choices; no specialized three-dimensional extension or physical-fit guarantee is implied.

*Sources: R07; entry `container_creation`.*

<a id="pallet-and-load-planning"></a>
### Optional pallet building and shipping loads

Pallet building and load building solve different grouping problems.

Pallet building combines requirements, a strategy and a container type supplying dimensional and weight constraints. Requirements can select and order containers or break to a new pallet when a grouping attribute changes. Which cases or existing pallets participate is configurable.

Load building instead groups shipments by carrier, scheduled ship date and route. The referenced step ignores shipments without carriers and can create a matching load when none exists. One sentence ambiguously describes a stop-additional-shipments flag, so it cannot define that flag’s acceptance rule.

**Limits:** These optional patterns do not establish physical stability, truck cubing, a selected strategy or departure readiness.

*Sources: R05; entry `pallet_and_load_planning`.*

<a id="work-creation-and-management"></a>
## Work creation and management

Work configuration connects process requests to executable units, eligible profiles and assignment rules. Eligible work forms an operational queue distinct from the planned-shipment pool. Work generation, selection, monitoring and confirmation remain separate, so a created unit is not mistaken for completed movement.

<a id="creation-master-selection"></a>
### Selecting work-creation masters

Work creation selects masters for the requesting process.

The system checks the process against applicable creation masters and considers eligible masters by ascending priority number. Each request is compared with the criteria associated with the selected master. A match reserves the request for that master; later masters do not reconsider it.

Declined requests remain available for the next master. Priority therefore routes requests, rather than merely ordering a display. The documented Creation Method distinguishes participating Pre-Build masters from Inactive masters excluded from creation. Process selection also constrains the available criteria choices.

**Limits:** Numeric priority bounds and installed process-specific masters are not established; lower-number-first is the documented ordering.

*Sources: R01; entry `creation_master_selection`.*

<a id="work-identity-order"></a>
### Work-unit identity and instruction ordering

Work criteria order selected requests before grouping them into units.

Order By attributes apply in sequence, with later attributes sorting within earlier groups. Each request becomes a detail with an internal instruction number. Work-unit breaks group instructions for assignment, and an applicable estimated-work-rate record can supply an instruction-time estimate.

The Work Unit Field selects the identifying value used for units generated by the master, with a configured system value supplying its default. Order-level and location-level grouping are examples rather than mandatory boundaries for every outbound process.

**Limits:** An estimate is not measured runtime. The displayed work-unit identity and an internal detail instruction number serve different purposes.

*Sources: R01; entry `work_identity_order`.*

<a id="work-maximums"></a>
### Bounding work-unit size

Work maximums constrain quantity, weight, volume or instruction count.

During construction, reaching an applicable limit closes the unit and starts another for remaining work. When several maxima apply, reaching any one can end the unit. A detail is not split solely because that detail alone exceeds a maximum.

The supplied reference treats zero as no maximum for general fields but gives Maximum Instructions a special zero behavior: up to 500 instructions before additional units are created. Cycle-count work has a narrower applicable maximum set than the documented outbound work categories.

**Limits:** The zero/500 behavior is release-unestablished reference behavior, not a recommended capacity or independently verified installed limit.

*Sources: R01; entry `work_maximums`.*

<a id="work-types-profiles"></a>
### Work groups, types and profile sequences

Work groups classify activities; work types identify specific processing categories.

A group can contain several types. A creation master assigns the type linking generated work with eligible profiles. The profile describes how work is initiated and completed through ordered sequence records, including participating work types and assignment methods.

When a sequence has no more work, processing proceeds to the next sequence. This separates work generation from how an authorized worker obtains and performs it. A new work type alone does not supply matching criteria, creation masters, zones or profile participation.

**Limits:** Examples of work groups and types are illustrative; no exhaustive required taxonomy or deployed profile hierarchy is established.

*Sources: R01, R02; entry `work_types_profiles`.*

<a id="work-eligibility"></a>
### Authorized work and the eligible queue

A work profile limits which existing work can be offered to a user.

Profiles identify authorized users, warehouses and work zones; work teams and equipment associations can also participate. The RF flow requires the instruction’s work type to match a profile detail and its work zone to accept that detail’s equipment type.

The default profile is used when present. Otherwise the described sign-on flow offers user- and warehouse-authorized profiles. An open unit need not pass those eligibility tests. With no matching detail, the documented response directs the worker to obtain work from a supervisor.

**Limits:** This describes eligible work, not a separate universal work-pool configuration object or a complete permission-precedence model.

*Sources: R01; entry `work_eligibility`.*

<a id="assignment-priority"></a>
### Assignment ordering and optional escalation

From Assignment controls system-directed pick ordering.

Documented choices are Priority/Location/FIFO, Location/Priority/FIFO and FIFO. Priority-led selection uses lower numbers first; later components break ties. Location proximity in the supplied reference is ascending numeric location order, not a complete model of physical adjacency. To Assignment separately orders putaway using methods such as LIFO or location.

Work Priority Escalation Criteria can identify work whose priority changes over time, combined with a scheduled-job interval. This optional policy changes current urgency rather than replacing the selected sort method.

**Limits:** Manual full-screen assignment does not inherit the documented RF priority sort. No active escalation interval or physical shortest-route guarantee is established.

*Sources: R06, R01, R07; entry `assignment_priority`.*

<a id="work-monitoring"></a>
### Monitoring work state and detail

Work Insight supports review of open, in-progress and closed work.

The reference views expose source and destination locations, item quantities, the related receipt or shipment, and the assigned worker. Reviewing outstanding work by type and state can support decisions about where additional workers are needed.

Use these views with eligibility and hold information. An open work unit may still be held or unavailable to a particular profile. A closed unit describes completion of that unit rather than automatic completion of every subsequent packing, loading or interface stage. These distinctions prevent queue visibility from being confused with execution readiness.

**Limits:** The source identifies screen concepts, not deployed counts, a staffing formula or an exhaustive status-transition contract.

*Sources: R01, R05, R07; entry `work_monitoring`.*

<a id="work-print-triggers"></a>
### Work documents and execution-start labels

Printing can occur at more than one work-processing point.

Auto Print can print an outbound pick list as soon as a unit is created. The reference warns that including the same pick-list document type in a paperwork master can print another set later in that wave. The interaction should be considered when choosing output timing.

Print at WM Work Start is a different option for shipping-container labels at mobile initiation. It requires work created from shipping containers and the corresponding Start WM Work print procedure on the document type.

**Limits:** These triggers have different outputs and prerequisites. Configuring either does not prove printer delivery or successful physical printing.

*Sources: R01; entry `work_print_triggers`.*

<a id="picking-execution"></a>
## Picking execution

Picking combines eligible work, an initiation method, configured verification and quantity confirmation. Paper group picking, RF group work, cart building and zone-based Picking Management have different execution and confirmation paths. Their controls should remain distinct when choosing an operational design.

<a id="work-initiation"></a>
### Starting user-directed or system-directed work

The initiation method determines who selects the work unit.

In the user-directed path, the worker chooses and scans a unit barcode, commonly from a pick list. In the system-directed path, a scanned nearby location provides the selection starting point. Some eligible locations expose a further choice screen subject to the same validity checks, including that the unit is not closed or active.

After initiation, profile settings govern assignment ordering. The flow expressly says that work summaries, rather than individual instructions, are assigned to the user within a unit.

**Limits:** Selection remains subject to profile eligibility. Nearest-location wording does not establish a physical-distance optimization algorithm.

*Sources: R01; entry `work_initiation`.*

<a id="special-handling-verification"></a>
### Verification and special handling

Special handling adds validation or restrictions to selected mobile work.

Documented settings can require item, quantity, license plate, lot or location confirmation. Location verification may use its identifier or check digit. The flow also describes requirements scoped by item/company, account/company, or user profile, zone and work type.

These controls tailor execution without changing underlying demand. Their effects are explicitly limited to Warehouse Mobile or RF in the supplied reference. A similarly named action in Work Insight does not establish that the same mobile validations will occur. Container verification has its own modes and constraints.

**Limits:** No complete precedence between overlapping handling scopes is supplied, and no verification option is universally enabled.

*Sources: R01; entry `special_handling_verification`.*

<a id="container-verification-split"></a>
### Container verification and split picks

Container confirmation identifies where picked quantity is placed.

Modes include displaying a container without additional verification, verifying its identifier, verifying its cart spot for group-user picking, or permitting an alternative identifier subject to validation. Even the no-additional-verification mode requires the next container scan after a partial pick in the cited description.

Allow Splitting of Container is separate. Moving part of a pick into another container creates a new work unit and container for that quantity. This can accommodate a planned container that fills before picking finishes.

**Limits:** Spot verification is restricted to the documented group-user mode. Split permission and alternative-identifier validation remain configuration-dependent.

*Sources: R01; entry `container_verification_split`.*

<a id="cart-building"></a>
### Building and assigning picking carts

Carts associate containers with physical spots before execution.

User-built carts scan containers and use user-supplied or system-assigned spots, followed by Begin Picking. System-built carts instead analyze eligible work, assign a container to each spot and display identity/type information for physical assembly. Priority, zone-sequence limits and work age contribute to selection; absent minimum/maximum zone values exclude work.

Back leaves a newly built cart built. Container removal is a distinct action requiring open, grouped, unassigned work and clears group and spot values. Removing all containers requires its own confirmation.

**Limits:** Tote-cart availability conflicts within the source and needs release-specific verification. The configured zone sequence is not a physical-route guarantee.

*Sources: R01; entry `cart_building`.*

<a id="group-picking"></a>
### Paper groups and RF group picking

A picking group represents a handling aid with capacity and location eligibility.

Wave group configuration limits loose and full containers and associates allocation locations or zones through ordered detail records. The wave can assign previously created containers to groups. Detail sequence numbers must be unique, with lower numbers processed first.

Paper group picking uses a Group Picking Pick List outside work execution in the source. RF group picking uses work and can distribute a consolidated pick among containers or totes. The cited cart grouping excludes serial-number-tracked and catch-weight-tracked items; partial or short picks ungroup batched instructions.

**Limits:** Paper and RF groups do not share one interchangeable confirmation path or unrestricted tracking model.

*Sources: R01; entry `group_picking`.*

<a id="zone-picking-management"></a>
### Zone-based Picking Management

Picking Management allows multiple users to execute different zones of a unit.

Associated work type and zone must both have Pick Management Active selected. After sign-on and zone selection, the list can include open, held and assigned units. The documented procedure chooses a unit with Zones Away equal to zero as ready for that zone.

A unit is assigned before starting, with details and pick-list printing available. An open unit can be unassigned; a held unit cannot. Holding during completion leaves current instructions unconfirmed and prevents further action until release through Work Insight.

**Limits:** Visibility does not establish executability. The reference does not supply a complete Zones Away calculation or database mapping.

*Sources: R01; entry `zone_picking_management`.*

<a id="pick-exceptions"></a>
### Partial, short, skipped and passed picks

Picking exceptions represent different quantities and execution outcomes.

Partial Pick confirms part of an instruction. Short Pick requests a reason; the RF flow describes rejecting the shortage and reducing the location’s On Hand quantity. Skip moves on without completing the current quantity. Pass stops the current execution instance, with its warning controlled by configuration.

Partial or short picks ungroup batched cart instructions. Close After Partial Pick and Over Picking have narrower documented availability: configured RF replenishment or work-order picks. Overpicking remains limited by available location quantity; tote/container partial picking returns to the remainder.

**Limits:** A partial pick is not automatically a shortage or discarded demand. These restricted options are not blanket outbound overpick permission.

*Sources: R01; entry `pick_exceptions`.*

<a id="quantity-and-putaway"></a>
### Quantity presentation and putaway completion

Quantity presentation and putaway confirmation are independently configured.

Use Converted Quantity presents a non-base unit when demand is a multiple of its conversion; otherwise the base unit is used. Decimal converted quantities are prohibited for partial or short picks in this source. Allow Pick In Transit separately permits using incoming quantity and can expose negative inventory.

Direct shipping-container picks can perform packing during pick confirmation, adding same-shipment items until close. Putaway may still require a destination and container identifier. Automatic Putaway bypasses manual confirmation, but its settings section excludes dock work and disables Consolidation After Putaway.

**Limits:** Later broader wording uses another option name and does not remove that restriction. Physical movement is not proved by automatic confirmation.

*Sources: R01; entry `quantity_and_putaway`.*

<a id="paper-confirmation"></a>
### Paper picking and recorded confirmation

Non-RF work separates the physical activity from recording its result.

The reference prints lists at work-unit level and distributes them to workers, who move product between listed locations and retain required confirmations such as check digits and optional activity times. An administrator later records the result in Work Insight.

Recorded information includes the worker, quantity, exception reasons and times when captured. The user and warehouse need a supporting work profile for the instruction’s type and zones. Confirmed outbound work advances toward Ready for Packing or an intervening configured status.

**Limits:** Later-entered timestamps are not automatic real-time observation. Detailed paper procedures remain an operational choice, and mobile handling constraints do not automatically apply.

*Sources: R01; entry `paper_confirmation`.*

<a id="packing-loading-shipping"></a>
## Packing, loading and shipping

Outbound completion separates packing, staging, loading and confirmation of departure. Preferences and status flows connect the actions, while interfaces communicate selected results. The descriptions do not prescribe one carrier integration, dock layout or final-readiness status for every installation.

<a id="packing-content-changes"></a>
### Packing preferences and content changes

Packing preferences tailor packing and closing for users or groups.

The walkthrough identifies a Close Container preference for fixed-station and RF operations. Shipping Container Insight separately supports changing container types or contents and creating replacement containers.

The described unpacking method sets the quantity to pack to zero for affected items, followed by repacking through the Packing screen. Editing contents requires the container to occupy a location whose subclass is Packing. Physical presence at a packing station alone does not establish that system-location precondition. Review the container’s recorded location before treating content editing as available.

**Limits:** The sources do not establish every effective preference, override hierarchy or permission; the location guard belongs to the cited workflow.

*Sources: R07, R02; entry `packing_content_changes`.*

<a id="outbound-quality"></a>
### Recorded outbound quality checks

A recorded quality check differs from informal visual inspection.

The documented QC path scans the container and its items, compares quantities and items with expectations, and records success or failure. Failures use configurable reasons, with correction and successful QC preceding container close in the described normal flow.

One reference also uses Force QC Pass during visual inspection. That local practice does not demonstrate equivalent verification and is not a recommendation for routine processing. Selection criteria determine participating containers; additional barcode parsing and specialized inspection contracts remain outside this general mechanism.

**Limits:** No universal sampling rate, segregation-of-duties requirement or entitlement to bypass failed QC is established.

*Sources: R05; entry `outbound_quality`.*

<a id="container-close-labels"></a>
### Container closing and label outputs

Closing identifies a packed container and advances its configured status flow.

The cited close action prevents further item additions. Fixed-station and mobile paths identify the container before closing; neither action is equivalent to confirming departure of the load. Parcel manifesting occurs alongside closing in the references, but international and last-container arrangements differ.

Container-contents labels describe packed contents, quantities and shipment information; training describes wave-generation and manual post-packing printing. Shipping labels identify cartons for carrier handling and include ship-from and ship-to details. Company association supplies ship-from values in the cited training behavior.

**Limits:** No universal manifest-before-close sequence, carrier integration, weighing connection, template compliance or successful physical print is established.

*Sources: R03, R05, R02; entry `container_close_labels`.*

<a id="staging-dock-assignment"></a>
### Staging and dock destinations

Staging holds packed containers for transport; dock assignment selects a destination.

The reference can route product to packing or manifest stations, staging lanes or dock doors. Dock-flow details associate status conditions with selection strategies; carrier assignment and anchor criteria contribute. Header and detail fallback locations cover cases where eligible dock positions cannot be found.

Staging can include optional consolidation onto parent pallets. A later-wave shipment joining an already staged load may receive another default staging lane in the cited example. Aligning those locations requires an explicit procedure rather than assuming shared load membership guarantees physical co-location.

**Limits:** Destination, consolidation and fallback rules are optional configuration patterns, not a prescribed layout or automatic cross-wave reconciliation.

*Sources: R06, R05; entry `staging_dock_assignment`.*

<a id="loading-confirmation"></a>
### Loading and confirming departure

Loading records movement onto transport; load confirmation records departure from warehouse stock.

The references distinguish moving containers or parent pallets through a dock door from Confirm Load. In the documented completion model, confirmation closes load, shipment, detail and container statuses and relieves shipping-dock inventory. A load can represent several kinds of transport.

Review all related progress against the configured flow before confirmation. Sources disagree over Ship Confirm Pending versus Load Confirm Pending as readiness wording. Those labels cannot safely become one universal precondition merely because the final Closed outcome is consistently described.

**Limits:** Custom loading counters and host-specific no-split policies are excluded from base capabilities; exact readiness remains version- and configuration-dependent.

*Sources: R06, R05, R07; entry `loading_confirmation`.*

<a id="shipment-results-upload"></a>
### Shipment results and upload eligibility

Shipping interfaces communicate selected results when configured conditions are met.

Referenced uploads can contain shipment header, detail, comments and containers, plus inventory attributes and serial numbers where present. Shipping upload criteria select eligible shipment or detail records and trailing statuses for output.

The cited criteria respond to a status change. Initial download does not itself trigger their upload, even when its initial status is listed for output. Load confirmation is a documented completion point associated with file generation, but configured statuses and the interface process define the applicable path.

**Limits:** Generating a file does not prove another system received, validated or applied it. No transport, schedule or directory is prescribed.

*Sources: R06, R07; entry `shipment_results_upload`.*

<a id="interfaces"></a>
## Interfaces and data exchange

Interfaces connect warehouse records with external systems. Direction, record selection, mapping, processing and external receipt are separate parts of that exchange.

<a id="interface-direction"></a>
### Downloads and uploads

A download brings information into SCALE; an upload makes information generated by SCALE available externally.

These terms describe the direction of a business exchange from the warehouse application’s perspective. Incoming information can create or update the records required for warehouse activity. Outgoing information communicates the resulting business events or selected inventory information.

The retained designs illustrate API and XML exchanges with manual or scheduled execution. These are integration patterns to assess, not one mandatory transport architecture. Identify the participating system, business record and direction before deciding which process configuration is relevant.

**Limits:** Generation or availability of an upload does not prove that an external system received or accepted it. The reference does not establish a live endpoint, schedule or retry contract.

*Sources: R06, R05; entry `interface_direction`.*

<a id="interface-mapping"></a>
### Data mapping and field interpretation

Delimited and fixed-format interfaces use mappings to connect positions in exchanged data to application fields.

A mapping identifies the relevant functional area and process detail, then associates the exchanged fields with the expected application data. Fixed-format mappings also require field lengths. Interpreting a value therefore depends on its mapped field, position and format rather than its appearance alone.

The configuration walkthrough distinguishes these mappings from XML processing, which does not require the particular mapping mechanism described for delimited and fixed-format records. Choose the mapping method for the interface format instead of applying one format’s requirements to every exchange.

**Limits:** The cited material does not supply a complete schema, validation contract or universal transformation rule for every interface.

*Sources: R02; entry `interface_mapping`.*

<a id="interface-process-control"></a>
### Process details and execution controls

Process-list details describe how configured interface work is selected and executed.

The walkthrough exposes processing mode, sequence and inactive controls in the process-list configuration. These settings belong to a process definition and must be read with the relevant download or upload. An inactive configuration record and a successful execution are different states.

Implementation references describe manual and scheduled execution as possible operating arrangements. Timing and failure notifications require their own design and validation. A pictured process record illustrates configuration fields; it is not evidence that a service is running or that a particular schedule is active.

**Limits:** No example frequency, directory, hostname or notification recipient is prescribed here. Actual execution and retry behavior require operational evidence.

*Sources: R05, R02; entry `interface_process_control`.*

<a id="upload-selection"></a>
### Upload selection and output

Upload criteria select the business information to be made available to another system.

The configuration explanation includes criteria for receiving, shipping, item balances and inventory transactions. The selected records are associated with the applicable process detail and upload output location. Selection rules control which information participates in a defined exchange.

Review the business event and selection criteria together. A generated record can satisfy the warehouse side of an interface step while downstream transfer, acknowledgement or reconciliation remains incomplete. Keep those outcomes distinct when investigating a missing external update.

**Limits:** The retained source establishes configuration relationships, not successful external delivery or an exactly-once processing guarantee.

*Sources: R05, R02; entry `upload_selection`.*

<a id="interface-errors"></a>
### Reviewing failed shipment imports

The referenced shipment-import flow retains failed records for correction and reprocessing.

Interface Error Insight is identified as the place to examine an errored shipment import. After an appropriate correction, the reference describes reprocessing through a scheduled run or manual initiation. A successfully processed shipment then enters the planned-shipment flow.

Treat the error record as evidence about a particular failure. Correcting data, changing configuration and changing an interface are different interventions; the source does not establish that all failures have the same cause or remedy. Review the actual error and the responsible process before choosing a correction.

**Limits:** A source comment leaves correction responsibility unsettled. This reference assigns no operator role, permission or automatic-recovery guarantee.

*Sources: R06; entry `interface_errors`.*

<a id="documents-labels"></a>
## Documents and labels

Document and label output combines a business purpose, a template, generation rules and routing. Each part must be supported by the applicable release and print arrangement.

<a id="label-prerequisites"></a>
### Label-generation prerequisites

A label depends on its definition, generation setup, document association and output route.

The label training identifies a label file, document type, document definition and routing as parts of the setup. Some labels also use a stored procedure, and wave-driven output may require the Documents and Labels wave step. The elements must be connected for the intended business event.

Printer capability must be checked against the chosen label definition and the actual device. A printer resolution stated in the retained training describes that training requirement; it does not certify a currently installed printer or make every label format compatible. Separate template generation, routing and physical output when diagnosing a failure.

**Limits:** The mixed-release training does not establish installed hardware support, present configuration or a complete setup sequence for every label.

*Sources: R03; entry `label_prerequisites`.*

<a id="document-types-templates"></a>
### Document types and templates

A document type groups an output purpose; a document definition connects that purpose with its template and generating application.

The configuration sources distinguish paper documents from labels and associate documents with a document type. A document definition identifies a template and its generating application, with criteria used where applicable. The renderer must match the template format.

This relationship explains why choosing a document type alone is insufficient to produce output. The selected definition must provide the content and generation mechanism expected by that type. The reference describes the relationship without adopting sample application addresses or storage locations.

**Limits:** Example templates and renderer choices are illustrative. They do not establish a required server topology or universal output format.

*Sources: R03, R02; entry `document_types_templates`.*

<a id="output-routing"></a>
### Routing, destinations and copies

Routing selects the document, copy count and destination using configured matching criteria.

The retained examples include warehouse, company, ship-to, carrier, container class and client machine as routing criteria. Routing associates matching output with a document and a printer or destination. A printer must exist in the relevant setup before it can be selected.

Read selection criteria separately from the resulting destination and copies. Different business outputs can require different routes even when they share a document type. For troubleshooting, verify which configured record matches the actual output context before interpreting the destination.

**Limits:** The sources do not establish blank-field wildcard behavior, rule precedence or a universal copy count.

*Sources: R03, R02; entry `output_routing`.*

<a id="container-label-purposes"></a>
### Container, shipping and receipt labels

Labels serve different identification and handling purposes across receiving and shipping.

A contents label can identify the container’s items, quantities, location and basic shipment information. The training describes automatic generation during container creation in a wave or manual generation after packing. Shipping labels identify carrier and shipment addressing information, while compliant-label requirements depend on the relevant trading arrangement.

Receipt-container labels support identification on inbound activity. The training gives different triggers for receipt contexts; it does not define one trigger for every receiving flow. Select a label according to the business purpose and the configured event rather than treating all container labels as interchangeable.

**Limits:** Listed generation points are reference behavior. They do not prove that a physical label printed, that every output is enabled or that a particular size is required.

*Sources: R03; entry `container_label_purposes`.*

<a id="wave-document-label-selection"></a>
### Wave documents and label selection

Wave output uses document and label selection rules tied to the intended records and execution steps.

The walkthrough describes non-label wave paperwork selected using records such as a shipment, container or work instruction, with the document type and document definition connected to the running wave configuration. Label-master and label-selection criteria provide a related but separate selection mechanism.

Break labels can mark boundaries between configured wave groups. The training illustrates grouping and ordering choices without prescribing one group count or sequence for every operation. Keep record selection, label selection and output ordering distinct when explaining how a wave’s paperwork is assembled.

**Limits:** A combined-label reference does not supply every prerequisite or field setting. Exact predicates and example counts are not universal defaults.

*Sources: R03, R02; entry `wave_document_label_selection`.*

<a id="label-diagnostics"></a>
### Label diagnostic evidence

The training distinguishes generation information from generated label-language output.

Its diagnostic examples identify information about document type, printer, copy count and errors, together with a separate generated ZPL output. These two forms of evidence answer different questions: what the generation request selected, and what label-language content it produced.

Inspect the diagnostic evidence appropriate to the deployed release and print arrangement. A generated output can help isolate a template or generation issue, but it does not prove that the destination accepted the job or that a device produced a readable label.

**Limits:** The source illustrates dated diagnostic artifacts. Their sample paths are not current operational instructions, and no printing was executed for this reference.

*Sources: R03; entry `label_diagnostics`.*

<a id="administration-insight"></a>
## Administration and Insight configuration

User access, process permissions and screen customization are related administration areas. Configuration descriptions do not establish anyone’s current entitlements.

<a id="user-process-context"></a>
### User and warehouse process context

User configuration connects an identity with warehouse context and process preferences.

The configuration walkthrough uses the user identity for work and productivity tracking and describes a default warehouse association. It also distinguishes company and warehouse access, work profiles, process preferences and authorized adjustment types.

These associations help explain why two users may encounter different process choices or permitted actions. A default warehouse and authorization to act in a warehouse are separate concepts. Review the applicable user associations and permission configuration together before interpreting available functionality.

**Limits:** The examples do not establish default access, current roles, inherited permission precedence or actual user entitlements.

*Sources: R02; entry `user_process_context`.*

<a id="security-permissions"></a>
### Permissions for windows and actions

Security permissions associate users or groups with application access and processing actions.

The implementation references identify permission checkpoints for windows, processing configuration and actions, and describe assigning permissions in groups or through mass-assignment functions. Access to a screen does not, by itself, explain every action available within it.

Use the distinction between viewing a window and executing a process to frame an access investigation. The reference supplies a functional permission model while leaving the actual user and group assignments to the installed environment’s configuration.

**Limits:** The retained sources do not resolve conflict precedence, deny behavior or the effective permissions of a particular user.

*Sources: R06, R05; entry `security_permissions`.*

<a id="insight-custom-forms"></a>
### Custom Insight forms and activation

Insight Architect can create a custom form from a base Insight and manage which form is active.

The retained guide describes creating a custom form with a new form identifier. It records the custom form as active and the base form as inactive, and provides an IsCustomized filter to find custom forms. Existing customized forms can be selected and edited.

Activation and deletion affect the relationship with the base form. The guide describes reactivating the base when the custom form is deactivated or its configuration is deleted. These are configuration lifecycle effects; deleting a customization requires understanding the change being removed.

**Limits:** This explanation describes the retained guide, not verified navigation, current customizations or approval to alter a live screen.

*Sources: R04; entry `insight_custom_forms`.*

<a id="insight-publish-scope"></a>
### Publishing Insight configuration

The retained guide describes publishing Insight configuration from Stage to Production for Manhattan Active SCALE.

Publishing moves a prepared screen configuration through the environment relationship described by that guide. It belongs to the lifecycle of a customization, after the configuration has been created and reviewed for its intended use.

Apply the product qualification to the publishing statement itself. A guide printed on a particular date is not a release declaration, and its environment labels do not prove that another installation exposes the same workflow or permissions.

**Limits:** This publishing statement is limited to Manhattan Active SCALE in the retained source. No deployment or live publishing operation was performed.

*Sources: R04; entry `insight_publish_scope`.*

<a id="labor-visibility"></a>
## Labor planning and activity visibility

Labor functions relate warehouse activity to recorded effort and planning groups. Recorded activity and estimated workload answer different operational questions.

<a id="labor-activity-capture"></a>
### Labor activity capture

A tracked action can create a labor request that a service processes into labor detail.

The referenced flow makes processed activity available through Labor Activity Insight and reporting. Manual entries can represent activities that are not captured through the described tracked-action path. A request, its processed detail and a report are separate stages of this flow.

Use these stages to distinguish missing capture from processing or presentation issues. The appearance of labor functionality in an implementation design does not prove that all tracking is enabled or that every warehouse activity generates a labor record.

**Limits:** The source establishes a functional flow, not current service health, queue timing, exhaustive activity coverage or measured productivity.

*Sources: R07; entry `labor_activity_capture`.*

<a id="labor-groups-plans"></a>
### Labor groups and wave planning

Labor plans organize estimated wave effort through related groups and their execution sequence.

A labor group brings together related duties and provides staffing and quantity-unit context. A labor plan orders the relevant groups; shipment criteria can determine which work participates in a group’s estimate. The referenced wave flow requires the labor-plan execution step to generate its planning result.

Interpret an estimate with its plan, group definitions and selected workload. A staffing category or quantity unit gives meaning to the estimate, but neither is a universal headcount recommendation. A report proposed in an implementation design is not automatically a delivered product report.

**Limits:** The reference does not establish staffing levels, target productivity, an active labor plan or an available custom report.

*Sources: R05, R07; entry `labor_groups_plans`.*

<a id="direct-indirect-labor"></a>
### Direct and indirect labor

The retained design distinguishes labor associated with tracked warehouse work from other recorded activity.

Direct and indirect categories provide a way to describe different kinds of effort. The reference discusses manual entry for indirect activities so that work outside the captured process can still be represented in the labor record.

Use the activity definition and capture method together when interpreting a labor total. A category describes the kind of effort being recorded; it does not establish that all such effort was entered or that a particular device supports every entry method.

**Limits:** A device limitation in one design is not generalized here as a product-wide absence. No labor totals or actual worker performance are inferred.

*Sources: R05; entry `direct_indirect_labor`.*

## Reference register

### R01 — Work and picking training

Work creation, assignment and picking explanations. Product release is not established by the retained document.

### R02 — Configuration walkthrough

A SCALE 2020 walkthrough describing configuration relationships. Document dates and revision labels do not identify an installed release.

### R03 — Label training

Label purposes, generation and routing. The training identifies SCALE 2021 and contains examples from more than one release; examples are qualified locally.

### R04 — Insight Architect guide

Screen configuration for Manhattan Active SCALE. The retained printed date is not a product-release declaration.

### R05 — Implementation guide A

A 2023 design, revision 1.4. Used for bounded functional mechanisms only; implementation choices and proposed extensions are not universal rules.

### R06 — Implementation guide B

A 2024 design with a revision-history/cover discrepancy. Its document revision does not establish an installed product release.

### R07 — Implementation guide C

A 2024 design, revision 1.5. Used to explain supported mechanisms while retaining conflicts and version qualifications.

## Coverage and use

The reference contains 86 entries in 14 chapters, synthesized from 181 selected reviewed records across seven SCALE sources. This is a bounded functional synthesis, not an exhaustive count of product features. Unselected records are not newly reviewed or claimed as duplicate; implementation-specific values, proposed extensions, unresolved detail and other out-of-scope material remain outside this reference.

This document and its printable PDF are two formats of the same reference. The source-binding register is provenance, not another design document.
