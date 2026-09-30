# Presentation table roles

Ten table roles connect the reviewed presentation wrappers to their captured schema. This batch adds no procedure contracts or help topics. No SQL or table/configuration rows were queried. Exact metadata, keys, defaults, source lines and hashes are in [the role fragment](mappings/batches/presentation-table-roles.json).

Key distinctions: control attributes are not unique by control/name and the wrapper does not filter ACTIVE; its text control ID compares to a numeric field. Lookup records have a three-column key, so record type alone can return several records. Company membership is unique by company/user, while generic identifiers are unique only within a record type. Form MAX+1 is a suggestion, not a reservation. Nullable dimensions and quantities remain nullable despite bound defaults.

## dbo.SCREEN_CONTROL_ATTRIBUTES

Store screen-control attribute values used to choose which database object a metadata wrapper describes.

- The wrapper reads ATTRIBUTE_VALUE for SCREEN_CONTROL_ID and one fixed ATTRIBUTE_NAME. It does not filter ACTIVE, SYSTEM_CREATED or IS_CONTROL_PROPERTY.
- ATTRIBUTE_VALUE is used as an object name for metadata inspection, not executed as SQL by this wrapper. Procedure targets use the first-result-set describer; the other branch filters INFORMATION_SCHEMA.COLUMNS by TABLE_NAME without schema.

- OBJECT_ID is the only captured unique key. SCREEN_CONTROL_ID+ATTRIBUTE_NAME is not constrained unique, so several matching rows can assign an unordered value to the local variable.
- SCREEN_CONTROL_ID is numeric(9,0) NOT NULL while the wrapper parameter is nvarchar(100); malformed or out-of-range numeric text can error during comparison. ATTRIBUTE_VALUE nvarchar(500) is NOT NULL in a stored row, but no matching row still leaves the local variable NULL.
- ACTIVE defaultsY, but the lookup has no active predicate. Defaults describe insert behavior, not current stored values.

Limits: The SCREEN_CONTROL_ID foreign key validates referenced screen-control identity, not existence/type of the object named in ATTRIBUTE_VALUE. Broader control-property interpretation, UI binding and active configuration values are outside this use-site review. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.

E1: [DB Architecture/objects/75863337.json](objects/75863337.json), lines1-628; SHA-256 `a071628a23183f2ed229f53e184ff35e4e4d7b0ac0c8d048078464a7f1f05d2f`.
E2: [DB Architecture/sql/485225129.sql](sql/485225129.sql), lines14-52; SHA-256 `97218f5392e526f300a80e1c6e373ec7d5b10f7993a1b8ac4fc23c48eb665ab7`.
E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines614-631; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`.
E4: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines1142-1153; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`.
E5: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines604-610; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`.
E6: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines632-638; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`.
E7: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines660-666; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`.

## dbo.PURCHASE_ORDER_DETAIL

Store purchase-order lines and open quantities selected for ordinary or TPM receipt presentation.

- Both wrappers filter PURCHASE_ORDER_OBJECT_ID and OPEN_QUANTITY>0, project line/item/company/unit and total/open quantity, and order LINE_NUMBER then ITEM. OPEN_QUANTITY is projected twice; this is not a quantity reservation or decrement.
- Ordinary receipt selection uses USER_PROFILE.COMPANY_AUTH and COMPANY_ACCESS but also permits NULL company independently. The TPM wrapper accepts username/culture yet uses neither in its SELECT filter.

- OBJECT_ID is the primary identity key. Parent purchase-order ID has a nonunique index and required FK; no captured unique parent+LINE_NUMBER constraint prevents equal line numbers.
- OPEN_QUANTITY, TOTAL_QUANTITY and LINE_NUMBER are numeric(19,5) NOT NULL with default0. A row inserted with default open quantity is excluded by >0; negative values are also excluded. COMPANY and QUANTITY_UM can be NULL.

Limits: Header FK establishes a valid header identity, not item/company eligibility, active receipt state or actual receipt creation. No PO/shipment rows, identities, quantities or live authorization were read. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.

E1: [DB Architecture/objects/943342425.json](objects/943342425.json), lines1-985; SHA-256 `5ea46c66e5f4afbd6807d7089ed3dc74e4c33488950bf88066a066293a49fa72`.
E2: [DB Architecture/sql/693225870.sql](sql/693225870.sql), lines18-42; SHA-256 `64f3074b40be9465ea1a18623d0e04870369cda9010be6442b2f478a68bad468`.
E3: [DB Architecture/sql/709225927.sql](sql/709225927.sql), lines14-31; SHA-256 `6864b7e5532ab71305861994ec8e23130c63c15b0d860e114c6d10f03a2cafaa`.
E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines9416-9433; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`.
E5: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines9434-9451; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`.
E6: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines4286-4297; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`.
E7: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines2718-2724; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`.
E8: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines2739-2745; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`.
E9: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines2760-2766; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`.

## dbo.COMPANY_ACCESS

Store explicit user-to-company membership used by receipt-related presentation filters.

- Ordinary PO receipt membership is consulted only in one configured company-authorization branch; NULL COMPANY is a separate allowance.
- Shipment-to-receipt selection permits an all-company profile, membership in COMPANY_ACCESS, NULL company or a coded blank-company sentinel. Neither wrapper proves the caller is the supplied username.

- USER_NAME nvarchar(30) and COMPANY nvarchar(25) are NOT NULL. Captured unique key(COMPANY,USER_NAME) prevents duplicate membership pairs while allowing several companies per user.
- OBJECT_ID is an identity primary key; a second unique index on OBJECT_ID is redundant for pair semantics. The wrappers use IN membership, so membership rows do not multiply returned business rows.

Limits: Enabled/trusted FKs reference USER_PROFILE and COMPANY; they prove referenced records, not session authentication, effective permission or enforcement by every caller. This role does not describe all authorization logic in SCALE. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.

E1: [DB Architecture/objects/1817773533.json](objects/1817773533.json), lines1-334; SHA-256 `1f5ebb7e787714415a8177c003dc2bc0b00f39a0ed05baa41b69bac2d0c37825`.
E2: [DB Architecture/sql/693225870.sql](sql/693225870.sql), lines18-40; SHA-256 `64f3074b40be9465ea1a18623d0e04870369cda9010be6442b2f478a68bad468`.
E3: [DB Architecture/sql/949226782.sql](sql/949226782.sql), lines25-29; SHA-256 `7a91794f9ae2a658cb76b5f3f9e4d88772572014de5b6447bbf315c077f1e759`.
E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines18362-18379; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`.
E5: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines18380-18397; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`.
E6: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines18398-18415; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`.
E7: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines18416-18433; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`.
E8: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines18434-18451; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`.
E9: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines3326-3337; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`.
E10: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines3374-3385; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`.

## dbo.ZONE

Store global zone codes, types and active flags used to populate locating-zone choices.

- MetaTrans_GetLocatingZones selects ZONE and DESCRIPTION only where ACTIVE=Y and ZONE_TYPE=Locating, then orders by zone code.
- No warehouse, username, assignment, availability or physical location membership is tested by this selector.

- ZONE nvarchar(25) is the primary key; DESCRIPTION, ZONE_TYPE and ACTIVE are required. There is no warehouse column in this captured table.
- PICK_MGMT_ACTIVE is a separate required flag with defaultN; it is not a predicate of this locating selector. ZONE_SEQUENCE is nullable and is not the ORDER BY field.

Limits: An eligible zone choice is not evidence that locating succeeded or that every zone has suitable available locations. No current active/type values were queried. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.

E1: [DB Architecture/objects/1800393483.json](objects/1800393483.json), lines1-397; SHA-256 `818eccb8a37936ae401ffe1db58ac98d99c50f19725f7401e86392e2a004cff2`.
E2: [DB Architecture/sql/725225984.sql](sql/725225984.sql), lines11-18; SHA-256 `a6d369eceb8f0b562d5c173b4fdd4330d2f17bc0eda63d3f7924f34fec50f278`.
E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines18146-18163; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`.
E4: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines1885-1891; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`.

## dbo.LOCATION_TYPE

Store location-type codes and dimensions displayed by the active location-type selector.

- The wrapper selects LOCATION_TYPE, LENGTH, WIDTH, HEIGHT and DIMENSION_UM for ACTIVE=Y, ordered by the type code.
- It does not evaluate location capacity, unit compatibility or whether a warehouse uses the selected type. MAXIMUM_WEIGHT and WEIGHT_UM are stored but are not projected by this wrapper.

- LOCATION_TYPE is the primary key and ACTIVE is required. LENGTH/WIDTH/HEIGHT are nullable numeric(19,5); DIMENSION_UM is nullable. Explicit NULL dimensions remain possible despite their bound numeric default.
- The shared Set_To_Zero default supplies0 when invoked for bound dimension fields; it is not a CHECK constraint requiring nonnegative dimensions and does not convert units.

Limits: No captured check constraint on this table establishes positive dimensions or valid capacity policy. Other location-type consumers and actual dimensional configuration remain outside this role review. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.

E1: [DB Architecture/objects/1458820259.json](objects/1458820259.json), lines1-439; SHA-256 `bfef516f085839cc65d7f12910978269b3b01f1ad500aa6d259c25dc92e08d55`.
E2: [DB Architecture/sql/741226041.sql](sql/741226041.sql), lines11-19; SHA-256 `a5e9106f37a4111b00b1bc22647ae6a574ba12cd1858991de94b754d98e29c9b`.
E3: [DB Architecture/sql/652581413.sql](sql/652581413.sql), lines2-3; SHA-256 `9909b339cce32cf65f8aba5d4fd37e40153b9aef79a5a6f622f05284e8f03845`.
E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines14924-14941; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`.

## dbo.LOOKUP_REFERENCE

Store lookup field names and type descriptors returned for a requested record type.

- The wrapper filters only RECORD_TYPE and projects TABLE_FIELD1..10 and their type markers. It also returns the passed warehouse value/field as presentation values.
- TABLE_NAME, CONFIG_RECORD_TYPE, INCLUDE_WAREHOUSE and USE_ACTIVE_FLAG are not used as filters by this wrapper; no target table is queried or modified here.

- The primary key is(RECORD_TYPE,TABLE_NAME,CONFIG_RECORD_TYPE), not RECORD_TYPE alone. A single supplied record type may legitimately return multiple records.
- TABLE_FIELD1 and TABLE_FIELD1_TYPE are required; positions2..10 and their markers are nullable. The wrapper does not fill absent fields/types with defaults or validate them against a target catalog.
- CONFIG_RECORD_TYPE has a fixed coded default whose value is withheld; USE_ACTIVE_FLAG has defaultN. Neither default establishes current lookup behavior outside the reviewed selector.

Limits: Configured field text is metadata, not proof that the field exists or that a lookup is authorized/operational. No row values, arbitrary lookup names, UI schema or current configuration were read. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.

E1: [DB Architecture/objects/1522820487.json](objects/1522820487.json), lines1-796; SHA-256 `e1bbeac4219bf5939daeea2a6bb0492e914d7b7bf5d4959f1dc1a7928825c117`.
E2: [DB Architecture/sql/773226155.sql](sql/773226155.sql), lines27-59; SHA-256 `6e814eb187167bb0834a3d5c5ca93128ff6612f0c61facce014a305a4859add0`.
E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines15842-15859; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`.
E4: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines1815-1821; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`.
E5: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines1843-1849; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`.

## dbo.FORM

Store form identifiers consulted by the monitoring-builder wrapper when suggesting a new form number.

- The only FORM use in this wrapper is MAX(FORM_ID)+1 when @internalFormId=0. A nonzero or NULL argument follows the CASE alternative and is returned as supplied.
- The wrapper returns presentation metadata in five result sets and does not insert a FORM row, reserve an identifier or verify an explicitly supplied identifier exists.

- FORM_ID numeric(5,0) is a primary key and is not an identity column. MAX+1 on an empty table is NULL, and concurrent callers can obtain the same suggestion.
- An eventual insert must satisfy numeric(5,0) range and primary-key uniqueness. Required SECURITY_ACTIVE/FORM_KEY_NAME fields and defaultN SYSTEM_DB_SCREEN are not checked or populated by this suggestion.

Limits: The table contains form/security descriptors, but this use site does not establish UI access or activation. A suggested number is not a created form, successful insert or sequence-object reservation. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.

E1: [DB Architecture/objects/1878297751.json](objects/1878297751.json), lines1-460; SHA-256 `fb2545fde280f65d7805fe1b72193684a5b0ea55754ad3597640dd2d31f42b3d`.
E2: [DB Architecture/sql/869226497.sql](sql/869226497.sql), lines23-48; SHA-256 `906f47f5af041484e2931989e79b784d35c64c787154494c17be7edf3389a2bb`.
E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines18812-18829; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`.
E4: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines2851-2857; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`.

## dbo.PURCHASE_ORDER_HEADER

Store purchase-order header context projected by ordinary and TPM receipt presentation wrappers.

- Both wrappers select by the supplied OBJECT_ID only. They project the purchase-order ID, source contact/address metadata, company and warehouse; TPM additionally projects the ship-from group.
- Neither wrapper filters STATUS, closed date, company access, warehouse membership or open line quantity, and neither creates a receipt. Culture is accepted but not used in these SELECTs.

- OBJECT_ID numeric(9,0) identity is the sole captured unique key, so an exact existing ID selects at most one header. PURCHASE_ORDER_ID is required but is not captured as a unique business key.
- WAREHOUSE and STATUS are required, while COMPANY, source/ship-from fields and created/closed dates can be NULL. Missing/NULL internal ID returns no header rather than a synthesized default context.

Limits: No outgoing FK is captured for this header table; this absence is a snapshot metadata fact, not proof that application or external constraints never validate its fields. No contact/address/business data was read; only field names/types and wrapper projection were reviewed. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.

E1: [DB Architecture/objects/975342539.json](objects/975342539.json), lines1-985; SHA-256 `0c48838a3328404e69db81b3ead1c243f4f877f0e335a86bef8d2a12e40ee4e5`.
E2: [DB Architecture/sql/933226725.sql](sql/933226725.sql), lines14-36; SHA-256 `fa87aecaae4ef175c302a33f900dc11d15dcd982f4be9935bb8d058510bd30e8`.
E3: [DB Architecture/sql/981226896.sql](sql/981226896.sql), lines15-50; SHA-256 `3edd484685e34be712e850d00e376f695b7580db6848475313429ef49ed250d9`.
E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines9812-9829; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`.

## dbo.GENERIC_CONFIG_DETAIL

Store typed configuration entries used as two separate packing-option lists.

- The first packing list selects DESCRIPTION/IDENTIFIER by a fixed SYS1VALUE and a caller-resolved allow-over-pack display value; it has no RECORD_TYPE or ACTIVE predicate.
- The second list selects identifier/description for one fixed RECORD_TYPE and ACTIVE=Y. Both are read projections without defaulting missing description or updating configuration.

- OBJECT_ID identity is the primary key; separate unique key(RECORD_TYPE,IDENTIFIER) prevents same-pair duplicates. IDENTIFIER alone is not unique, so the first cross-record-type list can contain repeated identifiers.
- RECORD_TYPE, IDENTIFIER and ACTIVE are required; DESCRIPTION nvarchar(500) and SYS1VALUE nvarchar(250) are nullable. Neither query has an ORDER BY.
- The record-type FK references GENERIC_CONFIG_HEADER; this defines category membership, not business validity of the SYS1VALUE or current packing permission.

Limits: Generic configuration is not globally one value per identifier. Scope/active/precedence depends on each consumer; this role covers only the two cited packing lists. No effective configuration entries, packing actions or current over-pack authorization were observed. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.

E1: [DB Architecture/objects/2038298321.json](objects/2038298321.json), lines1-670; SHA-256 `a0b88261a9f7906afe2ef3ef436775ebfc1084569788ede93fd3f4052e965d91`.
E2: [DB Architecture/sql/1109227352.sql](sql/1109227352.sql), lines66-76; SHA-256 `736df22832cd0bf57f0cf670fd86afd57f26e414ec5185530d9e111325a617e7`.
E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines20252-20269; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`.
E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines20270-20287; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`.
E5: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines20288-20305; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`.
E6: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines20306-20323; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`.
E7: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines266-277; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`.

## dbo.WORK_ORDER_DETAIL

Store component allocation context projected for a selected work-order detail line.

- The wrapper returns ALLOCATED, ALLOCATION_RULE, FROM_LOCATION, item/company/warehouse, TOTAL_CONVERTED_QTY_NEEDED, CONVERTED_UM, build level/sequence and parent/detail IDs.
- It filters the internal detail-line key only and performs no allocation, quantity decrement, status update or user/warehouse authorization check.

- INTERNAL_WRK_ORD_LINE_NUM numeric(9,0) identity primary key limits an exact key selection to at most one row. Parent order, warehouse, item, build sequence/level, ALLOCATED and CONVERTED_UM are required.
- ALLOCATION_RULE, FROM_LOCATION, COMPANY and TOTAL_CONVERTED_QTY_NEEDED are nullable; source output preserves those NULLs. TOTAL_CONVERTED_QTY_NEEDED has a bound zero default but can still be explicitly NULL.
- WORK_CREATED and IN_ALLOCATION defaultN, but the selector does not filter either flag. No captured CHECK constraint makes the ALLOCATED flag an executed-allocation proof.

Limits: Enabled/trusted parent FK constrains work-order identity. It does not prove that allocation rule/location/stock is eligible or that movement work exists. Other allocation/movement writers and end-to-end work-order execution remain outside this table-role review. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.

E1: [DB Architecture/objects/1384392001.json](objects/1384392001.json), lines1-1111; SHA-256 `b8673b4b6417b11447c591e23e9f6d9315c277edc2d0192e8c57dc57e88c0a6a`.
E2: [DB Architecture/sql/1333228150.sql](sql/1333228150.sql), lines16-32; SHA-256 `c2ea083020fa5398df532d83c72229dbe2ec422362ac5717d20daf4ffcd6571e`.
E3: [DB Architecture/sql/652581413.sql](sql/652581413.sql), lines2-3; SHA-256 `9909b339cce32cf65f8aba5d4fd37e40153b9aef79a5a6f622f05284e8f03845`.
E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines14492-14509; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`.
E5: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines1274-1285; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`.
E6: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines912-918; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`.
E7: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines940-946; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`.

## Review boundary

Captured keys and foreign keys explain possible row counts and references; defaults explain omitted-value behavior. None establishes current activation, authenticated caller identity, a successful business operation or complete table lifecycle. The companion [presentation-selection batch](mappings/batches/presentation-selection.json) owns the existing module contracts.
