# Reviewed SDD configuration guidance

These records explain supplied documentation, not active settings. Each states its product/version scope. Proposed validation steps have not been executed. Defaults and precedence remain unknown where the source does not state them. MAWM examples are explicitly separate and cannot be transferred to SCALE.

89 records. See [review coverage](REVIEW_COVERAGE.md) and [logical tables](TABLE_REVIEW.md).

## Work Unit Field

Chooses the value identifying generated work units.

- Scope: Work creation master; supplied SCALE training version unestablished.
- Accepted values: Configured work identifier, for example ERP Order. Exhaustive list not supplied.
- Default: Work System Values supplies the default.
- Precedence and dependencies: Master selection controls generated work identity.
- Related process: Work creation
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00013](reading/sdd-61bfda888fe30365.md#b00013)

## Creation Method

Includes or excludes the master during work creation.

- Scope: Work creation master; supplied SCALE training version unestablished.
- Accepted values: Pre-Build; Inactive
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Pre-Build participates during the wave cycle; Inactive excludes the master.
- Related process: Wave/work creation
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00014](reading/sdd-61bfda888fe30365.md#b00014)

## Priority

Orders creation masters.

- Scope: Work creation master; supplied SCALE training version unestablished.
- Accepted values: Numeric priority; allowed bounds not stated.
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Lower numbers first; priority 1 precedes 2.
- Related process: Work creation
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00015](reading/sdd-61bfda888fe30365.md#b00015)

## Auto Print Documents

Prints after work creation.

- Scope: Work creation master; supplied SCALE training version unestablished.
- Accepted values: Selected/unselected
- Default: Not specified by the reviewed source.
- Precedence and dependencies: If paperwork also prints the pick-list document type, two sets may be generated in one wave.
- Related process: Wave/printing
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00016](reading/sdd-61bfda888fe30365.md#b00016)

## Work Type

Links generated work with eligible profiles.

- Scope: Work creation master; supplied SCALE training version unestablished.
- Accepted values: Configured work type
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Work type links the creation master and profile eligibility.
- Related process: Work creation/selection
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00020](reading/sdd-61bfda888fe30365.md#b00020)

## Process and criteria

Selects the work-creation process and qualifying requests.

- Scope: Work creation master; supplied SCALE training version unestablished.
- Accepted values: Process-specific criteria; list not supplied.
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Selecting a process restricts subsequent criteria choices to that process.
- Related process: Work creation
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00023, b00024, b00025, b00026, b00027](reading/sdd-61bfda888fe30365.md#b00023)

## Work maximums

Bounds quantity, weight, volume and instructions in a unit.

- Scope: Work creation master; supplied SCALE training version unestablished.
- Accepted values: Numeric limits; zero special case.
- Default: Zero indicates no maximum except Maximum Instructions zero still permits up to 500.
- Precedence and dependencies: A detail record is not split solely because it exceeds the maximum; only instruction maximum applies to cycle counts.
- Related process: Work creation
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00030, b00031, b00032, b00033, b00034](reading/sdd-61bfda888fe30365.md#b00030)

## Profile sequence

Orders the rules used to offer and execute work.

- Scope: Work profile sequence
- Accepted values: Ordered sequence numbers; bounds not stated.
- Default: Not specified by the reviewed source.
- Precedence and dependencies: After a sequence has no more work, proceed to the next sequence.
- Related process: Work selection
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00043, b00044, b00045, b00046, b00047, b00048, b00049](reading/sdd-61bfda888fe30365.md#b00043)

## Profile users warehouses and zones

Restricts who and where a profile supports work.

- Scope: Work profile
- Accepted values: Configured authorized users, warehouses and work zones.
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Profile assignment and authorization must be considered together; exhaustive permission precedence not established.
- Related process: Work eligibility
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00060, b00061, b00062, b00063, b00064, b00065, b00066, b00067, b00068, b00069, b00070](reading/sdd-61bfda888fe30365.md#b00060)

## Special handling verification

Requires item, quantity, LP, lot or location confirmation.

- Scope: User/work-type/work-zone special handling in Warehouse Mobile or RF
- Accepted values: Enabled verification dimensions; location ID or check digit.
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Source explicitly says these constraints do not apply in Work Insight.
- Related process: Work execution
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00080, b00081, b00082](reading/sdd-61bfda888fe30365.md#b00080); [sdd-61bfda888fe30365 b00090, b00091, b00092, b00093, b00094, b00095, b00096, b00097, b00098, b00099, b00100](reading/sdd-61bfda888fe30365.md#b00090)

## Receipt putaway LP verification

Determines whether an existing LP is displayed, verified or replaced.

- Scope: Receipt putaway special handling
- Accepted values: Existing LP no override; Verify Existing LP; Existing LP allow override; User Specified.
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Verify Existing LP rejects a different value; User Specified does not show the existing value.
- Related process: Receipt putaway
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00104, b00105, b00106, b00107, b00108, b00109](reading/sdd-61bfda888fe30365.md#b00104)

## Shipping container verification

Controls container confirmation during shipment work.

- Scope: Shipment work special handling
- Accepted values: None; Container Verify; Container Spot Verify; Allow Override.
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Spot Verify applies only to group user picking. None still requires the next container scan after a partial pick.
- Related process: Picking
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00111, b00112, b00113, b00114, b00115, b00116](reading/sdd-61bfda888fe30365.md#b00111)

## Allow Splitting Of Container

Allows some quantity to move into another container.

- Scope: Picking special handling
- Accepted values: Allowed/disallowed
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Split quantity receives a new work unit and container.
- Related process: Picking
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00122](reading/sdd-61bfda888fe30365.md#b00122)

## Allow Over Picking

Allows more than the instruction quantity within available stock.

- Scope: RF replenishment and work-order picking only
- Accepted values: Allowed/disallowed
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Source limits availability to these RF processes. The pick is treated as complete/normal.
- Related process: Picking
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00123](reading/sdd-61bfda888fe30365.md#b00123)

## Allow Pick In Transit

Permits picking against incoming inventory.

- Scope: Picking special handling
- Accepted values: Allowed/disallowed
- Default: Not specified by the reviewed source.
- Precedence and dependencies: May show negative inventory when picking against in-transit quantity.
- Related process: Picking/inventory
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00124](reading/sdd-61bfda888fe30365.md#b00124)

## Close After Partial Pick

Closes a partly picked instruction and removes its remaining work quantity.

- Scope: Picking special handling
- Accepted values: Selected/unselected
- Default: Not specified by the reviewed source.
- Precedence and dependencies: When selected the remainder will never be picked by that instruction.
- Related process: Picking
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00125](reading/sdd-61bfda888fe30365.md#b00125)

## Use Converted Quantity

Supports picking cases or pallets rather than base units.

- Scope: Picking special handling
- Accepted values: Selected/unselected
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Use converted quantity only for a multiple of that UOM; otherwise use base UOM. Decimal converted quantity for partial/short picks is prohibited in this source.
- Related process: Picking
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00128, b00129, b00130](reading/sdd-61bfda888fe30365.md#b00128)

## Cycle count level

Controls the information and unit presented for a count.

- Scope: Cycle-count work special handling
- Accepted values: Standard Count; Blind Count; Count License Plates.
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Blind Count shows only the location ID; no item guidance.
- Related process: Cycle counting
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00143, b00144, b00145, b00146](reading/sdd-61bfda888fe30365.md#b00143)

## Group Count By Item Company

Combines quantities for the same item/company at a location.

- Scope: Cycle-count special handling
- Accepted values: Enabled/disabled
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Mismatch, adding an item, or lot/LP verification ungroups the work and requires individual confirmation.
- Related process: Cycle counting
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00147, b00148, b00149, b00150](reading/sdd-61bfda888fe30365.md#b00147)

## Add LPs and pending review

Controls adding LPs while counting and supervisor review.

- Scope: User-initiated LP cycle count
- Accepted values: Add LP allowed/disallowed; Set New LPs To Pending Review.
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Positive tolerance determines automatic acceptance versus review; allowing added items bypasses the Add LP setting. Pending-review option is limited to user-initiated selection.
- Related process: Cycle counting
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00152, b00153, b00154, b00155, b00156, b00157, b00158, b00159, b00160](reading/sdd-61bfda888fe30365.md#b00152)

## From Assignment Method

Orders system-directed pick assignments.

- Scope: Work profile sequence
- Accepted values: Priority/Location/FIFO; Location/Priority/FIFO; FIFO.
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Priority means lower numeric value first. Location proximity is ascending numbering, not a verified physical distance model.
- Related process: Work selection
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00209, b00210, b00211, b00212, b00213, b00214, b00215, b00216, b00217, b00218, b00219, b00220](reading/sdd-61bfda888fe30365.md#b00209)

## To Assignment Method

Orders system-directed putaway instructions.

- Scope: Work profile sequence
- Accepted values: LIFO; Location.
- Default: Not specified by the reviewed source.
- Precedence and dependencies: LIFO puts away the last picked item first.
- Related process: Putaway
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00222, b00223, b00224, b00225, b00226](reading/sdd-61bfda888fe30365.md#b00222)

## Group picks by location LP

Combines same-item picks from the same location in a work unit.

- Scope: Warehouse Mobile work profile sequence
- Accepted values: Selected/unselected
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Cart Picking always attempts grouping regardless of this option.
- Related process: Picking
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00230](reading/sdd-61bfda888fe30365.md#b00230)

## Print at WM Work Start

Prints container labels at work execution start.

- Scope: Warehouse Mobile profile sequence
- Accepted values: Selected/unselected
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Requires shipping-container-created work and Start WM Work on the document type.
- Related process: Printing/work execution
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00231](reading/sdd-61bfda888fe30365.md#b00231)

## Automatic Putaway

Bypasses individual manual putaway confirmation.

- Scope: Work profile sequence
- Accepted values: Selected/unselected
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Not supported for dock management work; selected automatic putaway disables Consolidation After Putaway selection.
- Related process: Picking/putaway
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00235, b00236](reading/sdd-61bfda888fe30365.md#b00235)

## Nest After Putaway

Offers a parent container for nesting picked shipping containers.

- Scope: Warehouse Mobile group picking into final shipping container, single-shipment work unit
- Accepted values: Selected/unselected
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Not supported when performing Putaway Into Shipping Container.
- Related process: Putaway/nesting
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00237](reading/sdd-61bfda888fe30365.md#b00237)

## Use Cross Dock LP from Receiving

Reuses receipt LP as the new shipping-container ID.

- Scope: Work profile putaway
- Accepted values: Selected/unselected
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Requires Putaway Into Shipping Container; cannot apply if a container already exists from wave or WM picking.
- Related process: Cross docking
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00240](reading/sdd-61bfda888fe30365.md#b00240)

## Zone naming convention

Makes allocation, locating and work zones recognizable.

- Scope: HADDAD SCALE 2020 configuration example
- Accepted values: A-, L-, W- examples; explicitly not an official naming requirement.
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Physical location can have separate allocation, locating and work zones.
- Related process: Inventory/work eligibility
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `configuration_example`.

Sources: [sdd-f46806ef53e15f07 b00064, b00065, b00066, b00067, b00068, b00069, b00070, b00071, b00072, b00073, b00074, b00075, b00076, b00077, b00078](reading/sdd-f46806ef53e15f07.md#b00064)

## Document routing

Chooses print criteria, copies, destination, document and machine.

- Scope: SCALE 2021 label training
- Accepted values: Configured criteria such as ship-to, carrier and container class; allowed complete list not established.
- Default: Not specified by the reviewed source.
- Precedence and dependencies: Document definition precedes routing. Exact tie-break/override priority is not established.
- Related process: Printing
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-56008a31665dcc23 s006-sh004](reading/sdd-56008a31665dcc23.md#s006-sh004)

## Custom screen activation

Chooses whether the base or customized screen is active.

- Scope: Manhattan Active SCALE Insight Architect
- Accepted values: Activate/deactivate custom screen.
- Default: Creating a custom screen activates it and deactivates the base according to this source.
- Precedence and dependencies: Activating custom disables base; deleting custom configuration reactivates base. Publishing is specifically limited to Manhattan Active SCALE users.
- Related process: Presentation metadata
- Validation: Compare the cited source with an authorized version-matched configuration record and process contract. This task performs no configuration query or change.
- Classification: `vendor_behavior`.

Sources: [sdd-d4675a92502c23f4 p001-b008, p001-b009, p001-b012, p001-b013, p002-b004](reading/sdd-d4675a92502c23f4.md#p001-b008)

## Cart pass warning

Controls warning when passing cart work.

- Scope: SCALE Work/Picking compilation; exact release unspecified
- Accepted values: Source names Work System Value 50 and value Warn; full value domain is not stated.
- Default: Not established by the cited source.
- Precedence and dependencies: Work System Value 50 governs the warning described in Cart Picking Actions.
- Related process: Cart picking
- Validation: Proposed validation, not executed: In a version-matched test profile, compare Pass with the configured value and inspect whether container removal occurs.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00309, b00310](reading/sdd-61bfda888fe30365.md#b00309)

## System-built carts and cart spots

Assigns eligible shipping containers to cart spots at work initiation.

- Scope: SCALE Work/Picking compilation; exact release unspecified
- Accepted values: Cart Picking initiation; System-built carts selection; cart spot count. One container per spot.
- Default: Not established by the cited source.
- Precedence and dependencies: Work Profile Work Processing tab; Zone Cart Building sequence supplies walking-order information.
- Related process: Warehouse Mobile cart picking
- Validation: Proposed validation, not executed: Use a small synthetic cart, confirm spot capacity and one-container-per-spot assignment.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00349, b00353, b00354, b00355, b00356, b00357](reading/sdd-61bfda888fe30365.md#b00349)

## Cart building zone eligibility and priority

Determines which work units enter a system-built cart.

- Scope: SCALE Work/Picking compilation; exact release unspecified
- Accepted values: Lowest-numbered priority first; minimum/maximum work-zone sequence; aging creation date/time.
- Default: Not established by the cited source.
- Precedence and dependencies: Work without minimum/maximum zone values is ignored; NULL zone sequence is ignored when deriving those limits. Older work is considered first for aging.
- Related process: Cart building
- Validation: Proposed validation, not executed: Include missing, NULL, single-zone and multi-zone cases; verify documented ordering without assuming physical distance.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00373, b00375, b00377, b00380, b00381, b00382, b00383, b00384](reading/sdd-61bfda888fe30365.md#b00373)

## Picking Management Active

Makes work available to Picking Management screens.

- Scope: SCALE Work/Picking compilation; exact release unspecified
- Accepted values: Selected on both work zone and work type.
- Default: Not established by the cited source.
- Precedence and dependencies: Both associated configuration records must have Pick Management Active selected for the work unit to appear.
- Related process: Zone-based picking
- Validation: Proposed validation, not executed: Compare work matching both flags with a case missing either flag.
- Classification: `vendor_behavior`.

Sources: [sdd-61bfda888fe30365 b00389](reading/sdd-61bfda888fe30365.md#b00389)

## Location type dimensions and weight

Allows fit assessment for an item or container.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Maximum weight and length/width/height; source permits leaving these unconfigured where unnecessary.
- Default: Not established by the cited source.
- Precedence and dependencies: Location-type dimensions are used when item location capacity is not configured.
- Related process: Putaway/capacity
- Validation: Proposed validation, not executed: Compare item-capacity and dimensional-capacity cases in a synthetic fit test.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00092, b00095](reading/sdd-f46806ef53e15f07.md#b00092)

## Location class: Include in Item Balance Upload

Controls whether quantities in a location class appear in item-balance uploads.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Checkbox enabled/disabled; source identifies system value 1.
- Default: Not established by the cited source.
- Precedence and dependencies: Disabled excludes inventory from all locations of that class. Other upload filters still require separate review.
- Related process: ERP item balance
- Validation: Proposed validation, not executed: Compare a synthetic item across included and excluded location classes; reconcile upload totals.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00104](reading/sdd-f46806ef53e15f07.md#b00104)

## Location: Allocate in transit

Controls whether In Transit quantity contributes to Available at the location.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Checkbox on/off.
- Default: Not established by the cited source.
- Precedence and dependencies: Location-level inventory tracking/allocation option; complete allocation precedence not established.
- Related process: Inventory availability
- Validation: Proposed validation, not executed: Separate on-hand and in-transit quantities and verify calculated availability.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00119](reading/sdd-f46806ef53e15f07.md#b00119)

## Default storage template

Provides unit-of-measure grouping when an item has no other applicable template.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Default or item-associated storage template; one UM can belong to multiple templates.
- Default: Not established by the cited source.
- Precedence and dependencies: Source describes default template fallback when no other template is created or associated correctly.
- Related process: Item configuration
- Validation: Proposed validation, not executed: Review item-to-template and UM associations; do not infer conversion quantities from UM names.
- Classification: `configuration_example`.

Sources: [sdd-f46806ef53e15f07 b00136, b00137](reading/sdd-f46806ef53e15f07.md#b00136)

## Item location capacity

Sets maximum item or item-class quantity for a location or location type.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Maximum quantity for an item/item class and location/location type.
- Default: Not established by the cited source.
- Precedence and dependencies: Applied during putaway and replenishment; this guide says manual location override and RF transfer disregard it.
- Related process: Putaway/replenishment
- Validation: Proposed validation, not executed: Verify putaway, replenishment and manual/RF exception behavior in the matching release.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00190, b00191](reading/sdd-f46806ef53e15f07.md#b00190)

## Adjustment type: Include In Interface Uploads

Selects adjustment transactions to send back to ERP.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Checkbox enabled/disabled.
- Default: Not established by the cited source.
- Precedence and dependencies: Selection belongs to adjustment type; source does not establish interface execution timing or other filters.
- Related process: Inventory transactions
- Validation: Proposed validation, not executed: Review intended adjustment types against upload criteria and synthetic output records.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00213](reading/sdd-f46806ef53e15f07.md#b00213)

## Putaway location group selection basis

Groups eligible putaway destinations.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Location ranges or locating zones.
- Default: Not established by the cited source.
- Precedence and dependencies: The first putaway group selection choice applies to all groups according to the source. Group putaway is presented as an alternative to pallet nesting.
- Related process: Receiving/putaway
- Validation: Proposed validation, not executed: Review existing groups before selecting a basis; verify the chosen basis across all groups.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00223, b00225](reading/sdd-f46806ef53e15f07.md#b00223)

## Locating rule assignment priority

Chooses the applicable locating rule from overlapping criteria.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Priority numbers; lower values are more important. Full numeric range is unspecified.
- Default: Not established by the cited source.
- Precedence and dependencies: Selection builds eligible locations; locating rules choose among them; assignment criteria and priority decide applicable rule.
- Related process: Receiving locating
- Validation: Proposed validation, not executed: Construct overlapping receipt criteria and verify the intended rule wins.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00228, b00229, b00237, b00242, b00246, b00250](reading/sdd-f46806ef53e15f07.md#b00228)

## Receiving preference execution method

Controls check-in and locating progression.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Check in only; Check in and Locate; Quick Receiving. Source specifically names Check in and Locate (immediate) for putaway groups.
- Default: Not established by the cited source.
- Precedence and dependencies: Receiving preferences depend on docks, statuses, work types and sometimes teams/workflows. Putaway groups require immediate locating in this guide.
- Related process: Receiving
- Validation: Proposed validation, not executed: Compare check-in-only with immediate locating and review putaway-group prerequisites.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00268, b00269, b00271, b00272](reading/sdd-f46806ef53e15f07.md#b00268)

## Custom status flow functional area

Defines additional processing statuses for a functional area.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Configured status flow with outbound/internal statuses as applicable.
- Default: Not established by the cited source.
- Precedence and dependencies: A custom flow cannot be shared between inbound and outbound functional areas; a wave override step can assign it.
- Related process: Inbound/outbound status processing
- Validation: Proposed validation, not executed: Review functional-area association and each named transition; avoid transferring HADDAD quantity thresholds.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00386, b00387, b00389, b00403](reading/sdd-f46806ef53e15f07.md#b00386)

## Dock carrier assignment and fallback

Selects eligible shipping dock areas for containers/details.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Carrier assignment with dock location selection strategy; optional assignment.
- Default: Not established by the cited source.
- Precedence and dependencies: Without carrier assignment, source describes default location from dock management flow header/detail.
- Related process: Dock management
- Validation: Proposed validation, not executed: Review a matching carrier and a no-match case, including default location and subclass.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00412, b00415, b00417, b00418, b00425](reading/sdd-f46806ef53e15f07.md#b00412)

## Packing preference close-container settings

Controls container closing in fixed station and RF workflows.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Configured close-container preference; complete field/value list not established.
- Default: Not established by the cited source.
- Precedence and dependencies: Preference applies to a user or group; source says closing preference is used by both UI and RF.
- Related process: Packing
- Validation: Proposed validation, not executed: Review effective user/group record and compare the same synthetic container in both interfaces.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00430, b00436](reading/sdd-f46806ef53e15f07.md#b00430)

## Allocation rule component order

Connects assignment criteria and location selection with an allocation rule.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Assignment criteria; allocation location selection; allocation rule; allocation rule assignment.
- Default: Not established by the cited source.
- Precedence and dependencies: Guide gives this dependency order. HADDAD selection categories and fallback zones are examples.
- Related process: Wave/replenishment allocation
- Validation: Proposed validation, not executed: Resolve each component reference and verify a synthetic allocation against the intended location selection.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00446, b00447, b00448, b00451, b00456, b00466](reading/sdd-f46806ef53e15f07.md#b00446)

## Wave override step assignment

Runs a configured override at the intended place in a wave flow.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Override definition, criteria and wave-flow association; copies may run at different times.
- Default: Not established by the cited source.
- Precedence and dependencies: Namespace, class and method constrain compatible wave-step selection. New non-override steps require custom programming per guide.
- Related process: Wave processing
- Validation: Proposed validation, not executed: Verify compatible step mapping and order in a non-executing configuration review.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00478, b00479, b00485, b00486](reading/sdd-f46806ef53e15f07.md#b00478)

## Wave maximums

Bounds the amount of work admitted to a wave.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Thresholds for shipment lines, shipments, quantity, weight or volume.
- Default: Not established by the cited source.
- Precedence and dependencies: At a maximum, source says further shipments stop entering the wave and a new wave is created. No universal thresholds stated.
- Related process: Wave building
- Validation: Proposed validation, not executed: Use boundary-value synthetic wave criteria; confirm thresholds without adopting example values.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00497, b00498, b00499](reading/sdd-f46806ef53e15f07.md#b00497)

## Wave criteria shipment selection

Selects whole shipments using line-level criteria.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Any matching shipment line can make the entire shipment eligible.
- Default: Not established by the cited source.
- Precedence and dependencies: All lines need not match; wave master ties criteria to flow and execution mode.
- Related process: Wave building
- Validation: Proposed validation, not executed: Use a two-line shipment with only one matching line and verify whole-shipment selection.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00501, b00502, b00505, b00506](reading/sdd-f46806ef53e15f07.md#b00501)

## Cycle count threshold lookup

Chooses cycle-count interval thresholds for locations.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Minimum days between counts; criteria may specify location type, work zone and movement class.
- Default: Not established by the cited source.
- Precedence and dependencies: Lookup order: all three fields; location type+movement class; location type; all blank.
- Related process: Cycle-count planning
- Validation: Proposed validation, not executed: Review a record at each specificity level and verify first applicable threshold.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00553, b00554, b00555](reading/sdd-f46806ef53e15f07.md#b00553)

## Cycle count adjustment types

Associates inventory adjustments with confirmed count differences.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Positive/negative adjustments for activity/planned counts.
- Default: Not established by the cited source.
- Precedence and dependencies: Cycle-count preferences govern immediate confirmation versus pending review; HADDAD values remain an example.
- Related process: Cycle-count confirmation
- Validation: Proposed validation, not executed: Verify all four adjustment associations and discrepancy review behavior.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00519, b00520, b00523, b00524](reading/sdd-f46806ef53e15f07.md#b00519)

## Replenishment minimum threshold

Triggers evaluation when forward-location quantity falls below the configured percentage.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Percentage at location/location type or item/item class. Full allowed range is unspecified.
- Default: Not established by the cited source.
- Precedence and dependencies: Allocation rule is selected on replenishment master; source does not establish precedence between all threshold scopes.
- Related process: Replenishment
- Validation: Proposed validation, not executed: Review effective scope and compare just-below, equal and above-threshold synthetic quantities.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00579, b00580](reading/sdd-f46806ef53e15f07.md#b00579)

## Replenishment empty location criteria

Identifies additional destinations for unmet replenishment.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Configured eligible location filter.
- Default: Not established by the cited source.
- Precedence and dependencies: Used after currently stocked locations cannot hold required quantity, or when no location contains the item.
- Related process: Replenishment
- Validation: Proposed validation, not executed: Review no-stock and insufficient-capacity cases and expected fallback locations.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00592, b00593, b00594, b00595, b00596](reading/sdd-f46806ef53e15f07.md#b00592)

## Replenishment master and strategy sequence

Links quantity calculation, work creation, allocation, increments and criteria.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Replenishment type; work creation method; allocation rule; increment; ordered rounding strategies.
- Default: Not established by the cited source.
- Precedence and dependencies: General tab identifies type/increment; criteria tab links item/location criteria; strategies can run in sequence.
- Related process: Replenishment
- Validation: Proposed validation, not executed: Resolve linked records and verify fill/round-up/round-down results with known quantities.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00598, b00599, b00600, b00602, b00604](reading/sdd-f46806ef53e15f07.md#b00598)

## Container creation strategy

Distributes allocated quantities into new shipping containers.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Consolidate and Do Not Split; Split and Do Not Consolidate; Consolidate and Split Only Once; 3D Cubing.
- Default: Not established by the cited source.
- Precedence and dependencies: Source identifies system value key 10 as strategy selection; packing class and ordered container group determine candidate containers.
- Related process: Wave container creation
- Validation: Proposed validation, not executed: Compare compatible packing classes and container capacities; do not infer default strategy.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00619, b00624, b00636, b00639](reading/sdd-f46806ef53e15f07.md#b00619)

## Interface data map mode

Defines fields and positions for delimited or fixed-length files.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Delimited or fixed length; fixed length requires an explicit length per field.
- Default: Not established by the cited source.
- Precedence and dependencies: Guide says maps are not required for XML; interface process details execute in configured sequence.
- Related process: Interface configuration
- Validation: Proposed validation, not executed: Validate a synthetic mapping for lengths, order and delimiter; no operational file processing.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00669, b00670, b00671, b00674, b00675](reading/sdd-f46806ef53e15f07.md#b00669)

## Interface upload criteria

Filters records sent by each upload process detail.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Receiving, shipping, item balance and inventory transaction criteria are named.
- Default: Not established by the cited source.
- Precedence and dependencies: Chosen records go to the directory configured on the corresponding process detail; exact precedence is not specified.
- Related process: ERP uploads
- Validation: Proposed validation, not executed: Trace intended filter to its process detail and expected synthetic records.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00687, b00688, b00689, b00690, b00691, b00692, b00693](reading/sdd-f46806ef53e15f07.md#b00687)

## Wave document master

Controls paperwork generation during a wave.

- Scope: SCALE 2020 HADDAD configuration walkthrough
- Accepted values: Document types, record selection, output order and print settings.
- Default: Not established by the cited source.
- Precedence and dependencies: Document master must be associated with the running wave master. This describes non-label paperwork; label master is separate.
- Related process: Printing
- Validation: Proposed validation, not executed: Review master references and record selection without generating print jobs.
- Classification: `vendor_behavior`.

Sources: [sdd-f46806ef53e15f07 b00709, b00710, b00711, b00714, b00715, b00728](reading/sdd-f46806ef53e15f07.md#b00709)

## Label document type and classification

Identifies paper versus label output and its functional use.

- Scope: SCALE label training; title says 2021, some examples use older releases
- Accepted values: Document versus Label classification; training names shipping/vendor label types.
- Default: Not established by the cited source.
- Precedence and dependencies: A document must be associated with a document type. Screenshot shows print procedures and data-source/generator settings as examples.
- Related process: Label generation
- Validation: Proposed validation, not executed: Review document/type/template association in the matching SCALE release.
- Classification: `vendor_behavior`.

Sources: [sdd-56008a31665dcc23 s005-sh004, s005-sh005](reading/sdd-56008a31665dcc23.md#s005-sh004)

## Break labels

Separates groups of wave labels.

- Scope: SCALE label training; title says 2021, some examples use older releases
- Accepted values: Break Label checkbox; break level defined by label ordering.
- Default: Not established by the cited source.
- Precedence and dependencies: Slide 12 describes shipment separation; client example orders first by container type and creates a break at that level.
- Related process: Wave labels
- Validation: Proposed validation, not executed: Compare synthetic shipment and container-type breaks; inspect label order and count.
- Classification: `configuration_example`.

Sources: [sdd-56008a31665dcc23 s012-sh005, s033-sh004, s034-sh004](reading/sdd-56008a31665dcc23.md#s012-sh005)

## Insight Architect custom form creation

Creates a custom screen from a base Insight screen.

- Scope: Manhattan Active SCALE Insight Architect
- Accepted values: Create Custom against the selected base screen.
- Default: Custom active and base inactive after creation according to this source.
- Precedence and dependencies: Source says a new form ID is created, custom becomes active and base becomes inactive.
- Related process: Screen configuration
- Validation: Proposed validation, not executed: Review distinct form IDs and activation state in a nonproduction configuration snapshot.
- Classification: `vendor_behavior`.

Sources: [sdd-d4675a92502c23f4 p001-b006, p001-b007, p001-b008, p001-b009](reading/sdd-d4675a92502c23f4.md#p001-b006)

## Covetrus item-balance zero inventory choice

Documents what the Covetrus design intended to include in item balance.

- Scope: Covetrus Active SCALE design v1.4
- Accepted values: Include 0 inventory items = No; receiving-dock inventory excluded.
- Default: Covetrus design value No; vendor default unknown.
- Precedence and dependencies: Nightly initial-go-live schedule and manual host reconciliation belong to Covetrus, not the assessed deployment.
- Related process: Item balance
- Validation: Proposed validation, not executed: Compare the intended included location classes and zero-stock policy against an approved deployment snapshot.
- Classification: `implementation_specific_choice`.

Sources: [sdd-c4c7e01f8ccad48a b00468, b00470](reading/sdd-c4c7e01f8ccad48a.md#b00468)

## Covetrus multiple requests for excess demand

Splits replenishment needs when forward capacity is insufficient.

- Scope: Covetrus Active SCALE design v1.4
- Accepted values: Multiple Requests for Excess Demand selection.
- Default: Not established by the cited source.
- Precedence and dependencies: Requires item location assignment and capacity for item/company/location; source restricts this option to one permanent location per item within selection and subtracts available on-hand/in-transit. Formula details require version reconciliation.
- Related process: Demand replenishment
- Validation: Proposed validation, not executed: Use known capacity and on-hand/in-transit values; verify request count and single-permanent-location constraint.
- Classification: `implementation_specific_choice`.

Sources: [sdd-c4c7e01f8ccad48a b01098, b01100](reading/sdd-c4c7e01f8ccad48a.md#b01098)

## Covetrus replenishment priority choices

Documents proposed priority between replenishment groups.

- Scope: Covetrus Active SCALE design v1.4
- Accepted values: PL increment higher priority than EA; wave-created replenishment higher priority than manual capacity replenishment.
- Default: Not established by the cited source.
- Precedence and dependencies: These are Covetrus design choices; no numeric priorities are supplied.
- Related process: Replenishment
- Validation: Proposed validation, not executed: Review effective priorities and confirm the expected ordering with isolated synthetic work.
- Classification: `implementation_specific_choice`.

Sources: [sdd-c4c7e01f8ccad48a b01108, b01178](reading/sdd-c4c7e01f8ccad48a.md#b01108)

## Knipper count verification and tolerance

Documents count verification and discrepancy review.

- Scope: Knipper Active SCALE design; revision history v1.3
- Accepted values: Verify Bad Count; planned tolerance 0.
- Default: Knipper planned 0; not a universal vendor default.
- Precedence and dependencies: Mismatched first count requires two consecutive equal counts; discrepancies proceed to Pending Review and supervisor reconciliation.
- Related process: Cycle counting
- Validation: Proposed validation, not executed: Review effective preference/tolerance and reconcile a synthetic discrepancy.
- Classification: `implementation_specific_choice`.

Sources: [sdd-1c25f20de1eafc3e p050-b009, p050-b015, p051-b004](reading/sdd-1c25f20de1eafc3e.md#p050-b009)

## Knipper capacity replenishment dependencies

Documents manual/scheduled capacity replenishment.

- Scope: Knipper Active SCALE design; revision history v1.3
- Accepted values: Inventory Insight or scheduled jobs; fill to location. Source body says EA but annotation questions case UOM.
- Default: Not established by the cited source.
- Precedence and dependencies: Item location assignment and capacity must be present. Unit-of-measure disagreement remains unresolved.
- Related process: Replenishment
- Validation: Proposed validation, not executed: Review master increment and location assignment/capacity; do not assume EA for every facility.
- Classification: `implementation_specific_choice`.

Sources: [sdd-1c25f20de1eafc3e p055-b006, p055-b010](reading/sdd-1c25f20de1eafc3e.md#p055-b006)

## Knipper wave-master automatic mode

Documents proposed execution after wave building.

- Scope: Knipper Active SCALE design; revision history v1.3
- Accepted values: Automatic mode.
- Default: Knipper proposed Automatic; vendor default unknown.
- Precedence and dependencies: Build Wave section is expressly Future Use; automatic mode runs a wave after it is built. This is a future design, not observed enablement.
- Related process: Wave building
- Validation: Proposed validation, not executed: Review actual activation, schedule and mode before treating this future flow as in use.
- Classification: `implementation_specific_choice`.

Sources: [sdd-1c25f20de1eafc3e p071-b022, p071-b026](reading/sdd-1c25f20de1eafc3e.md#p071-b022)

## Grupo Julio receiving immediate-needs choice

Distinguishes named receiving preferences.

- Scope: Grupo Julio Active SCALE design v1.5
- Accepted values: Recibo Insumos: No; Recibo Standard: Yes; Recibo a VAS: No.
- Default: Not established by the cited source.
- Precedence and dependencies: Each is an implementation-specific preference; all cited examples use immediate check-in/locate and putaway groups.
- Related process: Receiving
- Validation: Proposed validation, not executed: Review the effective preference and immediate-demand case; do not apply one preference to every receipt.
- Classification: `implementation_specific_choice`.

Sources: [sdd-d50ca4a96095c930 p034-b005, p035-b002, p035-b004](reading/sdd-d50ca4a96095c930.md#p034-b005)

## Grupo Julio returns workflow and container locating

Distinguishes interfaced from blind returns.

- Scope: Grupo Julio Active SCALE design v1.5
- Accepted values: Interfaced Recibo Dev: Header-Item and Parent; blind Recibo Dev Ciega: Blind and Child.
- Default: Not established by the cited source.
- Precedence and dependencies: Both describe system LP assignment, immediate locating and possible EX05 quantity-entry extension.
- Related process: Returns receiving
- Validation: Proposed validation, not executed: Compare source-assigned preference and extension availability for interfaced/blind returns.
- Classification: `implementation_specific_choice`.

Sources: [sdd-d50ca4a96095c930 p035-b005, p035-b006, p036-b002, p036-b003, p036-b004](reading/sdd-d50ca4a96095c930.md#p035-b005)

## Grupo Julio VAS disposition/reason requirements

Routes imported goods requiring pricing labels.

- Scope: Grupo Julio Active SCALE design v1.5
- Accepted values: Inventory status VAS; disposition and reason codes required.
- Default: Not established by the cited source.
- Precedence and dependencies: Reason code selects a different locating rule; mapping tables may change during build. Cuarentena inventory-status cell is blank in the source.
- Related process: VAS receiving
- Validation: Proposed validation, not executed: Review reason-to-disposition and locating-rule mappings; resolve the blank status rather than filling it by inference.
- Classification: `implementation_specific_choice`.

Sources: [sdd-d50ca4a96095c930 p035-b003, p035-b004, p036-b006, p036-t001, p036-t002](reading/sdd-d50ca4a96095c930.md#p035-b003)

## MAWM example: residual cubing disabled

Documents a LAND non-cubed order-planning example.

- Scope: MAWM LAND design v2.11; excluded from SCALE configuration transfer
- Accepted values: Residual Cubing Enabled = No in the pictured criteria.
- Default: Not established by the cited source.
- Precedence and dependencies: Used for named store/large VAS/marketing/photo orders bulk-picked into totes. MAWM-only; no SCALE equivalence.
- Related process: MAWM order planning
- Validation: Proposed validation, not executed: Compare only to authorized MAWM configuration; do not transfer to SCALE.
- Classification: `implementation_specific_choice`.

Sources: [sdd-de62bfaf88f5d35b b02653, b02654, b02657](reading/sdd-de62bfaf88f5d35b.md#b02653)

## MAWM example: resource-family batch thresholds

Documents sorter-capacity batching in LAND.

- Scope: MAWM LAND design v2.11; excluded from SCALE configuration transfer
- Accepted values: Example SA-Bag threshold1, max270, min216, manual releaseN, pick across batchesNo; several other cells are question marks.
- Default: Not established by the cited source.
- Precedence and dependencies: Example 45 active stations x6 chutes=270 and 80%=216. AU04 custom completion threshold releases capacity. MAWM-only.
- Related process: MAWM work release
- Validation: Proposed validation, not executed: Resolve unknown cells and custom AU04 behavior in MAWM-specific evidence; no SCALE recommendation.
- Classification: `implementation_specific_choice`.

Sources: [sdd-de62bfaf88f5d35b b02674, b02675, b02678, b02679, b02690, b02693, b02698, b02699](reading/sdd-de62bfaf88f5d35b.md#b02674)

## PDF continuation — 2026-09-30

These eleven additional settings are named implementation choices. Values are documentary evidence; no configuration was read from or applied to an operational system.

### Item Balance XML Upload (grupo-item-balance-upload)

Enables the Item Balance XML interface option.

[sdd-d50ca4a96095c930 p022-b002, p022-b014](reading/sdd-d50ca4a96095c930.md#p022-b002)

- Scope: <code>Grupo Julio Active SCALE design v1.5 (2024-09-03). Implementation-specific, not a universal SCALE default.</code>
- Accepted values: <code>Enabled under Interface Process; Upload Directory uses https://{storage}/ils/Interface/Upload/Balance/.</code>
- Default: <code>Not established by the cited source.</code>
- Precedence: <code>The source requires enablement and replacement of {storage} with the client Azure Storage value; no actual endpoint is supplied here.</code>
- Process: <code>Interfaces</code>
- Validation: <code>Compare this historical source choice with an authorized version-matched configuration and process contract before use. No deployed configuration query, operational execution or change was performed.</code>
- Deployment state: <code>NOT_OBSERVED_IN_ASSESSED_DEPLOYMENT</code>

### Upload configuration access (grupo-upload-access)

Distinguishes lower-level and production-level editing rights.

[sdd-d50ca4a96095c930 p022-b004, p022-b005, p022-b006](reading/sdd-d50ca4a96095c930.md#p022-b004)

- Scope: <code>Grupo Julio Active SCALE design v1.5 (2024-09-03). Implementation-specific, not a universal SCALE default.</code>
- Accepted values: <code>Lower-level: editable fields and Create/Delete/Copy criteria. Production-level: view/select/copy text, no editing or Create/Delete/Copy criteria.</code>
- Default: <code>Not established by the cited source.</code>
- Precedence: <code>Source-defined user level governs configuration actions; no actual user membership or permission was queried.</code>
- Process: <code>Interfaces</code>
- Validation: <code>Compare this historical source choice with an authorized version-matched configuration and process contract before use. No deployed configuration query, operational execution or change was performed.</code>
- Deployment state: <code>NOT_OBSERVED_IN_ASSESSED_DEPLOYMENT</code>

### Locating Rule Assignment During (grupo-locating-assignment-during)

Controls when the locating assignment is applied.

[sdd-d50ca4a96095c930 p041-b003](reading/sdd-d50ca4a96095c930.md#p041-b003)

- Scope: <code>Grupo Julio Active SCALE design v1.5 (2024-09-03). Implementation-specific, not a universal SCALE default.</code>
- Accepted values: <code>Receipt Check-In.</code>
- Default: <code>Not established by the cited source.</code>
- Precedence: <code>The design states assignment at receipt check-in. Item, download and disposition-related assignment are discussed as possible inputs, not an exhaustive precedence ladder.</code>
- Process: <code>Receiving / putaway</code>
- Validation: <code>Compare this historical source choice with an authorized version-matched configuration and process contract before use. No deployed configuration query, operational execution or change was performed.</code>
- Deployment state: <code>NOT_OBSERVED_IN_ASSESSED_DEPLOYMENT</code>

### SUPERVISOR-001 exception location (grupo-supervisor-location)

Provides a virtual multi-item location for locating exceptions.

[sdd-d50ca4a96095c930 p041-b002](reading/sdd-d50ca4a96095c930.md#p041-b002)

- Scope: <code>Grupo Julio Active SCALE design v1.5 (2024-09-03). Implementation-specific, not a universal SCALE default.</code>
- Accepted values: <code>SUPERVISOR-001, virtual, multi-item.</code>
- Default: <code>Not established by the cited source.</code>
- Precedence: <code>Troubleshooting destination in this implementation; not an instruction to create or move live inventory.</code>
- Process: <code>Putaway</code>
- Validation: <code>Compare this historical source choice with an authorized version-matched configuration and process contract before use. No deployed configuration query, operational execution or change was performed.</code>
- Deployment state: <code>NOT_OBSERVED_IN_ASSESSED_DEPLOYMENT</code>

### Dock-management Create Next Move (grupo-dock-next-move)

Controls the next inventory move in the documented dock flow.

[sdd-d50ca4a96095c930 p084-b002, p084-t001](reading/sdd-d50ca4a96095c930.md#p084-b002)

- Scope: <code>Grupo Julio Active SCALE design v1.5 (2024-09-03). Implementation-specific, not a universal SCALE default.</code>
- Accepted values: <code>In Packing: No; Staging Pending: YES; Loading Pending: YES; Ship Confirm Pending: NO.</code>
- Default: <code>Not established by the cited source.</code>
- Precedence: <code>The base flow maps Packing to EMPAQUE-01, Staging to STG-001 and Dock Door to EMBDOCK-01; additional flows can be created according to the source.</code>
- Process: <code>Packing / shipping</code>
- Validation: <code>Compare this historical source choice with an authorized version-matched configuration and process contract before use. No deployed configuration query, operational execution or change was performed.</code>
- Deployment state: <code>NOT_OBSERVED_IN_ASSESSED_DEPLOYMENT</code>

### Adjustment / transfer limits and work flags (grupo-adjustment-transfer-types)

Bounds allowed quantities and controls work generation and host interface by type.

[sdd-d50ca4a96095c930 p088-b004, p088-b007, p088-t001, p089-t001](reading/sdd-d50ca4a96095c930.md#p088-b004)

- Scope: <code>Grupo Julio Active SCALE design v1.5 (2024-09-03). Implementation-specific, not a universal SCALE default.</code>
- Accepted values: <code>See reviewed table grupo-adjustment-types: six example rows, signed limits, Create Work and Interface flags. Cambio de Estado quantity remains unspecified.</code>
- Default: <code>Not established by the cited source.</code>
- Precedence: <code>Type-level limits and security apply; the example list is not final and no global default is stated.</code>
- Process: <code>Inventory</code>
- Validation: <code>Compare this historical source choice with an authorized version-matched configuration and process contract before use. No deployed configuration query, operational execution or change was performed.</code>
- Deployment state: <code>NOT_OBSERVED_IN_ASSESSED_DEPLOYMENT</code>

### Locating Rule Assignment During (knipper-locating-assignment-during)

Controls locating-rule assignment on receipt details.

[sdd-1c25f20de1eafc3e p035-b012, p035-b016](reading/sdd-1c25f20de1eafc3e.md#p035-b012)

- Scope: <code>Knipper Active SCALE design v1.3 (2024-12-10). Implementation-specific, not a universal SCALE default.</code>
- Accepted values: <code>Receipt Check-In.</code>
- Default: <code>Not established by the cited source.</code>
- Precedence: <code>The body also permits manually choosing a different locating rule after receipt-detail download. Exact conflict resolution after later processing is not established.</code>
- Process: <code>Receiving / putaway</code>
- Validation: <code>Compare this historical source choice with an authorized version-matched configuration and process contract before use. No deployed configuration query, operational execution or change was performed.</code>
- Deployment state: <code>NOT_OBSERVED_IN_ASSESSED_DEPLOYMENT</code>

### Item-category locating sequences (knipper-locating-category-rules)

Uses item categories to choose sample locating strategies and destinations.

[sdd-1c25f20de1eafc3e p035-b012, p036-t003, p036-t004, p037-t003, p037-t004, p037-t005, p037-t006, p038-t002, p038-b017](reading/sdd-1c25f20de1eafc3e.md#p035-b012)

- Scope: <code>Knipper Active SCALE design v1.3 (2024-12-10). Implementation-specific, not a universal SCALE default.</code>
- Accepted values: <code>Category2: Refrigerated, DEA Controlled, General or Freezer; General with Category8 Literature or Medical Devices has separate examples. Damaged and Returns examples also appear.</code>
- Default: <code>Not established by the cited source.</code>
- Precedence: <code>Tables list sequences and no-split choices; they are samples, not a complete rule or category enumeration.</code>
- Process: <code>Putaway</code>
- Validation: <code>Compare this historical source choice with an authorized version-matched configuration and process contract before use. No deployed configuration query, operational execution or change was performed.</code>
- Deployment state: <code>NOT_OBSERVED_IN_ASSESSED_DEPLOYMENT</code>

### Shipment-detail Allocation Rule (knipper-allocation-rule-selection)

Chooses the allocation sequence by shipment criteria.

[sdd-1c25f20de1eafc3e p078-b003](reading/sdd-1c25f20de1eafc3e.md#p078-b003)

- Scope: <code>Knipper Active SCALE design v1.3 (2024-12-10). Implementation-specific, not a universal SCALE default.</code>
- Accepted values: <code>Shipment-detail rule; *Default when no rule is set on the detail.</code>
- Default: <code>*Default allocation rule if the shipment detail has no allocation rule.</code>
- Precedence: <code>Assignment can occur in the wave and can be manually set via interface or Shipment Detail. The source also describes an override-data wave step for special processing and says its SQL needs review; no SQL was executed or presumed implemented.</code>
- Process: <code>Allocation</code>
- Validation: <code>Compare this historical source choice with an authorized version-matched configuration and process contract before use. No deployed configuration query, operational execution or change was performed.</code>
- Deployment state: <code>NOT_OBSERVED_IN_ASSESSED_DEPLOYMENT</code>

### Allocate Complete (knipper-allocate-complete)

Requires full shipment allocatability before allocation.

[sdd-1c25f20de1eafc3e p080-b025](reading/sdd-1c25f20de1eafc3e.md#p080-b025)

- Scope: <code>Knipper Active SCALE design v1.3 (2024-12-10). Implementation-specific, not a universal SCALE default.</code>
- Accepted values: <code>Shipment-header flag set: no allocation unless 100% of the shipment can be allocated; used for defined order profiles.</code>
- Default: <code>Not established by the cited source.</code>
- Precedence: <code>The all-or-nothing guard is source-described. The list of defined profiles and current flag values are not supplied.</code>
- Process: <code>Allocation</code>
- Validation: <code>Compare this historical source choice with an authorized version-matched configuration and process contract before use. No deployed configuration query, operational execution or change was performed.</code>
- Deployment state: <code>NOT_OBSERVED_IN_ASSESSED_DEPLOYMENT</code>

### Component-pull work unit and direction (knipper-component-work-identity)

Groups component picks for work-order execution.

[sdd-1c25f20de1eafc3e p063-b006](reading/sdd-1c25f20de1eafc3e.md#p063-b006)

- Scope: <code>Knipper Active SCALE design v1.3 (2024-12-10). Implementation-specific, not a universal SCALE default.</code>
- Accepted values: <code>One work unit per work order; body specifies user-directed work and a Component Pulling work profile.</code>
- Default: <code>Not established by the cited source.</code>
- Precedence: <code>A sample screenshot starts with System directed and another has clipped values. The body intent and screenshot labels are explicitly kept separate; neither is a deployed setting.</code>
- Process: <code>Work orders</code>
- Validation: <code>Compare this historical source choice with an authorized version-matched configuration and process contract before use. No deployed configuration query, operational execution or change was performed.</code>
- Deployment state: <code>NOT_OBSERVED_IN_ASSESSED_DEPLOYMENT</code>

## Knipper interface and exception settings — 2026-09-30 delta 2

Five additional records describe source-specific interface and permission boundaries. They were not read from or applied to an operational system.

### Receipt upload at closed-container level (knipper-receipt-upload-closed-container)

Identify the documentary trigger and level of receipt confirmation uploads.

[sdd-1c25f20de1eafc3e p013-b009](reading/sdd-1c25f20de1eafc3e.md#p013-b009)

- Scope: <code>Knipper Active SCALE design v1.3 (2024-12-10); historical implementation-specific choice, not a universal default.</code>
- Accepted values: <code>Upload at container level when receipt-container status is Closed; described as a global setting applying to all receipt types.</code>
- Default: <code>Not established as a universal default by this source.</code>
- Precedence: <code>The source says global/all receipt types. It does not name a configuration key or override hierarchy.</code>
- Process: <code>Receipt confirmation; includes receipt header, detail and container data.</code>
- Validation: <code>Compare with authorized version-matched configuration and process requirements before use. No operational configuration query, execution or change was performed.</code>
- Deployment state: <code>NOT_OBSERVED_IN_ASSESSED_DEPLOYMENT</code>

### Item balance upload inclusion (knipper-item-balance-upload)

Distinguish the inventory included in the documentary host balance comparison.

[sdd-1c25f20de1eafc3e p014-b007, p014-b008, p014-b009, p014-b010](reading/sdd-1c25f20de1eafc3e.md#p014-b007)

- Scope: <code>Knipper Active SCALE design v1.3 (2024-12-10); historical implementation-specific choice, not a universal default.</code>
- Accepted values: <code>Include zero-inventory items: No. Receiving-dock inventory: excluded. Shipping-dock inventory: included.</code>
- Default: <code>Not established as a universal default by this source.</code>
- Precedence: <code>Source-specific inclusion choices; no warehouse, company or user override ordering is documented here.</code>
- Process: <code>Item/lot/status on-hand balance, on demand through Interface Data or through Scheduled Job.</code>
- Validation: <code>Compare with authorized version-matched configuration and process requirements before use. No operational configuration query, execution or change was performed.</code>
- Deployment state: <code>NOT_OBSERVED_IN_ASSESSED_DEPLOYMENT</code>

### Allow over receiving (knipper-over-receiving-disabled)

Preserve the source boundary for quantities beyond an expected receipt line.

[sdd-1c25f20de1eafc3e p032-b012](reading/sdd-1c25f20de1eafc3e.md#p032-b012)

- Scope: <code>Knipper Active SCALE design v1.3 (2024-12-10); historical implementation-specific choice, not a universal default.</code>
- Accepted values: <code>Disabled in Receiving Preferences. The described exception requests a new host PO/receipt through the receiving supervisor.</code>
- Default: <code>Not established as a universal default by this source.</code>
- Precedence: <code>A new receipt is the documented process; no automatic tolerance, permission bypass or live configuration is established.</code>
- Process: <code>Receiving overages.</code>
- Validation: <code>Compare with authorized version-matched configuration and process requirements before use. No operational configuration query, execution or change was performed.</code>
- Deployment state: <code>NOT_OBSERVED_IN_ASSESSED_DEPLOYMENT</code>

### Short Pick access (knipper-short-pick-permission)

Separate quantity-shortage handling from permission to confirm a shortage.

[sdd-1c25f20de1eafc3e p094-b003, p098-b004, p098-b005](reading/sdd-1c25f20de1eafc3e.md#p094-b003)

- Scope: <code>Knipper Active SCALE design v1.3 (2024-12-10); historical implementation-specific choice, not a universal default.</code>
- Accepted values: <code>Cart picking: short option controlled by security, selected pickers only. REPS passage names specific users/supervisors. Without permission, Pass leaves work suspended for supervisor handling.</code>
- Default: <code>Not established as a universal default by this source.</code>
- Precedence: <code>Permission remains process/user-specific. The nearby conditional picker language does not grant all users Short Pick access; no actual security checkpoint identity or deployed membership was checked.</code>
- Process: <code>Cart and REPS picking exceptions.</code>
- Validation: <code>Compare with authorized version-matched configuration and process requirements before use. No operational configuration query, execution or change was performed.</code>
- Deployment state: <code>NOT_OBSERVED_IN_ASSESSED_DEPLOYMENT</code>

### Host update/delete status preconditions (knipper-interface-change-status)

Preserve source-described lifecycle restrictions on host changes.

[sdd-1c25f20de1eafc3e p014-b012, p014-b013](reading/sdd-1c25f20de1eafc3e.md#p014-b012)

- Scope: <code>Knipper Active SCALE design v1.3 (2024-12-10); historical implementation-specific choice, not a universal default.</code>
- Accepted values: <code>Shipment leading and trailing status: In Pool. Receipt leading and trailing status: Check In Pending.</code>
- Default: <code>Not established as a universal default by this source.</code>
- Precedence: <code>The interface Action Code selects Insert, Update or Delete in the source narrative; this passage does not specify missing-code behavior or physical status values.</code>
- Process: <code>Download interface update/delete validation.</code>
- Validation: <code>Compare with authorized version-matched configuration and process requirements before use. No operational configuration query, execution or change was performed.</code>
- Deployment state: <code>NOT_OBSERVED_IN_ASSESSED_DEPLOYMENT</code>

## Grupo Julio additional configuration contracts

The following records describe the cited design or visible example only. None was observed in the assessed deployment.

### Item XML Download

Enable the documented Web Services item download option.

- Scope: Grupo Julio Active SCALE design v1.5 (2024-09-03); document-specific example, not assessed deployment.
- Documented value/example: Enabled under Interface Process.
- Default: No universal default established by this source.
- Precedence and limits: Host sends changed/created item records; no conflict precedence established.
- Process: Item master interface.
- Validation: Compare the exact version-matched setting and authorized deployment evidence before use; no configuration query or operational action was performed.

[sdd-d50ca4a96095c930 p017-b002, p017-b006](reading/sdd-d50ca4a96095c930.md#p017-b002)

### Receiving XML Download

Enable the documented Web Services receipt download option.

- Scope: Grupo Julio Active SCALE design v1.5 (2024-09-03); document-specific example, not assessed deployment.
- Documented value/example: Enabled under Interface Process.
- Default: No universal default established by this source.
- Precedence and limits: Container-level ASN data is planned only for some receipts; no universal payload requirement is inferred.
- Process: Receipt interface.
- Validation: Compare the exact version-matched setting and authorized deployment evidence before use; no configuration query or operational action was performed.

[sdd-d50ca4a96095c930 p018-b004](reading/sdd-d50ca4a96095c930.md#p018-b004)

### Shipping XML Download

Enable the documented Web Services shipment download option.

- Scope: Grupo Julio Active SCALE design v1.5 (2024-09-03); document-specific example, not assessed deployment.
- Documented value/example: Enabled under Interface Process.
- Default: No universal default established by this source.
- Precedence and limits: The shipment interface supplies wave information; additional information may use Override Data wave steps.
- Process: Shipment interface.
- Validation: Compare the exact version-matched setting and authorized deployment evidence before use; no configuration query or operational action was performed.

[sdd-d50ca4a96095c930 p019-b005](reading/sdd-d50ca4a96095c930.md#p019-b005)

### Upload Receipt Containers at This Status or Higher

Control the earliest receipt-container state eligible for upload.

- Scope: Grupo Julio Active SCALE design v1.5 (2024-09-03); document-specific example, not assessed deployment.
- Documented value/example: Grupo design: Putaway Pending; vendor recommendation in this passage: Closed.
- Default: No universal default established by this source.
- Precedence and limits: Applies to all receipt types in the design; early upload introduces the documented ERP duplicate-inventory risk on cancel/re-receive.
- Process: Receiving upload.
- Validation: Compare the exact version-matched setting and authorized deployment evidence before use; no configuration query or operational action was performed.

[sdd-d50ca4a96095c930 p020-b004, p038-b002](reading/sdd-d50ca4a96095c930.md#p020-b004)

### Receiving Upload Level

Select the grouping/granularity of receipt upload.

- Scope: Grupo Julio Active SCALE design v1.5 (2024-09-03); document-specific example, not assessed deployment.
- Documented value/example: Grupo design: Container.
- Default: No universal default established by this source.
- Precedence and limits: The source calls this a global setting for all receipt types. No other allowed values or default are enumerated here.
- Process: Receiving upload.
- Validation: Compare the exact version-matched setting and authorized deployment evidence before use; no configuration query or operational action was performed.

[sdd-d50ca4a96095c930 p020-b004](reading/sdd-d50ca4a96095c930.md#p020-b004)

### Receiving process-detail Upload Directory

Route eligible receiving upload records to their output directory.

- Scope: Grupo Julio Active SCALE design v1.5 (2024-09-03); document-specific example, not assessed deployment.
- Documented value/example: A directory on each interface process detail; a blank detail directory uses the interface system-value upload directory.
- Default: No universal default established by this source.
- Precedence and limits: The explicit process-detail directory takes precedence over the system-value directory. Receiving interface system-value conditions still apply.
- Process: Receiving upload routing and criteria.
- Validation: Compare the exact version-matched setting and authorized deployment evidence before use; no configuration query or operational action was performed.

[sdd-d50ca4a96095c930 p020-b005](reading/sdd-d50ca4a96095c930.md#p020-b005)

### Putaway group insight - Form specific - Open

Limit reopening closed putaway groups after early receiving upload.

- Scope: Grupo Julio Active SCALE design v1.5 (2024-09-03); document-specific example, not assessed deployment.
- Documented value/example: Recommendation: remove Open for ordinary users and limit reopening to supervisors; screenshot shows Open unchecked.
- Default: No universal default established by this source.
- Precedence and limits: A security recommendation for the selected early-upload design; effective user/group precedence is not specified.
- Process: Putaway groups and duplicate-upload prevention.
- Validation: Compare the exact version-matched setting and authorized deployment evidence before use; no configuration query or operational action was performed.

[sdd-d50ca4a96095c930 p038-b002, p038-b003](reading/sdd-d50ca4a96095c930.md#p038-b002)

### Allocation Rule Assignment - Always Override

Permit replacing an allocation rule assigned by a previous assignment sequence.

- Scope: Grupo Julio Active SCALE design v1.5 (2024-09-03); document-specific example, not assessed deployment.
- Documented value/example: Selected permits that replacement; not selected leaves the previous-sequence rule unchanged in this account.
- Default: No universal default established by this source.
- Precedence and limits: Assignment records are processed in priority order using shipment-detail filters. The text does not establish all item/interface/manual precedence.
- Process: Wave rule assignment before allocation.
- Validation: Compare the exact version-matched setting and authorized deployment evidence before use; no configuration query or operational action was performed.

[sdd-d50ca4a96095c930 p061-b003, p062-b003](reading/sdd-d50ca4a96095c930.md#p061-b003)

### Short Pick security permission

Control whether a picker can reduce a pick for insufficient stock.

- Scope: Grupo Julio Active SCALE design v1.5 (2024-09-03); document-specific example, not assessed deployment.
- Documented value/example: Permission required; authorized user adjusts quantity and selects a short reason. Without it, use the documented Pass/supervisor path.
- Default: No universal default established by this source.
- Precedence and limits: User access is security-controlled; the exact grant names and group-precedence rules are not supplied.
- Process: Footwear cart-picking exception.
- Validation: Compare the exact version-matched setting and authorized deployment evidence before use; no configuration query or operational action was performed.

[sdd-d50ca4a96095c930 p074-b002](reading/sdd-d50ca4a96095c930.md#p074-b002)

### Create dock work on assigning load to dock door

Create dock work when assigning a shipping load to a dock door.

- Scope: Grupo Julio Active SCALE design v1.5 (2024-09-03); document-specific example, not assessed deployment.
- Documented value/example: Checked in Shipping Preference for the Grupo design.
- Default: No universal default established by this source.
- Precedence and limits: Work follows the configured dock-management flow. This does not validate dock availability, allocation or generated work.
- Process: Dock assignment.
- Validation: Compare the exact version-matched setting and authorized deployment evidence before use; no configuration query or operational action was performed.

[sdd-d50ca4a96095c930 p085-b002](reading/sdd-d50ca4a96095c930.md#p085-b002)

### Cycle count threshold quantity and days

Illustrate a location-quantity trigger and spacing between activity-based counts.

- Scope: Grupo Julio Active SCALE design v1.5 (2024-09-03); document-specific example, not assessed deployment.
- Documented value/example: Screenshot only: Primary location type, threshold 5.00000, UM Each, 30 days; work zone and movement class blank, Inactive unchecked.
- Default: No universal default established by this source.
- Precedence and limits: These visible example fields do not establish default values, exact comparison logic or the selected deployment record.
- Process: Activity-based cycle count example.
- Validation: Compare the exact version-matched setting and authorized deployment evidence before use; no configuration query or operational action was performed.

[sdd-d50ca4a96095c930 p092-b005, p092-b006, p093-b002](reading/sdd-d50ca4a96095c930.md#p092-b005)

### Document Routing and Workstation configuration

Suppress selected shipping labels at packing stations for specified flows.

- Scope: Grupo Julio Active SCALE design v1.5 (2024-09-03); document-specific example, not assessed deployment.
- Documented value/example: The design proposes document-type routing that does not print those documents at packing; Workstation configuration is another proposed route.
- Default: No universal default established by this source.
- Precedence and limits: No exact routing record, precedence between these alternatives or adopted choice is supplied.
- Process: Close-container/packing label output.
- Validation: Compare the exact version-matched setting and authorized deployment evidence before use; no configuration query or operational action was performed.

[sdd-d50ca4a96095c930 p077-b004](reading/sdd-d50ca4a96095c930.md#p077-b004)
