# Inventory configuration and state table roles

This review explains 25 captured tables using their columns, keys and defaults, with six complete SQL reading bodies for selected uses. It adds bounded role evidence; no table receives full lifecycle, live configuration or operational acceptance.

A rule definition describes intended choices. An access association stores relationships. A request or plan stores operational bookkeeping. These roles do not establish what a particular user can do or whether a warehouse process has run.

## Practical distinctions

- Cycle-count definitions, preferences and generated plans have separate roles. The plan view counts open plus closed transactions; reviewed counts are a separate field.
- Putaway group definitions differ from created putaway groups. A view can repeat a group for multiple receipt containers.
- A captured identity primary key does not make a business pair unique. Several authorization associations allow duplicate pairs at the schema level.
- Numeric ROW_VERSION is not the engine rowversion type. A numeric quantity or sequence does not establish positive-value enforcement.
- Receiving INITIATION_METHOD is required despite a captured NULL default; explicit application values or other write behavior matter.

## Reviewed identities

### dbo.CYCLE_COUNT_MASTER

Define named cycle-count selection and work-generation settings.

MASTER_NAME is the primary key. CREATE_WORK, ACTIVE, UPDATE_CYCLECOUNTS and WAREHOUSE_AUTHORIZATION are required fields; item/location selections and scheduling/randomization fields are nullable. MAX_REQUESTS defaults to numeric zero. The meanings of redacted flag defaults and actual scheduled-job selection are not established.

Evidence: [86291367.json lines 1-502](objects/86291367.json#L1), [indexes.json lines 686-703](catalog/indexes.json#L686), [default_constraints.json lines 1367-1373](catalog/default_constraints.json#L1367), [default_constraints.json lines 1395-1401](catalog/default_constraints.json#L1395), [default_constraints.json lines 1423-1429](catalog/default_constraints.json#L1423), [default_constraints.json lines 1458-1464](catalog/default_constraints.json#L1458), [default_constraints.json lines 2550-2556](catalog/default_constraints.json#L2550).

### dbo.CYCLE_COUNT_PLAN

Track a generated cycle-count plan and its progress counters.

INTERNAL_PLAN_NUM is an identity primary key. MASTER_NAME has a nonunique index but no captured outgoing foreign key. TOTAL_OPEN, TOTAL_REVIEWED and TOTAL_CLOSED are required and default to zero; the two error counters are nullable. The metadata view calculates total transactions as open plus closed, not open plus reviewed plus closed, and uses zero guards for percentage calculations.

Evidence: [118291481.json lines 1-628](objects/118291481.json#L1), [indexes.json lines 902-919](catalog/indexes.json#L902), [indexes.json lines 920-937](catalog/indexes.json#L920), [default_constraints.json lines 1500-1506](catalog/default_constraints.json#L1500), [default_constraints.json lines 1528-1534](catalog/default_constraints.json#L1528), [default_constraints.json lines 1563-1569](catalog/default_constraints.json#L1563), [default_constraints.json lines 1598-1604](catalog/default_constraints.json#L1598), [1072058905.sql lines 1-45](sql/1072058905.sql#L1).

### dbo.CYCLE_COUNT_PREFERENCES

Describe count and adjustment preferences with quantity and price tolerances.

PREFERENCE_NAME is the primary key. ACTIVE, IMMEDIATE_ADJUSTMENT and IMMEDIATE_COUNT are required. Positive/negative thresholds and work type/team are nullable; price tolerances are nullable with default zero. No captured check constraint enforces a nonnegative tolerance or a relation between the positive and negative limits.

Evidence: [150291595.json lines 1-523](objects/150291595.json#L1), [indexes.json lines 1172-1189](catalog/indexes.json#L1172), [default_constraints.json lines 1633-1639](catalog/default_constraints.json#L1633), [default_constraints.json lines 1675-1681](catalog/default_constraints.json#L1675), [default_constraints.json lines 1710-1716](catalog/default_constraints.json#L1710).

### dbo.CYCLE_COUNT_MASTER_WAREHOUSE_ACCESS

Associate a cycle-count master with a warehouse.

OBJECT_ID is an identity primary key. Required MASTER_NAME and WAREHOUSE have enabled, trusted NO_ACTION foreign keys to the master and warehouse. The captured indexes do not make the master/warehouse pair unique. This association alone does not establish a particular user or master authorization decision.

Evidence: [1397840292.json lines 1-334](objects/1397840292.json#L1), [indexes.json lines 14564-14581](catalog/indexes.json#L14564), [foreign_keys.json lines 3098-3109](catalog/foreign_keys.json#L3098), [foreign_keys.json lines 3146-3157](catalog/foreign_keys.json#L3146).

### dbo.ITEM_LOCATION_ASSIGNMENT

Associate an item with an allocation location in a warehouse.

INTERNAL_ITEM_LOC_NUM is the identity primary key. ITEM, warehouse and ALLOCATION_LOC are required; COMPANY and QUANTITY_UM are nullable. The item/company and location/warehouse indexes are nonunique. The movement-class view left-joins on item, allocation location, warehouse and null-aware company; duplicate matching assignment rows can multiply the projection. Captured foreign keys cover company and warehouse, not item or location.

Evidence: [466816725.json lines 1-397](objects/466816725.json#L1), [indexes.json lines 4142-4159](catalog/indexes.json#L4142), [indexes.json lines 4160-4177](catalog/indexes.json#L4160), [indexes.json lines 4178-4195](catalog/indexes.json#L4178), [indexes.json lines 4196-4213](catalog/indexes.json#L4196), [foreign_keys.json lines 1118-1129](catalog/foreign_keys.json#L1118), [foreign_keys.json lines 1154-1165](catalog/foreign_keys.json#L1154), [572581128.sql lines 1-51](sql/572581128.sql#L1).

### dbo.ITEM_SUBSTITUTE

Record candidate substitute item identities and their sequence.

OBJECT_ID is the identity primary key. Both required item identities reference ITEM through enabled, trusted NO_ACTION foreign keys. The unique key is INTERNAL_ITEM_NUM, SEQUENCE, SUBSTITUTE together. It does not make a sequence unique independently of its substitute, nor prevent the same substitute at different sequences. No reviewed caller establishes selection order or activation.

Evidence: [530816953.json lines 1-355](objects/530816953.json#L1), [indexes.json lines 4880-4897](catalog/indexes.json#L4880), [indexes.json lines 4898-4915](catalog/indexes.json#L4898), [indexes.json lines 4916-4933](catalog/indexes.json#L4916), [foreign_keys.json lines 1262-1273](catalog/foreign_keys.json#L1262), [foreign_keys.json lines 4178-4189](catalog/foreign_keys.json#L4178).

### dbo.ITEM_TEMPLATE

Define a named item format with a separator and up to five typed field lengths.

ITEM_TEMPLATE is the primary key. The separator, first field length/type and ACTIVE are required; field pairs two through five are nullable. Lengths are numeric(2,0), not automatically positive. No captured check constraint validates a supported field type, matched nullable pairs or a parsing algorithm.

Evidence: [562817067.json lines 1-544](objects/562817067.json#L1), [indexes.json lines 5312-5329](catalog/indexes.json#L5312).

### dbo.PICK_LOCATION_GROUP_HEADER

Name a reusable pick-location group.

PICK_LOCATION_GROUP is the primary key; ACTIVE is required and DESCRIPTION is nullable. Its detail rows carry location-selection criteria. The table defines the group identity; a stored ACTIVE field alone does not prove a caller filters inactive groups.

Evidence: [639341342.json lines 1-334](objects/639341342.json#L1), [indexes.json lines 6392-6409](catalog/indexes.json#L6392).

### dbo.PICK_LOCATION_GROUP_DETAIL

Store sequenced location-selection criteria within a pick-location group.

The composite primary key is PICK_LOCATION_GROUP and SEQUENCE. Warehouse, start/end locations and WORK_ZONES are nullable. Required group and optional warehouse have enabled, trusted NO_ACTION foreign keys. The sequence key distinguishes rule rows, but the interpretation of ranges, zone-list syntax and null scope requires the caller.

Evidence: [607341228.json lines 1-397](objects/607341228.json#L1), [indexes.json lines 5744-5761](catalog/indexes.json#L5744), [indexes.json lines 5762-5779](catalog/indexes.json#L5762), [indexes.json lines 5780-5797](catalog/indexes.json#L5780), [foreign_keys.json lines 4034-4045](catalog/foreign_keys.json#L4034), [foreign_keys.json lines 4070-4081](catalog/foreign_keys.json#L4070).

### dbo.PICKING_GROUP_HEADER

Define a named picking group with optional loose/full container limits.

PICKING_GROUP is the primary key and ACTIVE is required. NUMBER_OF_LOOSE_CONTAINERS and NUMBER_OF_FULL_CONTAINERS are nullable numeric(19,5), so the schema alone does not restrict them to nonnegative integers or establish enforcement. No captured check constraints supply those restrictions.

Evidence: [703341570.json lines 1-376](objects/703341570.json#L1), [indexes.json lines 7310-7327](catalog/indexes.json#L7310).

### dbo.PICKING_GROUP_DETAIL

Associate sequenced picking-group entries with pick-location groups.

The primary key is PICKING_GROUP and SEQUENCE. PICK_LOCATION_GROUP is nullable. Enabled, trusted NO_ACTION foreign keys bind the required picking group and optional pick-location group. The key does not prevent the same location group from appearing at multiple sequences. No caller ordering or null fallback is asserted.

Evidence: [671341456.json lines 1-334](objects/671341456.json#L1), [indexes.json lines 6626-6643](catalog/indexes.json#L6626), [indexes.json lines 6644-6661](catalog/indexes.json#L6644), [indexes.json lines 6662-6679](catalog/indexes.json#L6662), [foreign_keys.json lines 4118-4129](catalog/foreign_keys.json#L4118), [foreign_keys.json lines 4154-4165](catalog/foreign_keys.json#L4154).

### dbo.PUTAWAY_GROUP

Represent a putaway group, its closed state and optional assigned user/location.

INTERNAL_GROUP_NUM is the identity primary key. The location reference and warehouse are nullable foreign keys; GROUP_ID and USER_NAME are also nullable. CLOSED is required with a redacted default. The metadata view preserves groups through left joins and can yield multiple rows through receipt containers; its shape is not one row per group.

Evidence: [1007342653.json lines 1-397](objects/1007342653.json#L1), [indexes.json lines 10136-10153](catalog/indexes.json#L10136), [indexes.json lines 10154-10171](catalog/indexes.json#L10154), [indexes.json lines 10172-10189](catalog/indexes.json#L10172), [foreign_keys.json lines 4322-4333](catalog/foreign_keys.json#L4322), [foreign_keys.json lines 4358-4369](catalog/foreign_keys.json#L4358), [default_constraints.json lines 2781-2787](catalog/default_constraints.json#L2781), [1232059475.sql lines 1-35](sql/1232059475.sql#L1).

### dbo.PUTAWAY_GROUP_LOCATION

Define putaway-group location rules and assignment options.

INTERNAL_GROUP_LOC_NUM is the identity primary key. The named group location, ASSIGNMENT_METHOD, ONE_PER_USER and VERIFY_GROUP_ID are required; location bounds, unit list, zone, warehouse and MAX_UNITS are nullable. The name/warehouse pair is not constrained unique. The view reads the descriptive name by internal ID; it does not apply these assignment settings.

Evidence: [1039342767.json lines 1-502](objects/1039342767.json#L1), [indexes.json lines 10460-10477](catalog/indexes.json#L10460), [default_constraints.json lines 2802-2808](catalog/default_constraints.json#L2802), [default_constraints.json lines 2823-2829](catalog/default_constraints.json#L2823), [default_constraints.json lines 2844-2850](catalog/default_constraints.json#L2844), [1232059475.sql lines 1-35](sql/1232059475.sql#L1).

### dbo.LOCATING_REQUEST

Retain a locating request with item quantity, source/destination and work-creation bookkeeping.

INTERNAL_LOC_REQ_NUM is the identity primary key. ITEM, LOCATE_QTY, INVENTORY_TRACKING, INTERNAL_NUM, INTERNAL_NUM_TYPE and WORK_CREATED are required. Source/destination warehouse, locations, units, conversion values and receipt/container identifiers are nullable. The internal reference and launch indexes are nonunique; only company and from/to warehouse have captured outgoing foreign keys. No positive-quantity check, completion-state meaning or queue consumer is established.

Evidence: [1202819347.json lines 1-1846](objects/1202819347.json#L1), [indexes.json lines 12368-12385](catalog/indexes.json#L12368), [indexes.json lines 12386-12403](catalog/indexes.json#L12386), [indexes.json lines 12404-12421](catalog/indexes.json#L12404), [indexes.json lines 12422-12439](catalog/indexes.json#L12422), [indexes.json lines 12440-12457](catalog/indexes.json#L12440), [foreign_keys.json lines 1826-1837](catalog/foreign_keys.json#L1826), [foreign_keys.json lines 1850-1861](catalog/foreign_keys.json#L1850), [foreign_keys.json lines 1886-1897](catalog/foreign_keys.json#L1886).

### dbo.LOCATING_RULE_DETAIL

Associate locating-rule entries with a named strategy and location selection.

OBJECT_ID is the identity primary key. LOCATING_NAME references its header; SEQUENCE and STRATEGY are required while LOCATION_SEL and SPLIT_QTY are nullable. No captured unique key makes LOCATING_NAME plus SEQUENCE unique. The schema does not establish how equal sequence values are ordered or whether quantity splitting is active.

Evidence: [1234819461.json lines 1-397](objects/1234819461.json#L1), [indexes.json lines 12620-12637](catalog/indexes.json#L12620), [indexes.json lines 12638-12655](catalog/indexes.json#L12638), [foreign_keys.json lines 1910-1921](catalog/foreign_keys.json#L1910).

### dbo.REPLENISHMENT_MASTER

Define named replenishment selection, allocation and work-creation settings.

REPLENISHMENT_NAME is the primary key. ALLOCATION_RULE is a nullable foreign key. ACTIVE, REPLENISHMENT_TYPE, CREATE_MULTIPLE_REQUESTS, WORK_CREATION_METHOD, CONSOLIDATE, ALLOCATE_ANY_UM_TO_CLEAR_LOC and WAREHOUSE_AUTHORIZATION are required. The manual-replenishment view filters modes and active state using redacted literals; it does not execute replenishment or establish current settings.

Evidence: [1775345389.json lines 1-628](objects/1775345389.json#L1), [indexes.json lines 17966-17983](catalog/indexes.json#L17966), [indexes.json lines 17984-18001](catalog/indexes.json#L17984), [foreign_keys.json lines 602-613](catalog/foreign_keys.json#L602), [default_constraints.json lines 23-29](catalog/default_constraints.json#L23), [default_constraints.json lines 51-57](catalog/default_constraints.json#L51), [default_constraints.json lines 86-92](catalog/default_constraints.json#L86), [default_constraints.json lines 121-127](catalog/default_constraints.json#L121), [default_constraints.json lines 2662-2668](catalog/default_constraints.json#L2662), [default_constraints.json lines 3782-3788](catalog/default_constraints.json#L3782), [1748513608.sql lines 1-20](sql/1748513608.sql#L1).

### dbo.REPLENISHMENT_MASTER_WAREHOUSE_ACCESS

Associate named replenishment definitions with warehouses.

OBJECT_ID is the identity primary key, with required trusted NO_ACTION foreign keys to the replenishment master and warehouse. The pair is not constrained unique. The manual view left-joins these rows only when its authorization-mode predicate allows it, so a definition can appear without a warehouse association; duplicate associations can yield duplicate rows. Literal mode meaning is outside this review.

Evidence: [1477840577.json lines 1-334](objects/1477840577.json#L1), [indexes.json lines 15104-15121](catalog/indexes.json#L15104), [foreign_keys.json lines 3302-3313](catalog/foreign_keys.json#L3302), [foreign_keys.json lines 3350-3361](catalog/foreign_keys.json#L3350), [1748513608.sql lines 1-20](sql/1748513608.sql#L1).

### dbo.REPLENISHMENT_STRATEGY

Store sequenced strategy names under a replenishment master.

The primary key is REPLENISHMENT_NAME and SEQUENCE. The master reference and STRATEGY are required; the master foreign key is enabled, trusted and NO_ACTION. The key prevents duplicate sequence slots for the same master but does not require positive or contiguous values. No strategy lookup constraint or caller execution order was established.

Evidence: [1839345617.json lines 1-334](objects/1839345617.json#L1), [indexes.json lines 18524-18541](catalog/indexes.json#L18524), [indexes.json lines 18542-18559](catalog/indexes.json#L18542), [foreign_keys.json lines 746-757](catalog/foreign_keys.json#L746).

### dbo.IMMEDIATE_NEEDS_REQUEST

Record prioritized item demand and optional fulfillment linkage.

INTERNAL_REQUEST_NUM is the identity primary key. Warehouse, request type, priority, item, quantities/units and logged time are required; company, target location, line and fulfillment identity are nullable. The receipt-line view joins by item and normalized company while treating null fulfillment as zero. That join has no warehouse or receipt-line predicate and can multiply rows; it cannot establish an exact receipt-to-demand relationship.

Evidence: [2134298663.json lines 1-691](objects/2134298663.json#L1), [indexes.json lines 21404-21421](catalog/indexes.json#L21404), [indexes.json lines 21422-21439](catalog/indexes.json#L21422), [indexes.json lines 21440-21457](catalog/indexes.json#L21440), [indexes.json lines 21458-21475](catalog/indexes.json#L21458), [indexes.json lines 21476-21493](catalog/indexes.json#L21476), [indexes.json lines 21494-21511](catalog/indexes.json#L21494), [indexes.json lines 21512-21529](catalog/indexes.json#L21512), [indexes.json lines 21530-21547](catalog/indexes.json#L21530), [foreign_keys.json lines 518-529](catalog/foreign_keys.json#L518), [foreign_keys.json lines 554-565](catalog/foreign_keys.json#L554), [1280059646.sql lines 1-109](sql/1280059646.sql#L1).

### dbo.IMMEDIATE_NEEDS_TRIGGER

Define immediate-needs request types with priority and work-creation flags.

REQUEST_KEY_NUM is the primary key referenced by request rows. REQUEST_DESC, PRIORITY, CREATE_WORK, ACTIVE and SYSTEM_CREATED are required. This captured object is a user table, not a SQL DML trigger. Flag defaults are redacted; the existence of configuration fields does not establish request creation or enabled processing.

Evidence: [18815129.json lines 1-397](objects/18815129.json#L1), [indexes.json lines 110-127](catalog/indexes.json#L110), [default_constraints.json lines 3565-3571](catalog/default_constraints.json#L3565), [default_constraints.json lines 3607-3613](catalog/default_constraints.json#L3607).

### dbo.ADJUSTMENT_TYPE

Define inventory adjustment classifications, quantity limits and work/interface flags.

ADJUSTMENT_TYPE is the primary key. Description, class, frozen-inventory permission, active state, interface-upload flag, work flag and warehouse authorization are required. Minimum/maximum quantities and work-creation master are nullable. No captured check enforces minimum less than maximum, and no outgoing foreign key validates WORK_CREATION_MASTER. Caller enforcement and actual authorization remain unknown.

Evidence: [1597248745.json lines 1-523](objects/1597248745.json#L1), [indexes.json lines 16598-16615](catalog/indexes.json#L16598), [default_constraints.json lines 3215-3221](catalog/default_constraints.json#L3215), [default_constraints.json lines 3257-3263](catalog/default_constraints.json#L3257).

### dbo.ADJUSTMENT_TYPE_WAREHOUSE_ACCESS

Associate an adjustment type with a warehouse identifier.

OBJECT_ID is the identity primary key. ADJUSTMENT_TYPE and WAREHOUSE are required, but only the adjustment type has a captured foreign key. Warehouse is nvarchar(50), wider than the warehouse identifiers in the other reviewed access tables. The adjustment/warehouse pair is not constrained unique, and this table alone does not prove valid warehouses or effective rights.

Evidence: [1629248859.json lines 1-334](objects/1629248859.json#L1), [indexes.json lines 16868-16885](catalog/indexes.json#L16868), [foreign_keys.json lines 2342-2353](catalog/foreign_keys.json#L2342).

### dbo.USER_ADJSTMNT_AUTHORIZATION

Associate users with adjustment types.

The primary key is USER_NAME and ADJUSTMENT_TYPE, both supported by enabled, trusted NO_ACTION foreign keys. ROW_VERSION is numeric(9,0) with default one, not SQL Server rowversion. DeleteUserProfileReferences explicitly deletes rows for its target username; that cleanup does not prove how permission checks consume the association.

Evidence: [312388182.json lines 1-334](objects/312388182.json#L1), [indexes.json lines 2378-2395](catalog/indexes.json#L2378), [indexes.json lines 2396-2413](catalog/indexes.json#L2396), [indexes.json lines 2414-2431](catalog/indexes.json#L2414), [foreign_keys.json lines 4310-4321](catalog/foreign_keys.json#L4310), [foreign_keys.json lines 4346-4357](catalog/foreign_keys.json#L4346), [default_constraints.json lines 198-204](catalog/default_constraints.json#L198), [568701424.sql lines 1-23](sql/568701424.sql#L1).

### dbo.RECEIVING_PREFERENCES

Define receipt checking, inventory status, locating, putaway and authorization options.

PREFERENCE_NAME is the primary key. Required fields include default status/dock, locating/assignment methods, work and QC flags, and USER_AUTHORIZATION. GS1_SCAN_REQUIRED and application-identifier template are nullable. INITIATION_METHOD is NOT NULL although its captured default is NULL: omission does not supply a valid value without some other write behavior. Other literal defaults remain redacted; actual precedence and enabled behavior require application evidence.

Evidence: [1743345275.json lines 1-859](objects/1743345275.json#L1), [indexes.json lines 17732-17749](catalog/indexes.json#L17732), [default_constraints.json lines 3278-3284](catalog/default_constraints.json#L3278), [default_constraints.json lines 3320-3326](catalog/default_constraints.json#L3320), [default_constraints.json lines 3355-3361](catalog/default_constraints.json#L3355), [default_constraints.json lines 3404-3410](catalog/default_constraints.json#L3404), [default_constraints.json lines 3446-3452](catalog/default_constraints.json#L3446), [default_constraints.json lines 3488-3494](catalog/default_constraints.json#L3488), [default_constraints.json lines 3523-3529](catalog/default_constraints.json#L3523), [default_constraints.json lines 3558-3564](catalog/default_constraints.json#L3558), [default_constraints.json lines 3600-3606](catalog/default_constraints.json#L3600), [default_constraints.json lines 3642-3648](catalog/default_constraints.json#L3642), [default_constraints.json lines 3670-3676](catalog/default_constraints.json#L3670), [default_constraints.json lines 3698-3704](catalog/default_constraints.json#L3698), [default_constraints.json lines 3726-3732](catalog/default_constraints.json#L3726), [default_constraints.json lines 3754-3760](catalog/default_constraints.json#L3754).

### dbo.RECEIVING_PREFERENCE_USER_AUTHORIZATION

Associate users with receiving preference definitions.

OBJECT_ID is the identity primary key. Required user and preference references have enabled, trusted NO_ACTION foreign keys. Unlike adjustment-user authorization, this table has no captured unique user/preference pair. DeleteUserProfileReferences removes all matching target-user rows. Neither the association nor cleanup proves the current user is authorized or which preference is selected.

Evidence: [1711345161.json lines 1-334](objects/1711345161.json#L1), [indexes.json lines 17552-17569](catalog/indexes.json#L17552), [foreign_keys.json lines 542-553](catalog/foreign_keys.json#L542), [foreign_keys.json lines 566-577](catalog/foreign_keys.json#L566), [568701424.sql lines 1-23](sql/568701424.sql#L1).

## Boundaries

- No application/configuration/transactional rows were read and no SQL was executed.
- Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles.
- Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule.
- NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.

Exact hashes, reviewed column contracts and ordered unique keys: [batch record](mappings/batches/inventory-table-roles.json).
