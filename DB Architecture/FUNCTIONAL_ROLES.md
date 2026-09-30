# Reviewed database functional roles

668/1656 eligible objects have bounded role reviews (40.34%). 988 remain unreviewed. A role review is not a complete routine semantic contract, deployment proof or operational acceptance.

Domain and role are separate; multiple roles may apply. The [complete object review ledger](mappings/object-review-ledger.json) explicitly retains every eligible object and unreviewed state. The [curated role records](mappings/functional-roles.json) bind the evidence below.

## Coverage

| Type | Eligible | Reviewed | Unreviewed |
| --- | ---: | ---: | ---: |
| P | 921 | 289 | 632 |
| U | 518 | 162 | 356 |
| FN | 66 | 66 | 0 |
| V | 135 | 135 | 0 |
| TF | 9 | 9 | 0 |
| TR | 6 | 6 | 0 |
| IF | 1 | 1 | 0 |

## Role definitions

- `transactional_state`: Stores mutable business-operation quantities, statuses or execution bookkeeping.
- `configuration`: Stores parameters, definitions or rules that can govern behavior; values and activation were not inspected.
- `master_reference`: Stores reusable identities and descriptive attributes referenced across operations.
- `execution_worklist`: Represents warehouse instruction ordering, assignment and execution state; not the generic vendor process queue.
- `reporting_read_model`: Projects or aggregates stored data for reading; does not imply materialization or measured workload.
- `presentation_metadata`: Stores screen/control definitions, binding properties and display settings.
- `presentation_adapter`: Builds result shapes or selections consumed by a user interface or print-selection flow.
- `orchestration`: Coordinates conditional database calls or multiple implementation steps; caller transactions remain separate.
- `transactional_mutation`: Contains explicit persistent INSERT, UPDATE or DELETE behavior affecting operational state.
- `integration_staging`: Stores interface-shaped payloads and processing indicators; direction, transport and delivery need additional evidence.
- `audit_history`: Stores events, changes or errors; completeness, retention and immutability are not established.
- `workflow_selection`: Builds selection logic for executable warehouse work; not necessarily read-only.
- `utility_transform`: Transforms input into derived values or structured parameters.
- `event_handler`: Defines trigger behavior for a declared DML event; actual execution was not tested.

## dbo.CdGetIdentityColumn

Map an original configuration identity to a collected current value.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1244179828.sql](sql/1244179828.sql), lines 1-35; SHA-256 `21215e3939eaa73443c8f0940fbeb9700c4dbbaef3b79e205ce2329b7cd11322`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.ConvertKeyValueTableToXML

Serialize a key/value table parameter to XML-shaped text and inject a coded namespace wrapper.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1372180284.sql](sql/1372180284.sql), lines 1-22; SHA-256 `6cc2941847bc473fa490d7beffda96dea43b2289eca4269cb29d300a1217a8d3`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.DASHFn_GetKPIValue

Compute a selected dashboard count, stored-data formula, fixed baseline or timestamp interval.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1612181139.sql](sql/1612181139.sql), lines 1-553; SHA-256 `eb1cf3fccc19e9cdaca90a9011a207abd2eb8367b218a653c47f26ea57c8c9b1`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.DATEFn_GetWeekEndDate

Compute a week-end calendar date from DATEPART weekday arithmetic.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1628181196.sql](sql/1628181196.sql), lines 1-34; SHA-256 `143df6dbfbcf9df86d23b63735fece17bd4ecd63d942fc582a588e149a7db9ff`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.DATEFn_GetWeekStartDate

Compute a week-start calendar date from DATEPART weekday arithmetic.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1644181253.sql](sql/1644181253.sql), lines 1-33; SHA-256 `41ebc9e48b98ee047fbbcd9e63fbfadfc10090af68fcb1410188fe1195e4366c`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.DATEONLY

Convert datetime to date-only smalldatetime through character text.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1421248118.sql](sql/1421248118.sql), lines 1-9; SHA-256 `133e151229b30fb8ab68fad63826f0a5cea5b48505c846f7a876772228c1df0b`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.DBHfn_TransDOToDBFieldName

Insert underscores before ASCII uppercase characters in an object field name.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/536701310.sql](sql/536701310.sql), lines 1-61; SHA-256 `7f01e7c3e1343ede5eeeae6b965b19fcbd8dc496267b5410c5934f54434e5fbe`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.DHfn_GetDateNoTime

Strip datetime time through date text conversion.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/2122802970.sql](sql/2122802970.sql), lines 1-20; SHA-256 `c8728c790eadc21ad0f0e4ff6f72fe79b361bb053a10767bdee7f364ecded1d7`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.DHfn_RoundToSec

Remove fractional milliseconds from datetime.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/2138803027.sql](sql/2138803027.sql), lines 1-19; SHA-256 `ed6170e741eac969a82c4ff64e98f3fbdaccc9ee017cb5d5a0bfaf9802e0445c`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.DHfn_TransToSQLDate

Convert a compact date-time text into a datetime.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/7319436.sql](sql/7319436.sql), lines 1-31; SHA-256 `9dee7afbcf89d8cda0ab222e67641f6ea22a646f2320caf4f409dcb0f65730b8`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.DYNAMICCALLINGfn_RtrvDesc

Retrieve stored description by record type and identifier.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/632701652.sql](sql/632701652.sql), lines 1-23; SHA-256 `4a3945ec8121fc483857a4d6b9ba9e53f88d3e5ae045bbd3ebe9f44773360798`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.fn_AuditLogValueReturnValue

Concatenate audit-log values for a field and internal identity.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/631165494.sql](sql/631165494.sql), lines 1-23; SHA-256 `f1fd2debe8e6868e2a0e3fed8f4b3e369bb7df9998f90e3379dd09516fb41079`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.fn_GetCriticalLevel

Classify a numeric count against textual caution or warning criteria.

Domains: work_execution.

- utility_transform: Transforms supplied context into a table/scalar result. Evidence: E1.

E1: [DB Architecture/sql/664701766.sql](sql/664701766.sql), lines 1-47; SHA-256 `5ba598cb928904c8c41397628cf5036892d5bbe3b18284135432081867c62fe2`. Complete module body reviewed with original-definition fingerprint.

Limits: Scope is the body and named effects, not runtime success, current data, caller authorization or complete end-to-end semantics.


## dbo.fn_GetFeatureEnabled

Resolve a feature flag for a supplied feature and user.

Domains: work_execution.

- utility_transform: Transforms supplied context into a table/scalar result. Evidence: E1.

E1: [DB Architecture/sql/680701823.sql](sql/680701823.sql), lines 1-19; SHA-256 `77e132ef10237d4ba41dc2326eb114aa18def1a75579f7db4b065d6856aa260e`. Complete module body reviewed with original-definition fingerprint.

Limits: Scope is the body and named effects, not runtime success, current data, caller authorization or complete end-to-end semantics.


## dbo.fn_GetSecurityValues

Select a form security-value string using user/group/system precedence.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/712701937.sql](sql/712701937.sql), lines 1-25; SHA-256 `d8f5363c8994a7584c0cfaa919e45fb316f63afb072e9f860a5ce897a71d9c3a`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.fn_greatest

Find maximum of up to ten decimal inputs using first argument as initial value.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1293247662.sql](sql/1293247662.sql), lines 1-31; SHA-256 `d8bccafdde324700119baec2f05afe1e317f2b2cbd65934887570dd68522ced9`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.fn_least

Find minimum of up to ten decimal inputs using first argument as initial value.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1277247605.sql](sql/1277247605.sql), lines 1-31; SHA-256 `2b7e35dbe75b7611a271db96d535d2048e6de843dc5ace308875f64cb1899093`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.fn_record_type

Classify a fixed set of grouping-bit patterns into report record categories.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1261247548.sql](sql/1261247548.sql), lines 1-78; SHA-256 `c6b852359d0e2a41e0a57a8420c0e056e4fe6c0c5b8604034bff12d1df664535`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.GENCONFIGfn_RtrvDesc

Retrieve stored description by record type and identifier.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/728701994.sql](sql/728701994.sql), lines 1-23; SHA-256 `cf978b4558998c36dc2d801d7a55301474c000f04103acaf9e095f144899a2bc`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.GENCONFIGfn_RtrvTranslatedDesc

Retrieve generic configuration description with resource-key translation when present.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/744702051.sql](sql/744702051.sql), lines 1-37; SHA-256 `1f3cae94eb8d23df5954411c1760ea511791c0338b9a1617f7c4fddd52864d19`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.GetLotExpirationDateForUpload

Select lot expiration from the greatest captured lot object identity across current/archive sources.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1229247434.sql](sql/1229247434.sql), lines 1-25; SHA-256 `d89376f4ae2db5a7d66c94e3484e4f52aa8d6a8e085361dedf1b32862d9b7280`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.GetNextProjectInstance

Suggest the next project instance from current and archived collected configuration.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/936702735.sql](sql/936702735.sql), lines 1-25; SHA-256 `e8ae23a7bfb8e002bc9363bc620f9c8ef3b4d7b3728c8e8113cb7b724631a6dc`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.GetWarehouseDate

Return warehouse-local calendar date from an assumed UTC datetime.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/984702906.sql](sql/984702906.sql), lines 1-21; SHA-256 `66af5d2ba92e0faa690d5638b023e1b44f8452846715eeab3964a2e06752e9f3`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.GetWarehouseTimezoneValue

Convert an assumed UTC timestamp to a warehouse-local timestamp.

Domains: receiving_shipping.

- utility_transform: Resolves supplied context into a scalar using configuration. Evidence: E1.

E1: [DB Architecture/sql/1000702963.sql](sql/1000702963.sql), lines 1-27; SHA-256 `6b5bdff46dfcee6ee4cf96dd5356cf4034277711d5b7749bcdb558dab325a3e4`. Complete module body reviewed with original-definition fingerprint.

Limits: Body-level review; caller authority, effective data, runtime and complete process semantics remain external.


## dbo.ILSStatusToText

Render selected numeric codes using fixed text labels with numeric-text fallback.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1165247206.sql](sql/1165247206.sql), lines 1-41; SHA-256 `c34079d4edd4433a65aa59bb8bcee7e069ce82f61949392a05117e9ad81eba2c`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.ILSTransactionTypeToText_fn

Render selected numeric codes using fixed text labels with numeric-text fallback.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1149247149.sql](sql/1149247149.sql), lines 1-73; SHA-256 `891f9ea679937163cfc8107e227a64b4ca98d03a75fbbbbdd22864e194227743`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.INVfn_AreInvAttributeValuesSame

Compare twenty stored inventory-attribute values after NULL substitution.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1640705243.sql](sql/1640705243.sql), lines 1-65; SHA-256 `c67a204561da81005427972c7aea9318dbfc07b36ead546cdac42afd732842f7`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.INVfn_DoOpenRplnExist

Compute a count-like open replenishment indicator for an item and destination.

Domains: allocation_wave_replenishment.

- utility_transform: Computes the explicitly reviewed scalar from matching request/work context. Evidence: E1.

E1: [DB Architecture/sql/1656705300.sql](sql/1656705300.sql), lines 1-108; SHA-256 `e77620d3a791fe8d958ca3268f5e2571ce6c60f76e938d4315f6ca1f8cb36860`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.INVfn_GetAvailableQuantity

Calculate available inventory under optional in-transit and identity filters.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1672705357.sql](sql/1672705357.sql), lines 1-115; SHA-256 `b24fb55c3b9ba7677438d86735943afbd54168d0e47a91906d3dbc664c44e086`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.INVfn_GetAvailableQuantityWithoutInTransit

Calculate available inventory without in-transit using its own identity rules.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1688705414.sql](sql/1688705414.sql), lines 1-83; SHA-256 `c20daeca1816f7e30d1ff931a1f0eec06ed8bd7eccf7b0ed85ca9308301326bf`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.IsWorkZoneAuthorized

Test a work-profile/zone association with NULL-zone allowance.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1784705756.sql](sql/1784705756.sql), lines 1-35; SHA-256 `035a9a8e5ff73606a157d9281f451844957ddf369ea10440a3f7e84534843279`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.ITMfn_CalcQtyForReqUm

Convert quantity using matched original/requested UM factors with location/item/class fallback.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1816705870.sql](sql/1816705870.sql), lines 1-145; SHA-256 `0299d93edc38fb585f8ec11a5b4d4147f0a9334e64675e2e49abb8eb0746eb4c`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.LABORCONFIGfn_RtrvDesc

Resolve a labor/work description from work type or localized identifier.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/2088706839.sql](sql/2088706839.sql), lines 1-31; SHA-256 `7a26922e22e0973ccecad3add524cc2bdbf5bfaf32252667e43f731b6f3ad4dd`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.LBLfn_Checkdigit_86_BarnesAndNobles

Calculate the coded alternating-weight label check value.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/101223761.sql](sql/101223761.sql), lines 1-60; SHA-256 `4210f5a09d6685c0c49b5d78fe7b906ceff839d55309bc784475cd8708baac38`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.METAfn_GetNextScreenControlSequence

Suggest the next screen-control sequence as current maximum plus25.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/341224616.sql](sql/341224616.sql), lines 1-26; SHA-256 `3175de7db0f59b7a0ecab279941cdf212922708e71c82cda0fa2338c92f46805`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.METAfn_GetScreenControl

Resolve screen-control identity within a named form group.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/357224673.sql](sql/357224673.sql), lines 1-32; SHA-256 `0c44b1f8250192c5ace16d5b9436450e14c4124044bdd1dddd2ca0d040d5a9b4`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.METAfn_GetScreenGroup

Resolve screen-group identity through form, screen and part metadata.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/373224730.sql](sql/373224730.sql), lines 1-35; SHA-256 `7e06a28402de584f802b0e9834fd18d5a110880482b668d5af68252ac29fa3c5`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.ModifyCharacterSeparatedStringList

Merge unique string-list entries then remove selected values using XML parsing.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1349228207.sql](sql/1349228207.sql), lines 1-75; SHA-256 `10206e05fa7e7da53011045400dc9012b8ba7a0aafcd4583517c662056cf6118`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.ModifyCommaSeparatedStringList

Merge unique string-list entries then remove selected values using XML parsing.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1365228264.sql](sql/1365228264.sql), lines 1-77; SHA-256 `4af9be2299d23a2c7e0492778b21b37b5c4b0443502b4dd5d541bcd1f0ba7210`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.RPTfn_GetBOLStopNum

Return shipment ordinal within ordered load rows for a coded master-BOL type.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/945750772.sql](sql/945750772.sql), lines 1-78; SHA-256 `39746dfc1fad63ccc44b42915a33302bda0e7b9e13712c5c853a997727224462`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.RPTfn_GetCommentText

Build document-qualified comment text up to a bounded length.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/961750829.sql](sql/961750829.sql), lines 1-74; SHA-256 `673d84c0164e9b58791ae586aff4c9cba82290af4429ad218ab1a5cc94ea4b6b`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.RPTfn_GetInvoiceNumberText

Concatenate distinct INVOICE values for one shipment/load.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/977750886.sql](sql/977750886.sql), lines 1-59; SHA-256 `6aaf3ad83791297612d2b886057a9d0a3c63098d205d2355ffb8f3a5778b63b4`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.RPTfn_GetLocInvSernText

Concatenate reportable serial numbers from current and archive-named tables.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/993750943.sql](sql/993750943.sql), lines 1-107; SHA-256 `6538d56a546441646c10f40fcd6869ea5b2d10370e6e0cba93d0a37b6967a7e4`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.RPTfn_GetMultiStopBOLNums

Format numbered BOL entries for distinct load stop/BOL pairs.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1009751000.sql](sql/1009751000.sql), lines 1-61; SHA-256 `6b5d7ffdabf0f3577a425601ec77c7e85f74bd2b722127322c8f1766b484fc0b`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.RPTfn_GetPurchaseOrderText

Concatenate distinct CUSTOMER_PO values for one shipment/load.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1025751057.sql](sql/1025751057.sql), lines 1-59; SHA-256 `0d2756c982ee42f2d4b414f5bd40e0d90f811a3eac90f7120819c669e0e17df7`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.RPTfn_GetShipContSernText

Concatenate reportable serial numbers from current and archive-named tables.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1041751114.sql](sql/1041751114.sql), lines 1-99; SHA-256 `437e907f7bbaead0de1a9eaa24cc81f9472f9786b4882e956e735cb7af91a1fa`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.RPTfn_GetUnderlyingBOLNums

Concatenate distinct BOL_NUM_ALPHA values for one shipment/load.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1057751171.sql](sql/1057751171.sql), lines 1-56; SHA-256 `ff3ef86c68022e867cfb2f3473b85dc71a165b72c3c8aafb78160b88cde68db0`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.RSCMfn_RtrvMsg

Retrieve a message through configured language and custom/base fallback.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1089751285.sql](sql/1089751285.sql), lines 1-68; SHA-256 `f146f8b0a419fda4a5f0592c24548c9b1cb2394cf5ac6a1899bd3885ba339288`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.RSCMfn_RtrvResource

Retrieve resource text with custom/base/language fallback.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1105751342.sql](sql/1105751342.sql), lines 1-88; SHA-256 `7c9d25958f7928d70de4fa85be0750c5061fdf8f1adce770b2bbda19071c55bc`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.SCI_DST_CONVERT

Convert assumed UTC time using the email-matched user default warehouse zone.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1185751627.sql](sql/1185751627.sql), lines 1-27; SHA-256 `f6a3eff734ab05e0a1902be18072c6dd12349a55ddc460c5d735bcb75a504041`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.SCI_DST_CONVERT_WHSE

Convert assumed UTC time using an argument that is itself a timezone name.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1201751684.sql](sql/1201751684.sql), lines 1-29; SHA-256 `4a9d907fcc88d07d9957fe9b24c53a23ac34f75e4fc63b9c5dd2d029f0f28d06`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.SDBfn_GetLeadingStsInRange

Return the status immediately preceding the first zero or status at/above994.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1489752710.sql](sql/1489752710.sql), lines 1-64; SHA-256 `d983babb35bd0186e33e7bd52de87bb136df6fa7c95f0e69dd67fe6ff180efbe`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.SDBfn_GetLeadingStsPos

Find the occupied prefix length of ten status slots before the first zero.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/87319721.sql](sql/87319721.sql), lines 1-53; SHA-256 `75e24dc32c022b49e9ae1ef8259d6a4d7d20e7a212ea0bd93e502da409a3ff2a`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.SDBfn_GetPosOfSts

Find the first of ten status slots equal to a requested status.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/103319778.sql](sql/103319778.sql), lines 1-54; SHA-256 `a4febbe1bba3d81e14f75bba057704a27156923f7567c51ba6d3f7db929eb747`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.SDBfn_GetQtyAtSts

Return quantity from the first status slot matching a requested status.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/119319835.sql](sql/119319835.sql), lines 1-65; SHA-256 `cec4f35d23749ea41dedc0b5bde42cb091103e5ace76558bfdb19ac3c53c9af1`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.SecurityPermissionEnabled

Check requested checkpoint characters using a specific fallback order and permissive missing-data result.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1569752995.sql](sql/1569752995.sql), lines 1-59; SHA-256 `3cd8783e1bf1f78e777d09764a9d7d0cb6f8a169a07198898e86c81b660b0e5e`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.SHfn_LastIndexOf

Find the last occurrence of a pattern using repeated CHARINDEX.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/167320006.sql](sql/167320006.sql), lines 1-37; SHA-256 `e993837bbab916348402720bc453587024822c5decc3dbf08b7c78f6d75f1c35`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.SHIPCONTfn_RtrvCurrentLocation

Derive one current location from a container subtree or its immediate contents.

Domains: shipping, integration.

- utility_transform: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1585753052.sql](sql/1585753052.sql), lines 1-56; SHA-256 `305665728201896ae9fb4bec8a76c789f8066ff0a60665d9b4ac868777f09b2f`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.SHIPCONTfn_RtrvItemContentsCount

Count item-bearing rows immediately associated with a shipping container.

Domains: shipping, integration.

- utility_transform: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/183320063.sql](sql/183320063.sql), lines 1-13; SHA-256 `8cd31ecdf574fb0a9e559bf3502d773c66e31f1581c9da79412749ccacbb40bb`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.STSfn_RtrvAdjacentSts

Find numerically adjacent status in a custom or default flow.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/2097754876.sql](sql/2097754876.sql), lines 1-80; SHA-256 `37c643687b36d5dd0a7c222b996c4821e3723e0ee9c355e2a2eaf348f4e0b4b5`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.STSfn_RtrvSts

Resolve a system status name to a numeric functional-area status.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/199320120.sql](sql/199320120.sql), lines 1-32; SHA-256 `798df960ce7117d9a12671aa5b4862e86d1a4ffb5dc0f4ac4101d756def6a97e`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.STSfn_RtrvStsForAction

Map a functional-area action to a configured numeric status.

Domains: receiving_shipping.

- utility_transform: Resolves supplied context into a scalar using configuration. Evidence: E1.

E1: [DB Architecture/sql/2113754933.sql](sql/2113754933.sql), lines 1-49; SHA-256 `554a8cd67dceb9ecaa61f3ce2864629bce9628df5e8a8a7e53de3fd3194ed2ac`. Complete module body reviewed with original-definition fingerprint.

Limits: Body-level review; caller authority, effective data, runtime and complete process semantics remain external.


## dbo.STSfn_RtrvStsName

Resolve a numeric functional-area status to its stored display name.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/2129754990.sql](sql/2129754990.sql), lines 1-24; SHA-256 `506d9632b31e9f2c080c0534f30d3ccac129455bfe0b613fba0995904d4123f4`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.TimeOnly

Retain datetime time on SQL base date.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/621245268.sql](sql/621245268.sql), lines 1-9; SHA-256 `b551352bc82aaa939f4b6c3134e53e2d406c7deba12117db928bc832f3c0b1fd`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.TpmOrderContainerStatus_TrackingLink

Substitute a tracking number into a fixed tracking-link placeholder.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/94271741.sql](sql/94271741.sql), lines 1-13; SHA-256 `4764cebe0c5829f3da03b13b2a8fdc8064dcb61796741f83f5649f7bc2fd0e12`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.WRTRV_RtrvUniqueWorkUnit

Suggest a work-unit name using configured delimiter and incremented suffix.

Domains: function_semantics.

- utility_transform: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1386800348.sql](sql/1386800348.sql), lines 1-71; SHA-256 `9b3b5f343d15a7c27bd88f1a9ffad44ef2d349cf0b209b9ff361e5671f2e31f9`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.GENfn_SplitString

Split and trim nonempty tokens with generated ordinal-like IDs.

Domains: function_semantics.

- reporting_read_model: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/760702108.sql](sql/760702108.sql), lines 1-24; SHA-256 `be36fb3ce73fe73a074c709ca5a39936c32c4bd36904deeb01fcfd98f3e03a9d`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.ALC_UpdateShipAllocReqFP

Choose item-unit conversion metadata for allocated shipment requests in a wave.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/1834801944.sql](sql/1834801944.sql), lines 1-142; SHA-256 `04f74553073971af9cd383ea7375c6cbe1ab33c0582ef70ae70f6a0e98e60838`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.CancelWave_DeallocationOfRepReq

Reverse source allocated and destination in-transit quantities for a replenishment request, with history calls.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/988178916.sql](sql/988178916.sql), lines 1-153; SHA-256 `ebda03e703ec6002f5089f4de170ea826e869e8ff12073e97c88abdd75be220c`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.CancelWave_UpdateOrderHeader

Invoke shipment order-header cancellation helper for each wave shipment.

Domains: allocation_wave_replenishment.

- orchestration: Calls the recorded mutation/statistics/history helper; no direct persistent DML. Evidence: E1.

E1: [DB Architecture/sql/1004178973.sql](sql/1004178973.sql), lines 1-48; SHA-256 `4c4b6ab7e27a4b9286b12f2150cbd04589c2fd668574656ca257082c648b0c63`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.CancelWave_UpdateShipLdSts

Recompute remaining load statuses then detach a wave from its loads.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/1020179030.sql](sql/1020179030.sql), lines 1-62; SHA-256 `a235ff8adf4c9e93b36f33b94731d69df3337b6adc6ba3be731de055b1719f13`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.CheckSecurityPermission

Produce a security-migration permission mismatch report through a persistent staging table.

Domains: labor, yard, administration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/1260179885.sql](sql/1260179885.sql), lines 1-120; SHA-256 `3a7152c88007566a73bc3c23eac5138d07a7d9ef6563361d7fb04f57e1526949`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.CompleteWave_UpdateContSts

Set a single container status.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/1276179942.sql](sql/1276179942.sql), lines 1-23; SHA-256 `28ea81593bbdc47d8b840e297ad407494b3d430a7927a1567255400ada249ac8`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.CompleteWave_UpdateDtlSts

Set a single shipment detail first status.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/1292179999.sql](sql/1292179999.sql), lines 1-24; SHA-256 `076603d6073ca9c7cdfa326726c4df77482142976e66645e73d62409e19aecb4`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.CompleteWave_UpdateHdrSts

Apply independently optional leading/trailing shipment statuses.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/1308180056.sql](sql/1308180056.sql), lines 1-54; SHA-256 `e1bc1e7760c9c2e8c25c2ca71e2aa01e69e9371bce443b51871f2bea7d661022`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.CompleteWave_UpdateOdrDtlCond

Replace order-line condition and open quantity from selected wave shipment history slots.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/1324180113.sql](sql/1324180113.sql), lines 1-47; SHA-256 `b5dce494366abfcc2734de0791fbee747c75861e1c8cb67a3624cd9179ae8586`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.CompleteWave_UpdateOdrHdrCond

Assign an order-header condition and current condition timestamp.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/1340180170.sql](sql/1340180170.sql), lines 1-30; SHA-256 `e2b4af66378327687a5f34123e503468e68f934e15b3107a03915a3ad9a3d1e8`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.CompleteWave_UpdateShipLdSts

Apply asymmetric supplied load-status progression rules.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/1356180227.sql](sql/1356180227.sql), lines 1-37; SHA-256 `33ef3191963ae79f10b57d789626dafb99df5a75b998b78a8fc062def77b723d`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.DAS_SplitAllocsAcrossToLocs

Split an allocation request quantity to another destination location.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/1388180341.sql](sql/1388180341.sql), lines 1-85; SHA-256 `61dfbb007648170cefd1052c9b49f50ae8eabba8451fbe66384cf9ac2af81718`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.DAS_UpdateAllocsToLoc

Change one allocation destination and its location-derived metadata.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/1404180398.sql](sql/1404180398.sql), lines 1-41; SHA-256 `a527bc32567208f0db3b03322552712a641464e33d1f204d7cf5715405f4ff9a`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.DAS_UpdateContsAllocNum

Assign a shipping container to an allocation number.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/1420180455.sql](sql/1420180455.sql), lines 1-32; SHA-256 `ffb6ed3845e8400798570d52d8201e9fb387c8840d38ce40735d9059c2b152f7`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.DASH_CaptureDashboardData

Append planned/actual receipt or shipment snapshot pairs, with retention and expiration gating.

Domains: performance_billing_maintenance.

- transactional_mutation: Append planned/actual receipt or shipment snapshot pairs, with retention and expiration gating. Evidence: E1.

E1: [DB Architecture/sql/1436180512.sql](sql/1436180512.sql), lines 1-97; SHA-256 `4051064c7062a0de172b44170a26887c352da6e472b6f2eb072de8f8b9db6f12`. Complete module body reviewed with original-definition fingerprint.

Limits: Static body review only: no live rows, execution, caller identity, active deployment, timing or business acceptance were observed.


## dbo.DASH_GetKPIData

Refresh and return one dashboard area, while updating expiration metadata across warehouses.

Domains: performance_billing_maintenance.

- transactional_mutation: Refresh and return one dashboard area, while updating expiration metadata across warehouses. Evidence: E1.
- orchestration: After updating expiration metadata, conditionally invokes an area refresher and returns the corresponding dashboard result sets; caller transaction and actual runtime behavior remain unverified. Evidence: E1.

E1: [DB Architecture/sql/1452180569.sql](sql/1452180569.sql), lines 1-243; SHA-256 `368426eee16389cec8d8f755cd3294d72fb3c3ceb1637c6a0f53ae18852596c3`. Complete module body reviewed with original-definition fingerprint.

Limits: Static body review only: no live rows, execution, caller identity, active deployment, timing or business acceptance were observed.


## dbo.DASH_GetLaborKPIData

Pivot stored labor dashboard values for one warehouse.

Domains: labor, yard, administration.

- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.
- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1468180626.sql](sql/1468180626.sql), lines 1-34; SHA-256 `d1d992ab90844e4cbe2b4e3e6b78a32dd1ec7994e5bf38ff4ae647e4259f774b`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.DASH_GetReceivingKPIData

Read cached receiving dashboard KPIs without refreshing them.

Domains: performance_billing_maintenance.

- reporting_read_model: Read cached receiving dashboard KPIs without refreshing them. Evidence: E1.

E1: [DB Architecture/sql/1484180683.sql](sql/1484180683.sql), lines 1-88; SHA-256 `91569309c7c9c0e0b1b5258f3f0e518748e051f91db151dcb0a459a26d3dc265`. Complete module body reviewed with original-definition fingerprint.

Limits: Static body review only: no live rows, execution, caller identity, active deployment, timing or business acceptance were observed.


## dbo.DASH_GetShippingKPIData

Read cached shipping dashboard KPIs without refreshing them.

Domains: performance_billing_maintenance.

- reporting_read_model: Read cached shipping dashboard KPIs without refreshing them. Evidence: E1.

E1: [DB Architecture/sql/1500180740.sql](sql/1500180740.sql), lines 1-103; SHA-256 `e3efc0f1f898eb46c685b4c87a6041d738ca5575d1ed3739e97d32b1a817b232`. Complete module body reviewed with original-definition fingerprint.

Limits: Static body review only: no live rows, execution, caller identity, active deployment, timing or business acceptance were observed.


## dbo.DASH_GetWorkKPIData

Read cached work dashboard KPIs without refreshing them.

Domains: performance_billing_maintenance.

- reporting_read_model: Read cached work dashboard KPIs without refreshing them. Evidence: E1.

E1: [DB Architecture/sql/1516180797.sql](sql/1516180797.sql), lines 1-43; SHA-256 `7c3be4a907964bf5089a8c296b2876ba0057d652484a0183e450ef53c081da47`. Complete module body reviewed with original-definition fingerprint.

Limits: Static body review only: no live rows, execution, caller identity, active deployment, timing or business acceptance were observed.


## dbo.DASH_RefreshInboundData

Initialize or refresh the receiving dashboard cache identifier set.

Domains: performance_billing_maintenance.

- transactional_mutation: Initialize or refresh the receiving dashboard cache identifier set. Evidence: E1.

E1: [DB Architecture/sql/1532180854.sql](sql/1532180854.sql), lines 1-111; SHA-256 `7b87fd482468f23947a100209cdb0c254c8d67ff3a68d17cac08e05be12a85dc`. Complete module body reviewed with original-definition fingerprint.

Limits: Static body review only: no live rows, execution, caller identity, active deployment, timing or business acceptance were observed.


## dbo.DASH_RefreshLabor

Refresh selected stored labor dashboard indicators.

Domains: labor, yard, administration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/1548180911.sql](sql/1548180911.sql), lines 1-142; SHA-256 `7dedd3092fc7168cbc66aef35fd238537daa124f1b516a67e6df40d674c97829`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.DASH_RefreshOutboundData

Initialize or refresh the shipping dashboard cache identifier set.

Domains: performance_billing_maintenance.

- transactional_mutation: Initialize or refresh the shipping dashboard cache identifier set. Evidence: E1.

E1: [DB Architecture/sql/1564180968.sql](sql/1564180968.sql), lines 1-109; SHA-256 `62d3742469277b64f4739ec7aaa5932cdadf7e80aa5e82534b1f0e47c5de5a91`. Complete module body reviewed with original-definition fingerprint.

Limits: Static body review only: no live rows, execution, caller identity, active deployment, timing or business acceptance were observed.


## dbo.DASH_RefreshWorkData

Initialize or refresh the work dashboard cache identifier set.

Domains: performance_billing_maintenance.

- transactional_mutation: Initialize or refresh the work dashboard cache identifier set. Evidence: E1.

E1: [DB Architecture/sql/1580181025.sql](sql/1580181025.sql), lines 1-142; SHA-256 `17493deb322cbede626f07469f4441ad9c1a7fe23ba29c70b4a1e5b0b03f0444`. Complete module body reviewed with original-definition fingerprint.

Limits: Static body review only: no live rows, execution, caller identity, active deployment, timing or business acceptance were observed.


## dbo.DASH_UpdateKPIData

Refresh dashboard expiration metadata, then conditionally call an area refresher under a fixed application-lock resource.

Domains: performance_billing_maintenance.

- transactional_mutation: Refresh dashboard expiration metadata, then conditionally call an area refresher under a fixed application-lock resource. Evidence: E1.
- orchestration: Coordinates a conditional area refresh with application-lock acquisition and release. Only lock return 0 enters the refresh/release branch; the global expiration update precedes it. Evidence: E1.

E1: [DB Architecture/sql/1596181082.sql](sql/1596181082.sql), lines 1-87; SHA-256 `5d7032242fca0bd9c7033fe0d6cf5958c146663141801c921f0da09dd0f077b6`. Complete module body reviewed with original-definition fingerprint.

Limits: No app lock or refresher was executed. Actual caller transaction, lock lifecycle, contention, timeout and deployment behavior remain unverified. Engine reference: https://learn.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-getapplock-transact-sql?view=sql-server-ver17


## dbo.dba_AddForeignKeyConstraint

Add a foreign key when no globally same-named FK exists.

Domains: performance_billing_maintenance.

- orchestration: Add a foreign key when no globally same-named FK exists. Evidence: E1.

E1: [DB Architecture/sql/1632724869.sql](sql/1632724869.sql), lines 1-31; SHA-256 `d7e408d2ffb9a30a03048aa5cbcba9e3d2193e69ee76d8ba3336da8a0432bb41`. Complete module body reviewed with original-definition fingerprint.

Limits: Dynamic target names are supplied by the caller and are not resolved to a deployed target in this review. Permission, actual target, DDL-trigger and dependency effects remain execution-context gaps. No DDL was executed.


## dbo.dba_DropColumn

Drop a column and its default bindings, then conditionally recurse using prefix logic with a second-test/target mismatch.

Domains: performance_billing_maintenance.

- orchestration: Drop a column and its default bindings, then conditionally recurse using prefix logic with a second-test/target mismatch. Evidence: E1.

E1: [DB Architecture/sql/1616724812.sql](sql/1616724812.sql), lines 1-60; SHA-256 `4dcba91818434675c2f243c1ae1079d4d36dc960c1586f1ab0bc6da1b908113a`. Complete module body reviewed with original-definition fingerprint.

Limits: Dynamic target names are supplied by the caller and are not resolved to a deployed target in this review. Permission, actual target, DDL-trigger and dependency effects remain execution-context gaps. No DDL was executed.


## dbo.dba_DropDefaultKeyConstraint

Resolve and drop a column's default constraint through constructed ALTER TABLE.

Domains: performance_billing_maintenance.

- orchestration: Resolve and drop a column's default constraint through constructed ALTER TABLE. Evidence: E1.

E1: [DB Architecture/sql/1600724755.sql](sql/1600724755.sql), lines 1-28; SHA-256 `325625cc4fcf0a4bff4a8e39384624a609843f6dc57a3e0a277b79c39ff4c824`. Complete module body reviewed with original-definition fingerprint.

Limits: Dynamic target names are supplied by the caller and are not resolved to a deployed target in this review. Permission, actual target, DDL-trigger and dependency effects remain execution-context gaps. No DDL was executed.


## dbo.dba_DropForeignKeyConstraint

Drop a named foreign-key constraint from a supplied table when a same-named FK exists.

Domains: performance_billing_maintenance.

- orchestration: Drop a named foreign-key constraint from a supplied table when a same-named FK exists. Evidence: E1.

E1: [DB Architecture/sql/1584724698.sql](sql/1584724698.sql), lines 1-28; SHA-256 `f400f056f14c51990f6066a5d02b2934851356d90d556af24c8524b7a1a77314`. Complete module body reviewed with original-definition fingerprint.

Limits: Dynamic target names are supplied by the caller and are not resolved to a deployed target in this review. Permission, actual target, DDL-trigger and dependency effects remain execution-context gaps. No DDL was executed.


## dbo.dba_DropIndex

Drop an existing named index and recurse into a related prefixed table.

Domains: performance_billing_maintenance.

- orchestration: Drop an existing named index and recurse into a related prefixed table. Evidence: E1.

E1: [DB Architecture/sql/1866802058.sql](sql/1866802058.sql), lines 1-20; SHA-256 `7ace8acbc5d1d29a731719567cb8fcb8bfa29b057585d771c099606cffaa5917`. Complete module body reviewed with original-definition fingerprint.

Limits: Dynamic target names are supplied by the caller and are not resolved to a deployed target in this review. Permission, actual target, DDL-trigger and dependency effects remain execution-context gaps. No DDL was executed.


## dbo.dba_RenameTable

Rename a name-matched current-database object through sp_rename.

Domains: performance_billing_maintenance.

- orchestration: Rename a name-matched current-database object through sp_rename. Evidence: E1.

E1: [DB Architecture/sql/1660181310.sql](sql/1660181310.sql), lines 1-23; SHA-256 `b7c23daf3c1d4758389fa66a593f412530d2961baa90cc5f98808db5550ad96f`. Complete module body reviewed with original-definition fingerprint.

Limits: Dynamic target names are supplied by the caller and are not resolved to a deployed target in this review. Permission, actual target, DDL-trigger and dependency effects remain execution-context gaps. No DDL was executed.


## dbo.dba_UpdateIndex

Replace an index with a supplied key/include specification and recurse into a related table.

Domains: performance_billing_maintenance.

- orchestration: Replace an index with a supplied key/include specification and recurse into a related table. Evidence: E1.

E1: [DB Architecture/sql/1882802115.sql](sql/1882802115.sql), lines 1-37; SHA-256 `8020d94c32c8d6e8f0e65a90a559fbde5a6a97676ed4e0446127f191983533b1`. Complete module body reviewed with original-definition fingerprint.

Limits: Dynamic target names are supplied by the caller and are not resolved to a deployed target in this review. Permission, actual target, DDL-trigger and dependency effects remain execution-context gaps. No DDL was executed.


## dbo.dbc_IActionMenu

Seed an action-menu definition.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert only if neither MENU_NAME nor DESCRIPTION already matches. The OR guard can suppress a new menu name merely because its description is already used. Evidence: E1.

E1: [DB Architecture/sql/1708181481.sql](sql/1708181481.sql), lines 1-61; SHA-256 `b591547ee9a4aa395514d1d0212847e840eb0605dbc526dbfc3db53a785d673d`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IActionMenuOption

Add a sequenced action or separator to a menu.

Domains: administration, configuration, presentation.

- transactional_mutation: For NULL actionName keep actionId NULL; otherwise resolve it by name. Resolve menu ID, then insert if that menu/sequence pair is absent. Evidence: E1.

E1: [DB Architecture/sql/1724181538.sql](sql/1724181538.sql), lines 1-79; SHA-256 `a79be4748e07d08c1d18aaf050be75b566efed48c686b647dbf096ec375d7e7e`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IBatchSubmissionConfig

Seed a batch-submission record-type definition.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert schedule eligibility, optional description and parameter text only when RECORD_TYPE is absent. No scheduled job or batch is submitted. Evidence: E1.

E1: [DB Architecture/sql/1820181880.sql](sql/1820181880.sql), lines 1-63; SHA-256 `2e2722e54abdfd7d6186741d484f023176349218267d8ed1fc512f47bfb4182b`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IConfigForm

Seed a configuration form and its checkpoint definitions.

Domains: administration, configuration, presentation.

- orchestration: Create the form through dbc_IForm; add title/help resources; call checkpoint helper for IDs 1 through 6 in that order. The systemCreated input is unused. Evidence: E1.

E1: [DB Architecture/sql/1914802229.sql](sql/1914802229.sql), lines 1-79; SHA-256 `cc71ecc5d813cbf7d135a5581bba58209d824ab03c8903023391b5dd68b918b7`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IDataRetrievalStmtHeader

Seed a data-retrieval statement header.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert the statement header key, description, calculation flag and external-source flag only if STMT_HEADER_KEY_NUM is absent. No query body or external source is executed. Evidence: E1.

E1: [DB Architecture/sql/1836181937.sql](sql/1836181937.sql), lines 1-66; SHA-256 `b32fb3d435df077cda7fc434fb4f3d138f83d666bf6a23b511a9da39855ce9f1`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IDockMgrGridCustomization

Insert a missing dock-grid customization for a configured perspective.

Domains: labor, yard, administration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/1852181994.sql](sql/1852181994.sql), lines 1-75; SHA-256 `fb30c88764b63faebb2f38107d28e3eb75f5c3a15c8516c5c8c995137bbce84a`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.dbc_IDynamicAction

Seed a dynamic-action definition bound to an endpoint.

Domains: administration, configuration, presentation.

- transactional_mutation: Resolve endpoint OBJECT_ID using a fixed opaque RECORD_TYPE and the caller identifier. Insert action fields only if ACTION_NAME is absent. Evidence: E1.

E1: [DB Architecture/sql/1884182108.sql](sql/1884182108.sql), lines 1-79; SHA-256 `b39032bd478feb33486bcc5306de5875a992cb0cfda39a65a17d6e0f76b5b712`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IDynamicActionRule

Append a condition to a dynamic action.

Domains: administration, configuration, presentation.

- transactional_mutation: Resolve ACTION_ID by action name and unconditionally insert a rule containing table, column, operator, literal-value and conjunction metadata. There is no duplicate guard. Evidence: E1.

E1: [DB Architecture/sql/1900182165.sql](sql/1900182165.sql), lines 1-67; SHA-256 `007d9cf10b4f75e9d59348c571183f77b1072e03fd65d9602ea76b3007381a93`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IDynamicCallingDetail

Seed an application endpoint description.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert only if RECORD_TYPE and IDENTIFIER are absent. Store local/remote code references, URI, transforms, operation and message metadata. ENDPOINT_TYPE defaults to numeric 1. Evidence: E1.

E1: [DB Architecture/sql/1916182222.sql](sql/1916182222.sql), lines 1-105; SHA-256 `0685e5db616688ba9177e96eec024fa30152ee99b10abcb89c1b6efc63c2a25e`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IDynamicCallingHeader

Seed an endpoint record-type header.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert one header with supportedEndpointTypes only when RECORD_TYPE is absent. Existing headers remain unchanged. Evidence: E1.

E1: [DB Architecture/sql/1932182279.sql](sql/1932182279.sql), lines 1-38; SHA-256 `8e687c505e16b00aea6c4cf174a0623ebb1ea84f59393efb7f643a6c9093daea`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IExitPoint

Seed an exit-point definition.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert active flag, description, category and optional execution identifier only when EXIT_POINT is absent. This stores a hook definition without invoking it. Evidence: E1.

E1: [DB Architecture/sql/1948182336.sql](sql/1948182336.sql), lines 1-64; SHA-256 `83ba3bbbf81221fbe42846926807aed364a83df642886461bcce50d850523d3b`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IExitPointCategory

Seed an exit-point category.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert category and description only when the category key is absent; stamp UTC time and coded creator fields. Evidence: E1.

E1: [DB Architecture/sql/1946802343.sql](sql/1946802343.sql), lines 1-33; SHA-256 `ecd5dcd6ff750841a886f6adae91aee493471d5476a058005181ad4727819de2`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IExitPointDetail

Seed one ordered parameter of an exit point.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert parameter name, DB type, output-direction flag and sequence only if EXIT_POINT plus SEQUENCE is absent. Evidence: E1.

E1: [DB Architecture/sql/1964182393.sql](sql/1964182393.sql), lines 1-64; SHA-256 `465dc69d5db1815a7a7d0c8bfa0ed56e3cf68ef82390ef534b4dab8fa7f26fad`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IFeatureManagement

Insert or update a feature-management setting.

Domains: administration, configuration, presentation.

- transactional_mutation: If feature name is absent, insert enabled/release/process fields with created and modified UTC times and print an opaque message. Otherwise update ENABLED, PRODUCT_RELEASE, DATE_TIME_STAMP and PROCESS_STAMP for matching names. removed is unused. Evidence: E1.

E1: [DB Architecture/sql/1980182450.sql](sql/1980182450.sql), lines 1-40; SHA-256 `a3d4063bc6df142fcf0439cfd27ad8bf5d5292bb2f943ba35a55aa8f65de3daf`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IFilterAttributes

Seed a filter-attribute definition.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert display flag, field type, optional record type and validation-list name only if ATTRIBUTE is absent. Evidence: E1.

E1: [DB Architecture/sql/1996182507.sql](sql/1996182507.sql), lines 1-65; SHA-256 `9eccc3fdc47784344b93d9c69a2a736680e7b70b7817f31bcfecb2c1093e699f`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IFilterConfigDetail

Seed a named filter for a record type.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert optional full filter text and active/description metadata only when RECORD_TYPE plus FILTER_NAME is absent. Evidence: E1.

E1: [DB Architecture/sql/1962802400.sql](sql/1962802400.sql), lines 1-66; SHA-256 `509da87fb8cf9e09307cd25f36eca5edd9195806c79e679b24887d62da286368`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IFilterConfigHeader

Seed a filter record-type definition.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert description, data-object path, optional join/table/value-table names and matching/order flags only if RECORD_TYPE is absent. Evidence: E1.

E1: [DB Architecture/sql/1978802457.sql](sql/1978802457.sql), lines 1-75; SHA-256 `837bec565498c48f1f476b26ad6def16221d3988f98a080f1c8b7df53a005040`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IFilterStatement

Seed an ordered filter-expression term.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert term attributes, operand, optional value/conjunction/parenthesis counts only if RECORD_TYPE, FILTER_NAME and SEQUENCE are absent. Evidence: E1.

E1: [DB Architecture/sql/1994802514.sql](sql/1994802514.sql), lines 1-77; SHA-256 `3e6d2b72c77ce3990f63c3ea63804ea5fa9d8e30eaddb66ab8c5e1c3202ff341`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IForm

Seed the base form definition.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert the form key, parent/table bindings, generator/security flags and optional object/associated-form identifiers only if FORM_ID is absent. Evidence: E1.

E1: [DB Architecture/sql/2012182564.sql](sql/2012182564.sql), lines 1-65; SHA-256 `d6f1e1a551d4f123e3a19d4ba9bbf8b5a8b6238bab7841004fbc96990eac9b56`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IFunctionalAreaStatusFlow

Seed one status-flow definition for a functional area.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert change/default-flow/mandatory flags, numeric status and optional related/system status only when FUNCTIONAL_AREA plus status is absent. Evidence: E1.

E1: [DB Architecture/sql/2010802571.sql](sql/2010802571.sql), lines 1-75; SHA-256 `c60e909f4d585a654692589eb9a89fc4ecfe6a51d1574ed15ee2fa51efd14700`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IGenericConfigDetail

Insert or replace generic configuration detail fields.

Domains: administration, configuration, presentation.

- transactional_mutation: If recordType/identifier exists, update description, system flag, all five system values, eight user values, active flag and stamps; otherwise insert those fields. An omitted optional value therefore clears the matching existing field to NULL. Evidence: E1.

E1: [DB Architecture/sql/2026802628.sql](sql/2026802628.sql), lines 1-108; SHA-256 `787fc7552c1632d12fffcb3ee862192e09ab81d01ea194d8041858f9880e28de`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IGenericConfigForm

Seed a generic-configuration form and checkpoints.

Domains: administration, configuration, presentation.

- orchestration: Call form helper; store title under formKeyName and help under the separate helpResourceKey; register checkpoint IDs 1 through 6. systemCreated input is unused. Evidence: E1.

E1: [DB Architecture/sql/2053582354.sql](sql/2053582354.sql), lines 1-86; SHA-256 `bf52955d4e3ae16c3d0fa430621935c84abbfefe5dc7cd79de4eee1bbe75aa4b`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IGenericConfigHeader

Insert or replace generic configuration field definitions.

Domains: administration, configuration, presentation.

- transactional_mutation: Branch on RECORD_TYPE existence. Update or insert description, system flag, all five system and eight user field definitions including names/types/lookups/required flags, then stamp the change. Evidence: E1.

E1: [DB Architecture/sql/2042802685.sql](sql/2042802685.sql), lines 1-255; SHA-256 `1cc19b146e76042f668465bb9fc1e76c25b1d17559a74d10da0b821bace98ae1`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_ILookupReference

Seed lookup metadata and optionally its resource text.

Domains: administration, configuration, presentation.

- orchestration: Insert table/field/type/warehouse/active metadata if RECORD_TYPE, TABLE_NAME and CONFIG_RECORD_TYPE match no existing row. Afterwards call the resource helper if recordTypeText is non-NULL, regardless of whether insertion was skipped. Evidence: E1.

E1: [DB Architecture/sql/2108182906.sql](sql/2108182906.sql), lines 1-143; SHA-256 `e41bd6a942faa0c5f91295000687f543fb045508ebdbc7e6fe7906bb57082d46`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IMainUiScreen

Seed a main-UI screen definition subject to existing screen counts.

Domains: administration, configuration, presentation.

- transactional_mutation: Count rows for FORM_ID plus fixed opaque system/active selectors; when positive, replace the input active flag with another coded value. Attempt insertion only when the correlated aggregate guard does not find COUNT(*) greater than 1 for that form. Evidence: E1.

E1: [DB Architecture/sql/2124182963.sql](sql/2124182963.sql), lines 1-105; SHA-256 `8132e6c957040ce527763c47397163e4bec96660a357689fe99edee73f4946db`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IMainUiTemplate

Seed a main-UI template definition.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert active/description/template metadata only if TEMPLATE is absent; preserve existing templates. Evidence: E1.

E1: [DB Architecture/sql/2140183020.sql](sql/2140183020.sql), lines 1-63; SHA-256 `d62db712ef9355749a50c6c950df8b49cf6a33605c9a72bfcde75893a248285f`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IMainUiTemplateFunGrpXref

Associate an existing main-UI template with a functional group.

Domains: administration, configuration, presentation.

- transactional_mutation: Select every template matching TEMPLATE; insert each missing functional-group/template-object pair. An absent template produces no inserted row; existing links are preserved. Evidence: E1.

E1: [DB Architecture/sql/8699429.sql](sql/8699429.sql), lines 1-62; SHA-256 `2e076e1f1eb2994a855aa3e58ee09fc40050459ccdbd0448b623baa820e46f07`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IMainUiWmLicenseXref

Associate screen definitions for a form with a license module.

Domains: administration, configuration, presentation.

- transactional_mutation: Select all MAIN_UI_SCREEN rows for FORM_ID; insert each missing screen-object/license-module/advanced tuple. It can process several screens for one form. Evidence: E1.

E1: [DB Architecture/sql/24699486.sql](sql/24699486.sql), lines 1-69; SHA-256 `257012b40dc256a6359fab0116a98a2246673253d679fe443a1c24f9e8828bc4`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IMainUiWmLicenseXrefOriginal

Associate one screen identity with a license module.

Domains: administration, configuration, presentation.

- transactional_mutation: Select MAIN_UI_SCREEN by OBJECT_ID; insert a missing screen/license-module/advanced tuple. The similar non-Original routine instead selects all screens for a form. Evidence: E1.

E1: [DB Architecture/sql/40699543.sql](sql/40699543.sql), lines 1-65; SHA-256 `2fec9184e7b74d491156bd25af60fd5c1b6c9b9e1c3444bd55f6edb6cfaa0177`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IMetadataDetailsForm

Seed a metadata details form and screen registration.

Domains: administration, configuration, presentation.

- orchestration: Compose form key from fixed opaque fragments and abbreviation; add form/title/help/checkpoint 1; compose lowercased-abbreviation path; register pathType 6, menu flag, restrictions/defaults identifiers; add two menu resources. Evidence: E1.

E1: [DB Architecture/sql/2021582240.sql](sql/2021582240.sql), lines 1-88; SHA-256 `e95eaafaabc5f8857b43fc8ec36a54e24e3abfc1d7aff0fdc8de6b7a5d37950b`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IMetadataInsightForm

Seed an Insight metadata form and screen registration.

Domains: administration, configuration, presentation.

- orchestration: Register form, title/help resources and checkpoint 1; compose a screen path with opaque prefix plus formId text; register pathType 6 and menu flag; add two menu resource entries. Evidence: E1.

E1: [DB Architecture/sql/2005582183.sql](sql/2005582183.sql), lines 1-80; SHA-256 `7156d25990cb14efed9a61e6ac2b67361c89e1f21b7070d80df2b65de32a8aca`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IMetadataTransactionForm

Seed a metadata transaction form and screen registration.

Domains: administration, configuration, presentation.

- orchestration: Compose a form key from opaque prefix/suffix and abbreviation; add form, title/help resources and checkpoint 1. Compose a path using a fixed prefix and lowercased abbreviation; register pathType 6 with restrictions/defaults/menu flags; add two menu resources; call checkpoint 1 again and checkpoint 3. Evidence: E1.

E1: [DB Architecture/sql/1989582126.sql](sql/1989582126.sql), lines 1-91; SHA-256 `ac3b2cb3de8632ab53a8cc88f04651d3893cdf2735aba6b73599dd8d27a27722`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IProcessForm

Seed metadata and one security checkpoint for a process form.

Domains: administration, configuration, presentation.

- orchestration: Call dbc_IForm with a NULL table binding and caller systemDbScreen/objectIdentifier. Add title and help resources, then checkpoint 1. The formId parameter here is numeric(4), narrower than the numeric(5) helper. Evidence: E1.

E1: [DB Architecture/sql/136699885.sql](sql/136699885.sql), lines 1-63; SHA-256 `bca533586f7beca41bc103c469f0d55f70ec0dd1bd840733ad5ee541eabc87b9`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IRateWeightBreakDtl

Insert an exact minimum/maximum range under an existing named rate weight-break header.

Domains: performance_billing_maintenance.

- transactional_mutation: Insert an exact minimum/maximum range under an existing named rate weight-break header. Evidence: E1.

E1: [DB Architecture/sql/152699942.sql](sql/152699942.sql), lines 1-66; SHA-256 `c902ad302af70b0de107f639a92e93f34bb17a24525de2e5bc7d6735f0f49b76`. Complete module body reviewed with original-definition fingerprint.

Limits: Static body review only: no live rows, execution, caller identity, active deployment, timing or business acceptance were observed.


## dbo.dbc_IRateWeightBreakHdr

Insert a named rate weight-break header only when its name is absent.

Domains: performance_billing_maintenance.

- transactional_mutation: Insert a named rate weight-break header only when its name is absent. Evidence: E1.

E1: [DB Architecture/sql/168699999.sql](sql/168699999.sql), lines 1-63; SHA-256 `75353b3a2aaa8f9904facc069abb3aae515182ac8f6d190ee47bb54351f8d44e`. Complete module body reviewed with original-definition fingerprint.

Limits: Static body review only: no live rows, execution, caller identity, active deployment, timing or business acceptance were observed.


## dbo.dbc_IResourceFileBase

Seed base resource text and report conflicting existing text.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert a missing language/group/key. If no row is inserted, read existing text/process stamp; when supplied text compares unequal, build an error and RAISERROR at severity 18/state 1. Existing text is never updated. Evidence: E1.

E1: [DB Architecture/sql/2058802742.sql](sql/2058802742.sql), lines 1-69; SHA-256 `79779ec7839fea11894d3b7f829770af515ca1ccd11f1705de84065ddf7f4e65`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IScreenControl

Seed a named screen control within a screen group.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert control type, optional data source, state, action, CSS, label and template settings if CONTROL_NAME plus SCREEN_GROUP_ID is absent. No control is rendered or action executed. Evidence: E1.

E1: [DB Architecture/sql/264700341.sql](sql/264700341.sql), lines 1-100; SHA-256 `b7f1469f61bf566dc6173e743bfe7dcdeb9450f2e19e3a953506e325a062ee0b`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IScreenControlAttributes

Seed a control attribute and optional token fields.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert active/property flags, attribute value and ten token fields if SCREEN_CONTROL_ID, ATTRIBUTE_NAME and ATTRIBUTE_VALUE do not already match. A new value for an existing attribute name may add another row. Evidence: E1.

E1: [DB Architecture/sql/280700398.sql](sql/280700398.sql), lines 1-382; SHA-256 `ee7aaa36ed53d2a027d833b25b5943ef04955d4a51bca0a003cc274f6b166476`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IScreenControlEvent

Seed a screen-control event registration.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert event ID/name, optional grid column and active flag if EVENT_ID plus SCREEN_CONTROL_ID is absent. Evidence: E1.

E1: [DB Architecture/sql/296700455.sql](sql/296700455.sql), lines 1-67; SHA-256 `661e041f8c7a2f69ebf659d994f7a2e560a6306bae28343f06f84689cc8b7be8`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IScreenControlEventParameters

Seed one named parameter for a control event.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert parameter name/value and active flag if PARAMETER_NAME plus SCREEN_CONTROL_EVENT_ID is absent. Evidence: E1.

E1: [DB Architecture/sql/312700512.sql](sql/312700512.sql), lines 1-64; SHA-256 `05a2633bc8df8982129b4685418e18f1221ea5a2824c42aba2b6e494616d5c71`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IScreenControlGridColumns

Seed a grid-column definition with edit and binding metadata.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert field, display/edit/binding/sort settings when screen-control ID, normalized FIELD, normalized FIELD_NAME and SQL_CLAUSE_TYPE have no match. FIELD and FIELD_NAME comparisons replace NULL with numeric 0 through ISNULL. Stamp with GETDATE, not GETUTCDATE. Evidence: E1.

E1: [DB Architecture/sql/328700569.sql](sql/328700569.sql), lines 1-105; SHA-256 `a13a940fb1e1c070497b5ba6c79d307959a50a34d768c4e635f8af147953ef9d`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IScreenGroup

Seed a named screen group within a screen part.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert type, nesting, sequence, style, fixed-position and content-loading settings if GROUP_NAME plus SCREEN_PART_ID is absent. contentLoadingType defaults to numeric 0. Evidence: E1.

E1: [DB Architecture/sql/344700626.sql](sql/344700626.sql), lines 1-98; SHA-256 `4179d7332b263cea9d1c20df3011a9ad5fe903f4a0b149f7f2ac707c00ff9378`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IScreenGroupColumn

Seed a layout column within a screen group.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert column name, optional CSS and sequence when COLUMN_NAME plus SCREEN_GROUP_ID is absent. Evidence: E1.

E1: [DB Architecture/sql/360700683.sql](sql/360700683.sql), lines 1-63; SHA-256 `a0843b0748243052721fff7daa1d78c8ce2e154241e65d45e73ebc2dfcd89a0f`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IScreenPart

Seed a named part within a screen.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert part type, sequence, active/partial-view flags and optional style/action/resource metadata if PART_NAME plus SCREEN_ID is absent. Evidence: E1.

E1: [DB Architecture/sql/376700740.sql](sql/376700740.sql), lines 1-84; SHA-256 `6c1094b9823450557b2fadb0243dea2e98e07e83a8a158343ed385512922dff7`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_ISecurity

Insert a missing security assignment keyed by form, level and username.

Domains: labor, yard, administration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/392700797.sql](sql/392700797.sql), lines 1-81; SHA-256 `52e5d012ca3d3634ba7436e40f232df9990986a941003b499026ee277c62bb66`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.dbc_ISecurityCheckpoint

Insert a missing security checkpoint registration.

Domains: labor, yard, administration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/408700854.sql](sql/408700854.sql), lines 1-43; SHA-256 `e3a53f9dc32a5c735258033367aa186a16807a1bf2d9ee92285a9052fcf4f64d`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.dbc_ISecurityGroup

Insert a missing security group.

Domains: labor, yard, administration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/544720993.sql](sql/544720993.sql), lines 1-38; SHA-256 `38b23608a9608c6a318e980a79c453f9ce5cb0c4d3bfa466801522779d0f3158`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.dbc_ISystemConfigDetail

Seed one system configuration value.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert key, record type, description, supplied value, optional lookup and value-required flag only when SYS_KEY plus RECORD_TYPE is absent. Evidence: E1.

E1: [DB Architecture/sql/488701139.sql](sql/488701139.sql), lines 1-49; SHA-256 `e7e91fc3151d797df5337f00db6ddcf83ed1f143a56798c9806725bba82b481a`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_ISystemConfigHeader

Seed a system-configuration record-type header.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert recordType, description, system flag and stamps only when RECORD_TYPE is absent. Evidence: E1.

E1: [DB Architecture/sql/2074802799.sql](sql/2074802799.sql), lines 1-34; SHA-256 `7cbb8e2811a5f72afc6d25605975e9c0d4252f0213d25f36634416d206e1af4a`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IViewerForm

Seed a viewer form, resources, screen entry and security checkpoints.

Domains: administration, configuration, presentation.

- orchestration: Call form helper, viewer-template helper with engineType 0 and header/detail binding fields, title/help resources, checkpoints 1/21/22, main-UI screen helper, then two menu resources. The screen menuResourceKey is the mnemonic-key argument. Evidence: E1.

E1: [DB Architecture/sql/1957582012.sql](sql/1957582012.sql), lines 1-105; SHA-256 `275e4c92c1aa295e78892c2dc5fc9a54fc508dae9199e36d8335bcf6498f1159`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IViewerTemplate

Seed viewer header/detail data bindings for a form.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert engine type, header data source and optional detail/header link fields if FORM_ID is absent. Evidence: E1.

E1: [DB Architecture/sql/504701196.sql](sql/504701196.sql), lines 1-69; SHA-256 `46403b4b49d9b5cad0e8a58da9629182f52994aeabc9841d056f141c53a81b1f`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.dbc_IWebScreenDataHeader

Seed a web-screen header and its code/binding metadata.

Domains: administration, configuration, presentation.

- transactional_mutation: Insert company, screen type, parent, URL, code/method references and maxNumFields if SCREEN_NAME is absent. maxNumFields defaults 0. Evidence: E1.

E1: [DB Architecture/sql/520701253.sql](sql/520701253.sql), lines 1-85; SHA-256 `a0e96ea38cac538644dbaa9bc1200cf076c8113cb7739acbd4b1d7516611ff46`. Complete retained body reviewed; all string literals remain opaque.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.DeleteUserProfileReferences

Delete selected user-profile references and append a deletion activity record.

Domains: labor, yard, administration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/568701424.sql](sql/568701424.sql), lines 1-23; SHA-256 `cd532e390b24b1eafa31a8cbe112bf08c34051992ffe408a5078cbc3d88a3336`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.Get_LaborActivityGroupsForConsolidation

Assign candidate consolidation group identifiers to selected labor records.

Domains: labor, yard, administration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/776702165.sql](sql/776702165.sql), lines 1-76; SHA-256 `9acbf82e26c6b92ca246c1893c2145472bac16aeb4548e2f4d36e1d496fcad4b`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.GetIntraDayLaborProgressActiveEmployees

Estimate active employees from their latest eligible consolidated labor record.

Domains: labor, yard, administration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/904702621.sql](sql/904702621.sql), lines 1-54; SHA-256 `bff5d5667f9ee823543c5afd9ed82fffeeb2baf65e1925aa3a3accbd284c8928`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.GetIntraDayLaborProgressWorkDetails

Estimate intraday workload, completions, active users and hours by work type.

Domains: labor, yard, administration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/920702678.sql](sql/920702678.sql), lines 1-270; SHA-256 `23bd57d825fd973754f126160037931abcdd63fda7d2ae1edac4ced564750e63`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.GetShippingLabelImage

Retrieve stored outbound and returns label images.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/968702849.sql](sql/968702849.sql), lines 1-25; SHA-256 `b930acfbbbaf54dcdcbc3f2fbd7db8235474da5324809a621f04680d2ca55fc7`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.HIST_LocationInvForCancelledWave

Return aggregated inventory/allocation snapshots for cancellation history consumers.

Domains: allocation_wave_replenishment.

- reporting_read_model: Returns the stated context/aggregate/output projection; not process execution. Evidence: E1.

E1: [DB Architecture/sql/1032703077.sql](sql/1032703077.sql), lines 1-58; SHA-256 `c09a4a805b07c76023645304cc78e12fe5210c909404b0c73809f6ee3ee88315`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.INT_ErrorInsightDetailPaneData

Retrieve an interface-error detail pane.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1112703362.sql](sql/1112703362.sql), lines 1-21; SHA-256 `8a5d30ac4125a5bed42f645adcd7cea0ca399bf77b0eedca9499dd93110d12d6`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.INV_AdjustInv

Coordinates selected quantity and serial effects for an inventory transaction.

Domains: inventory.

- orchestration: Sequences reviewed conditional calls and selected result/error handling. Evidence: E1.

E1: [DB Architecture/sql/1128703419.sql](sql/1128703419.sql), lines 40-251; SHA-256 `b77007a8973b5368936124674524c79420b1816c140e116f148a722f5a6696ce`. Reviewed signature, ordered branches and explicit effects; nested and caller limits remain.

Limits: Role does not establish live invocation or complete caller/nested-helper review.


## dbo.INV_ArchiveSerialNumbers

Copies serial records to history before conditionally removing active records.

Domains: inventory.

- transactional_mutation: Explicit persistent writes occur in reviewed body; child-only effects remain separate. Evidence: E1.

E1: [DB Architecture/sql/1144703476.sql](sql/1144703476.sql), lines 11-54; SHA-256 `04dd003e9e71b5835e433bb4d09046ce0bfd11ea201ffa3bad6b7299ebf88dc0`. Reviewed signature, ordered branches and explicit effects; nested and caller limits remain.

Limits: Role does not establish live invocation or complete caller/nested-helper review.


## dbo.INV_CheckLocThreshold

Evaluates activity-driven count thresholds after source quantity changes.

Domains: inventory.

- transactional_mutation: Explicit persistent writes occur in reviewed body; child-only effects remain separate. Evidence: E1.
- orchestration: Sequences reviewed conditional calls and selected result/error handling. Evidence: E1.

E1: [DB Architecture/sql/1160703533.sql](sql/1160703533.sql), lines 4-205; SHA-256 `1723eed69b74a258bec467e61523165fb454c8a3088169c068050265307c7065`. Reviewed signature, ordered branches and explicit effects; nested and caller limits remain.

Limits: Role does not establish live invocation or complete caller/nested-helper review.


## dbo.INV_InsertLotAttributes

Converts lot-attribute arguments into stored attribute rows.

Domains: inventory.

- transactional_mutation: Explicit persistent writes occur in reviewed body; child-only effects remain separate. Evidence: E1.

E1: [DB Architecture/sql/1256703875.sql](sql/1256703875.sql), lines 17-55; SHA-256 `a1a3c696a9ef59cbeb3bd70f6a1a07ad5d2b91da8542a0667d0440d40c07fee5`. Reviewed signature, ordered branches and explicit effects; nested and caller limits remain.

Limits: Role does not establish live invocation or complete caller/nested-helper review.


## dbo.INV_LaunchCancelWithReplenish

Clean zero-quantity inventory identities at wave replenishment destinations.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/1288703989.sql](sql/1288703989.sql), lines 1-71; SHA-256 `ed2fe8a5b640dee867ac779ff92f01f46bff25d77f71c1856ebd85974aa73f4f`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.INV_PickFromLocation

Changes source inventory quantities and coordinates empty-row, lot, count-threshold and history effects.

Domains: inventory.

- transactional_mutation: Explicit persistent writes occur in reviewed body; child-only effects remain separate. Evidence: E1.
- orchestration: Sequences reviewed conditional calls and selected result/error handling. Evidence: E1.

E1: [DB Architecture/sql/1400704388.sql](sql/1400704388.sql), lines 82-828; SHA-256 `75f63d082a4062e9b815f5797a8c53d333828c5cf2bec75cea0e22c978d999d2`. Reviewed signature, ordered branches and explicit effects; nested and caller limits remain.

Limits: Role does not establish live invocation or complete caller/nested-helper review.


## dbo.INV_PickSerialNumbers

Unlinks selected serial records from source inventory and location containers.

Domains: inventory.

- transactional_mutation: Explicit persistent writes occur in reviewed body; child-only effects remain separate. Evidence: E1.

E1: [DB Architecture/sql/1416704445.sql](sql/1416704445.sql), lines 15-69; SHA-256 `e763924616e0e97b2f8d56b00a30978cb815a76741550b7a1e65fefd04d9e535`. Reviewed signature, ordered branches and explicit effects; nested and caller limits remain.

Limits: Role does not establish live invocation or complete caller/nested-helper review.


## dbo.INV_ProcessLotInNewInventory

Creates a missing lot identity and attaches supplied lot attributes.

Domains: inventory.

- transactional_mutation: Explicit persistent writes occur in reviewed body; child-only effects remain separate. Evidence: E1.
- orchestration: Sequences reviewed conditional calls and selected result/error handling. Evidence: E1.

E1: [DB Architecture/sql/1432704502.sql](sql/1432704502.sql), lines 17-113; SHA-256 `3f5cd7b8b517b41c09ea4cb9df5422be5f94fd61aa93668b0dca27ea12d2b261`. Reviewed signature, ordered branches and explicit effects; nested and caller limits remain.

Limits: Role does not establish live invocation or complete caller/nested-helper review.


## dbo.INV_ProcessLotWhenEmptyingInv

Copies eligible empty-lot records and attributes to history, then removes active rows.

Domains: inventory.

- transactional_mutation: Explicit persistent writes occur in reviewed body; child-only effects remain separate. Evidence: E1.

E1: [DB Architecture/sql/1448704559.sql](sql/1448704559.sql), lines 22-175; SHA-256 `ab5e0948a8c84b089c949d96817e91f33021fc81cbdd87f6809a36893826964d`. Reviewed signature, ordered branches and explicit effects; nested and caller limits remain.

Limits: Role does not establish live invocation or complete caller/nested-helper review.


## dbo.INV_PutIntoLocation

Creates or updates destination inventory and transfers, copies or cleans up unit-of-measure records.

Domains: inventory.

- transactional_mutation: Explicit persistent writes occur in reviewed body; child-only effects remain separate. Evidence: E1.
- orchestration: Sequences reviewed conditional calls and selected result/error handling. Evidence: E1.

E1: [DB Architecture/sql/1464704616.sql](sql/1464704616.sql), lines 102-1234; SHA-256 `8986ffa4b9635c50100e3f8b6b00a2b4a29f3cc25f0f8357337d80ac760579de`. Reviewed signature, ordered branches and explicit effects; nested and caller limits remain.

Limits: Role does not establish live invocation or complete caller/nested-helper review.


## dbo.INV_PutSerialNumbers

Associates selected serial records with destination inventory.

Domains: inventory.

- transactional_mutation: Explicit persistent writes occur in reviewed body; child-only effects remain separate. Evidence: E1.

E1: [DB Architecture/sql/1480704673.sql](sql/1480704673.sql), lines 14-48; SHA-256 `e74eed30a9c38f95239e7174a80c3a36689bca0de3ecdc49c5eacb4a55752a1d`. Reviewed signature, ordered branches and explicit effects; nested and caller limits remain.

Limits: Role does not establish live invocation or complete caller/nested-helper review.


## dbo.INV_RtrvRplnLocCapacity

Resolve replenishment capacity through item/location and class/type fallback queries.

Domains: allocation_wave_replenishment.

- reporting_read_model: Returns the stated context/aggregate/output projection; not process execution. Evidence: E1.

E1: [DB Architecture/sql/23319493.sql](sql/23319493.sql), lines 1-106; SHA-256 `43396e6c7991646988e2f6da79d277b3b24d29a13de5bb00f596bc96abdafb50`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.INV_ValidateSerialNums

Checks selected serial groups against quantity for qualifying transactions.

Domains: inventory.

- utility_transform: Validates serial argument context/quantity without explicit persistent writes. Evidence: E1.

E1: [DB Architecture/sql/1608705129.sql](sql/1608705129.sql), lines 15-104; SHA-256 `70213db8195a3b7768feef0636aea877a4a94807ac056c4de7dcbaeb68f836be`. Reviewed signature, ordered branches and explicit effects; nested and caller limits remain.

Limits: Role does not establish live invocation or complete caller/nested-helper review.


## dbo.LBR_MonitorLaborGroupsChartData

Select warehouse labor-group workload and recent completion indicators.

Domains: labor, yard, administration.

- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.
- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/117223818.sql](sql/117223818.sql), lines 1-89; SHA-256 `93c622b315fc4dcbdf6006546cde463309058d804eba14eab47f3bc5295890c2`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.LBR_MonitorLaborIndicatorTiles

Select one coded labor indicator tile and its critical-level result.

Domains: labor, yard, administration.

- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.
- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/133223875.sql](sql/133223875.sql), lines 1-87; SHA-256 `40372014f3159eec989f741a27af84749eacd97693dcf845684ca931b60e41d6`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.LBR_MonitorLaborUsersChartData

Select assigned-user workload within one warehouse, labor group and work type.

Domains: labor, yard, administration.

- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.
- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/149223932.sql](sql/149223932.sql), lines 1-105; SHA-256 `8c5deceb5b8392979deeda348fe3f2fd1fd85ba43593c6fea4f9827c2a1f12b2`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MarkLocationforReplenishment

Mark a real-time-replenishment location for evaluation and request process history.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/197224103.sql](sql/197224103.sql), lines 1-81; SHA-256 `9679de63cd615ef991516e9773f4585ae32206e2750c961ea4bf9d47f7da03f6`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.MetadataTransActiveWavesForWarehouse

List wave statistics rows considered active by last-step emptiness.

Domains: allocation_wave_replenishment.

- reporting_read_model: Returns the stated context/aggregate/output projection; not process execution. Evidence: E1.

E1: [DB Architecture/sql/277224388.sql](sql/277224388.sql), lines 1-20; SHA-256 `078f574b4af65d9ecb99e380d1a95a950fc80cf8a5c335a065148bfb29808400`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.MetaTrans_ApptSchedule

Supply the appointment-scheduling presentation seed.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/405224844.sql](sql/405224844.sql), lines 1-18; SHA-256 `f47ea8e881cad32ce9c7a84d574c93486a4903ff028faa66f6cbc40718a7fec9`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_BuildWave

Provide initial wave dialog context; no wave creation in this body.

Domains: allocation_wave_replenishment.

- reporting_read_model: Returns the stated context/aggregate/output projection; not process execution. Evidence: E1.

E1: [DB Architecture/sql/421224901.sql](sql/421224901.sql), lines 1-18; SHA-256 `84cef4b66e9066dbf4d14640b889b32ef010c53becf0707af9e099d13978e300`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.MetaTrans_CloseManifest

Prepare manifest-close presentation options.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/437224958.sql](sql/437224958.sql), lines 1-44; SHA-256 `f4fd13543fdeaf35d58f0405162b5e2d51ff59573924aab194c5ecb98dbbbcb1`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_CycleCountQuickPlan

Prepare cycle-count quick-plan fields from two fixed configuration selections.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/453225015.sql](sql/453225015.sql), lines 1-74; SHA-256 `b9918f115ea89a54cf2e63d052f7f519282d5450df86757b3545640a0e789417`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_DbTableInfo

Describe columns for the object named by a screen-control attribute.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/485225129.sql](sql/485225129.sql), lines 1-55; SHA-256 `97218f5392e526f300a80e1c6e373ec7d5b10f7993a1b8ac4fc23c48eb665ab7`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_DockLocationTransfer

Prepare container and shipment context for a dock-location transfer screen.

Domains: labor, yard, administration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/501225186.sql](sql/501225186.sql), lines 1-61; SHA-256 `3a17e72847a3330f8f96977b6e44ae17b314474996e20fbe0567825c5d75e6b3`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.METATRANS_GetBillOfMaterialDetails

Return bill-of-material detail with item tracking and location-inventory context.

Domains: labor, yard, administration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/517225243.sql](sql/517225243.sql), lines 1-41; SHA-256 `e53da17201f345ceff382eac7efd0f7161e0d3019dc8e511ed4a3ac083d33ca2`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetConsolidateShipment

Retrieve a shipment summary for a consolidation flow.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/549225357.sql](sql/549225357.sql), lines 1-50; SHA-256 `3c0eb5b70eb6e9ed3a7dedec067bc761802149fd9d1c69c5c97281891c2e29aa`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetCycleCountMasterPlan

Prepare cycle-count master-plan defaults from scalar configuration lookups.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/565225414.sql](sql/565225414.sql), lines 1-21; SHA-256 `63a0b69eca099c7cab0e8f127ac4ce3b7121e19361ce7a7e4bce98344a218251`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetItem

Select one item description for an item and optional company context.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/677225813.sql](sql/677225813.sql), lines 1-26; SHA-256 `d03f23192e0fad4c348b4958e3be83e0ffbdfd60612f4be0b340736c8c991ff3`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetItemsForReceiptFromPO

Select positive-open purchase-order lines with the ordinary receipt company predicate.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/693225870.sql](sql/693225870.sql), lines 1-42; SHA-256 `64f3074b40be9465ea1a18623d0e04870369cda9010be6442b2f478a68bad468`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetItemsForTpmReceiptFromPO

Select positive-open purchase-order lines for the TPM receipt presentation.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/709225927.sql](sql/709225927.sql), lines 1-31; SHA-256 `6864b7e5532ab71305861994ec8e23130c63c15b0d860e114c6d10f03a2cafaa`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetLocatingZones

List locating-zone codes and descriptions under two fixed coded filters.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/725225984.sql](sql/725225984.sql), lines 1-22; SHA-256 `a6d369eceb8f0b562d5c173b4fdd4330d2f17bc0eda63d3f7924f34fec50f278`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetLocationInventory

Return location-inventory context after a shipment-named helper call.

Domains: presentation, selection, configuration.

- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.
- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/757226098.sql](sql/757226098.sql), lines 1-27; SHA-256 `5964e05ca822965aadec38fd8a8a8e3c1e09c46d1a91ca978ca6f66e66f722ea`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetLocationTypes

List location types and physical dimensions under a fixed active predicate.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/741226041.sql](sql/741226041.sql), lines 1-23; SHA-256 `a5e9106f37a4111b00b1bc22647ae6a574ba12cd1858991de94b754d98e29c9b`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetLookup

Return lookup-field definitions and passed warehouse presentation values.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/773226155.sql](sql/773226155.sql), lines 1-60; SHA-256 `6e814eb187167bb0834a3d5c5ca93128ff6612f0c61facce014a305a4859add0`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetLotUpdateAffectedInventory

Show inventory rows affected by an item/lot context without changing them.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/789226212.sql](sql/789226212.sql), lines 1-51; SHA-256 `c50ea83c8db9a9f892d11f0f3c2ff774040578edf5372c8a909a6645f2d3c8c4`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetLotUpdateConfirmation

Prepare a lot-change confirmation display from existing lot context.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/837226383.sql](sql/837226383.sql), lines 1-47; SHA-256 `6cab67c7a1b2cf7006c02f2f2468e51a687010663d964fd9e84cf0c1066e0dcc`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetMonitoringBuilderModel

Supply five monitoring-builder metadata result sets.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/869226497.sql](sql/869226497.sql), lines 1-51; SHA-256 `906f47f5af041484e2931989e79b784d35c64c787154494c17be7edf3389a2bb`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetNewWave

Provide initial wave dialog context; no wave creation in this body.

Domains: allocation_wave_replenishment.

- reporting_read_model: Returns the stated context/aggregate/output projection; not process execution. Evidence: E1.

E1: [DB Architecture/sql/885226554.sql](sql/885226554.sql), lines 1-29; SHA-256 `0012ba65a4622ba563c1ab0a8bd37f358c15b6d18e087ee48389f89724672730`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.MetaTrans_GetPrintSelectedDocuments

Select print context, user printers and eligible document types.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/901226611.sql](sql/901226611.sql), lines 1-300; SHA-256 `5e4b1a969339ecb9c4eb7ad07570b13ff9cc514233bf15e2bc889f2706dd583f`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetReceiptFromPO

Select purchase-order header context for receipt presentation.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/933226725.sql](sql/933226725.sql), lines 1-36; SHA-256 `fa87aecaae4ef175c302a33f900dc11d15dcd982f4be9935bb8d058510bd30e8`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetShipmentDetailsForCreateReceipt

Select shipment detail quantities for create-receipt presentation.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/949226782.sql](sql/949226782.sql), lines 1-29; SHA-256 `7a91794f9ae2a658cb76b5f3f9e4d88772572014de5b6447bbf315c077f1e759`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetShipmentForCreateReceipt

Select shipment header context for create-receipt presentation.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/965226839.sql](sql/965226839.sql), lines 1-41; SHA-256 `d24436e1be732a34a25c9899c20c246735790da208d21058a708445113b1a5e0`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetTpmReceiptFromPO

Select purchase-order header context for TPM receipt presentation.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/981226896.sql](sql/981226896.sql), lines 1-50; SHA-256 `3edd484685e34be712e850d00e376f695b7580db6848475313429ef49ed250d9`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetTrailerDetails

Prepare trailer-entry context from a receipt header.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/997226953.sql](sql/997226953.sql), lines 1-43; SHA-256 `6b23f5c10af2636a2fe5fcc8d113f600c479255a99b489022484fdfcecd18740`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetTransferContainer

Supply container-transfer context in three result sets.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1013227010.sql](sql/1013227010.sql), lines 1-57; SHA-256 `c60c42f21524b76895db0c6d46eb6b0cf3126b30f06657114061b63f20328854`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetTransferShipment

Supply shipment-transfer context after a security-info helper.

Domains: presentation, selection, configuration.

- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.
- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1029227067.sql](sql/1029227067.sql), lines 1-45; SHA-256 `553beea9a10b7fa47a5d7eb41b7bfd4a7ed471c31460285df391162d91464bf6`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_GetTransferShipmentDetail

Select joined shipment-header/detail context for a transfer line.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1045227124.sql](sql/1045227124.sql), lines 1-39; SHA-256 `50ef54708e3a1344fd6f21736567ddc9c9aa954efe21c8c5cb665ab8adc2d2ee`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_IndirectLaborWorkbenchLog

Prepare fixed presentation values for a labor activity entry screen.

Domains: labor, yard, administration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1061227181.sql](sql/1061227181.sql), lines 1-26; SHA-256 `9cf4511b5d6cc8285735d74442bacb5f817a7a2e225c0361380a4e504da3f05c`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_ManualLaborActivityLog

Prepare fixed presentation values for a labor activity entry screen.

Domains: labor, yard, administration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1077227238.sql](sql/1077227238.sql), lines 1-35; SHA-256 `b0116ffb09dd95a772066f0d5db2df218368bcb9cfe07715a9174b536b0c5a9f`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_ManualReplenishment

Supply a localized manual-replenishment presentation seed.

Domains: presentation, selection, configuration.

- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.
- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1093227295.sql](sql/1093227295.sql), lines 1-15; SHA-256 `5bb245395a2a7584994a3ee169bb7cac0b6120844d3dc566c1770d70fbf21c75`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_NewWave

Provide initial wave dialog context; no wave creation in this body.

Domains: allocation_wave_replenishment.

- reporting_read_model: Returns the stated context/aggregate/output projection; not process execution. Evidence: E1.

E1: [DB Architecture/sql/916198314.sql](sql/916198314.sql), lines 1-25; SHA-256 `b733884bdf89d5f58d4785f71dc7da49e12c6b1f500ed1450adbc295ef229fc2`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.MetaTrans_Packing

Prepare packing presentation options, security display values and two configuration lists.

Domains: presentation, selection, configuration.

- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.
- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1109227352.sql](sql/1109227352.sql), lines 1-77; SHA-256 `736df22832cd0bf57f0cf670fd86afd57f26e414ec5185530d9e111325a617e7`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_ReprintWaveDocs

Prepare document reprint context for a wave.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1141227466.sql](sql/1141227466.sql), lines 1-24; SHA-256 `2a9c4a205d4664eb31d5b05e2c4e1e371ce4226e52e3b8e93e62c818e5e8f0bf`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_ReprintWaveLabels

Prepare label reprint context for a wave.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1157227523.sql](sql/1157227523.sql), lines 1-29; SHA-256 `7766e5f3b22064864bd42044700f4d547fecefd60f01de0fbe491e32bafebbbf`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_ShipmentLevelManifesting

Prepare shipment-level manifesting context.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1173227580.sql](sql/1173227580.sql), lines 1-48; SHA-256 `7cbd2d550140b4a15d02fd563ec97f67640d9bc12f2211eab5035bc42db6abc0`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_ShipmentSelection

Select shipment records sharing the selected shipment identifier and warehouse.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1189227637.sql](sql/1189227637.sql), lines 1-34; SHA-256 `87e02bfb47b9ffc5544cfbc4b8f95847a7cd140d41eb26de0f32a792c7185723`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_ShippingContainerQC

Prepare outbound QC preferences, security checkpoint values and lookup lists.

Domains: shipping, integration.

- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.
- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1205227694.sql](sql/1205227694.sql), lines 1-86; SHA-256 `aad03af2d2969904b5975d7ff2a5a7e7e8e584e3874ede1de2017bfb74404295`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_SignBOL

Supply the bill-of-lading signature presentation seed.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1221227751.sql](sql/1221227751.sql), lines 1-22; SHA-256 `e64d0333057afccec991467d857e3cee263c9c5108503b8a7bd8edbe427b2eb5`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_SinglesPacking

Supply the singles-packing presentation seed and localized label.

Domains: presentation, selection, configuration.

- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.
- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1237227808.sql](sql/1237227808.sql), lines 1-26; SHA-256 `95d0dc7bf38d7c17389f0644fdda8d2aef891ebc93fcb238bf507205f0a6ed7e`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_SplitShipment

Prepare header and line selections for a shipment-split screen.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1253227865.sql](sql/1253227865.sql), lines 1-40; SHA-256 `cdc338b776d2f58df9224a594d8444744778020ce179ed572295b17229901c82`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_TpmPersonalViews

Supply the personal-view presentation seed.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1269227922.sql](sql/1269227922.sql), lines 1-13; SHA-256 `968dc080c554ae2bd816ce20ec43bce51ab8c92b60de381825952e84591ba356`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_TpmSubmit

Supply the TPM submission presentation seed.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1285227979.sql](sql/1285227979.sql), lines 1-17; SHA-256 `95c1cd37613b32149b076f3a4337f007eca7fbf764abda510f9830f20c79816f`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_WavePrinterSelection

Prepare printer selection only for an open wave.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1317228093.sql](sql/1317228093.sql), lines 1-27; SHA-256 `72bd2f5e450a76a5c3ce8d92d07acc9ab8448a00b55830b9fea1a620ceda671e`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.MetaTrans_WorkOrderComponentAllocation

Select work-order component allocation context.

Domains: presentation, selection, configuration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1333228150.sql](sql/1333228150.sql), lines 1-35; SHA-256 `c2ea083020fa5398df532d83c72229dbe2ec422362ac5717d20daf4ffcd6571e`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.PM_ReceiptContainer01

Count receipt-container rows at a configured inbound status during the UTC calendar day.

Domains: performance_billing_maintenance.

- reporting_read_model: Count receipt-container rows at a configured inbound status during the UTC calendar day. Evidence: E1.

E1: [DB Architecture/sql/1477228663.sql](sql/1477228663.sql), lines 1-57; SHA-256 `0e337f92aeb4a3dce5ba2dd52a4a74429b947a9acf39cf59b35138f5a099c37f`. Complete module body reviewed with original-definition fingerprint.

Limits: No source rows or effective user/configuration values were observed. Inclusive next-midnight endpoints can overlap adjacent daily reports; no warehouse-local timezone conversion in these report bodies.


## dbo.PM_ShipmentHeader02

Count shipment headers at the configured outbound pool status.

Domains: performance_billing_maintenance.

- reporting_read_model: Count shipment headers at the configured outbound pool status. Evidence: E1.

E1: [DB Architecture/sql/1525228834.sql](sql/1525228834.sql), lines 1-50; SHA-256 `148186ce0a0fcc7b7d2f34531a5afbe258d51ecd2ba11967f98f9f3d628a6bb2`. Complete module body reviewed with original-definition fingerprint.

Limits: No source rows, effective user permissions, process completion or current counts were observed.


## dbo.PM_ShipmentHeader03

Sum shipped-view line totals at a configured outbound status during the UTC calendar day.

Domains: performance_billing_maintenance.

- reporting_read_model: Sum shipped-view line totals at a configured outbound status during the UTC calendar day. Evidence: E1.

E1: [DB Architecture/sql/1541228891.sql](sql/1541228891.sql), lines 1-59; SHA-256 `1f8c50d36ae30ec6fbe156db71d75c6c4d3a1e677241c43c02c5f5899df6170d`. Complete module body reviewed with original-definition fingerprint.

Limits: No source rows or effective user/configuration values were observed. Inclusive next-midnight endpoints can overlap adjacent daily reports; no warehouse-local timezone conversion in these report bodies.


## dbo.PM_ShipmentHeader04

Count shipment headers strictly between configured pool and shipped status boundaries.

Domains: performance_billing_maintenance.

- reporting_read_model: Count shipment headers strictly between configured pool and shipped status boundaries. Evidence: E1.

E1: [DB Architecture/sql/1557228948.sql](sql/1557228948.sql), lines 1-52; SHA-256 `b62df89e9fd5e2e1dd9db416e00c8fd4fa952742bd6cb0965d7789336d34a2d6`. Complete module body reviewed with original-definition fingerprint.

Limits: No source rows, effective user permissions, process completion or current counts were observed.


## dbo.PM_WarehouseAlert

Group processed, still-open warehouse alert requests by alert description and priority.

Domains: performance_billing_maintenance.

- reporting_read_model: Group processed, still-open warehouse alert requests by alert description and priority. Evidence: E1.

E1: [DB Architecture/sql/1573229005.sql](sql/1573229005.sql), lines 1-44; SHA-256 `4da7e1b704475a17b4bf9eff39e69a6f738b00970155c21c5d171f73e7b7328f`. Complete module body reviewed with original-definition fingerprint.

Limits: Static body review only: no live rows, execution, caller identity, active deployment, timing or business acceptance were observed.


## dbo.PM_WorkInstruction02

Count unclosed Detail replenishment instructions within the report warehouse filter.

Domains: performance_billing_maintenance.

- reporting_read_model: Count unclosed Detail replenishment instructions within the report warehouse filter. Evidence: E1.

E1: [DB Architecture/sql/1605229119.sql](sql/1605229119.sql), lines 1-54; SHA-256 `1344470bfb147c09c3fe4e9647bf2445d3566ae5af0582fb2c94e2d337792ed9`. Complete module body reviewed with original-definition fingerprint.

Limits: No source rows, effective user permissions, process completion or current counts were observed.


## dbo.PMN_ActivitySummary

Return six distinct activity summaries over supplied time bounds.

Domains: performance_billing_maintenance.

- reporting_read_model: Return six distinct activity summaries over supplied time bounds. Evidence: E1.

E1: [DB Architecture/sql/1621229176.sql](sql/1621229176.sql), lines 1-59; SHA-256 `60f840c0869d988c7d7a03f60d9d0bfcaa5ad37b971d6e2c83cdea9a4d854817`. Complete module body reviewed with original-definition fingerprint.

Limits: Static body review only: no live rows, execution, caller identity, active deployment, timing or business acceptance were observed.


## dbo.PMN_IndexFragmentation

List index physical-statistics rows for the database ID derived from a supplied name.

Domains: performance_billing_maintenance.

- reporting_read_model: List index physical-statistics rows for the database ID derived from a supplied name. Evidence: E1.

E1: [DB Architecture/sql/1669229347.sql](sql/1669229347.sql), lines 1-23; SHA-256 `d903ea872a09361cee3d003bc56d8be0200a25cdb36b9f69e75c25746e5c16ac`. Complete module body reviewed with original-definition fingerprint.

Limits: No DMV executed and no actual fragmentation measured. Engine behavior reference: https://learn.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-functions/sys-dm-db-index-physical-stats-transact-sql


## dbo.PMN_IndexUsage

Report index-usage counters joined to current-database index metadata.

Domains: performance_billing_maintenance.

- reporting_read_model: Report index-usage counters joined to current-database index metadata. Evidence: E1.

E1: [DB Architecture/sql/1685229404.sql](sql/1685229404.sql), lines 1-22; SHA-256 `dda9927c62eb17e381c1f41b17d00887e5c7930af372b119ecde9d99c5fec176`. Complete module body reviewed with original-definition fingerprint.

Limits: Static body review only: no live rows, execution, caller identity, active deployment, timing or business acceptance were observed.


## dbo.PMN_LoadConfirmActivity

Report activity in thirty-second windows ending at recursively generated sample timestamps.

Domains: performance_billing_maintenance.

- reporting_read_model: Report activity in thirty-second windows ending at recursively generated sample timestamps. Evidence: E1.

E1: [DB Architecture/sql/1701229461.sql](sql/1701229461.sql), lines 1-39; SHA-256 `df3217d599d30e0fae127f35868baea0e3528b5beab4ec06dcb780508185844a`. Complete module body reviewed with original-definition fingerprint.

Limits: Static body review only: no live rows, execution, caller identity, active deployment, timing or business acceptance were observed.


## dbo.PMN_ReceiptsCreatedActivity

Report activity in thirty-second windows ending at recursively generated sample timestamps.

Domains: performance_billing_maintenance.

- reporting_read_model: Report activity in thirty-second windows ending at recursively generated sample timestamps. Evidence: E1.

E1: [DB Architecture/sql/1717229518.sql](sql/1717229518.sql), lines 1-36; SHA-256 `a53e3fb57a6cdb05ff527c4211ed83687b550ad99e03a75dd0ddb0c917e63eb7`. Complete module body reviewed with original-definition fingerprint.

Limits: Static body review only: no live rows, execution, caller identity, active deployment, timing or business acceptance were observed.


## dbo.PMN_ShipmentsCreatedActivity

Report activity in thirty-second windows ending at recursively generated sample timestamps.

Domains: performance_billing_maintenance.

- reporting_read_model: Report activity in thirty-second windows ending at recursively generated sample timestamps. Evidence: E1.

E1: [DB Architecture/sql/1733229575.sql](sql/1733229575.sql), lines 1-37; SHA-256 `862e9d8d1fce3118466fe9d8e01ca8b69e559b904d20dffa5ef6c210b38f5d9f`. Complete module body reviewed with original-definition fingerprint.

Limits: Static body review only: no live rows, execution, caller identity, active deployment, timing or business acceptance were observed.


## dbo.PMN_TableSizes

Return database space-used output and per-table space-used rows.

Domains: performance_billing_maintenance.

- reporting_read_model: Return database space-used output and per-table space-used rows. Evidence: E1.
- orchestration: Calls sp_spaceused for database output, then uses sp_msForEachTable with INSERT EXEC to collect per-table output in a local table variable. This local collection is not persistent user-table mutation. Evidence: E1.

E1: [DB Architecture/sql/1749229632.sql](sql/1749229632.sql), lines 1-27; SHA-256 `26a79b56c4bdab93dbb64540d521c31645dd79998a98b258ca49f8bd6e240e8b`. Complete module body reviewed with original-definition fingerprint.

Limits: No system helper was executed; support/availability of sp_msForEachTable and exact enumeration remain deployment-dependent. No duration or actual table sizes measured.


## dbo.PMN_UserActivity

Sample overlapping user-activity sessions at 30-second intervals.

Domains: labor, yard, administration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1781229746.sql](sql/1781229746.sql), lines 1-36; SHA-256 `cd5f2894d24655e1322419509453f005ffa9222d9be7414907ad0e5148221bc6`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.PMN_WaveActivity

Sample totals of waves active at each thirty-second timestamp.

Domains: performance_billing_maintenance.

- reporting_read_model: Sample totals of waves active at each thirty-second timestamp. Evidence: E1.

E1: [DB Architecture/sql/1797229803.sql](sql/1797229803.sql), lines 1-36; SHA-256 `e7cd393778912f91e93dfbffc03a5e887023db164ef2180bc327bd7cb89abc6b`. Complete module body reviewed with original-definition fingerprint.

Limits: Static body review only: no live rows, execution, caller identity, active deployment, timing or business acceptance were observed.


## dbo.REC_CreateNewUniqueContainerId

Generate a candidate numeric container identifier and update a receipt container row.

Domains: receiving_shipping.

- orchestration: Coordinates ordered status/identifier processing. Evidence: E1.
- transactional_mutation: Writes persistent state and can have effects before later failure. Evidence: E1.

E1: [DB Architecture/sql/2103678542.sql](sql/2103678542.sql), lines 1-59; SHA-256 `bdc04cd2a06b69859e4321248666d20781243da1a4dfbdb896e1d4536d568a1c`. Complete module body reviewed with original-definition fingerprint.

Limits: Body-level review; caller authority, effective data, runtime and complete process semantics remain external.


## dbo.Replenishment_InsightDetailPaneData

Return replenishment detail-pane identity and work/history counts.

Domains: allocation_wave_replenishment.

- reporting_read_model: Returns the stated context/aggregate/output projection; not process execution. Evidence: E1.

E1: [DB Architecture/sql/2085230829.sql](sql/2085230829.sql), lines 1-53; SHA-256 `b766d1cd02e2a90c334acf78045964aa607159aaa860ae6d6d380ae627a509b4`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.RPT_BillOfLadingHeader

Select bill-of-lading header/address context and container-or-detail lines.

Domains: labor, yard, administration.

- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.
- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1747409.sql](sql/1747409.sql), lines 1-483; SHA-256 `f8a689cd3ff373f8d417e55c35efabd701dca460d6a2d7e63b8e6bd26dfdaf63`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.RPT_CSO_AuditLogsLast7DaysCount

Count retained audit headers over a rolling seven-day window.

Domains: performance_billing_maintenance.

- reporting_read_model: Count retained audit headers over a rolling seven-day window. Evidence: E1.

E1: [DB Architecture/sql/1735677231.sql](sql/1735677231.sql), lines 1-8; SHA-256 `752311b1da184612bdd5a7b6d0e6493276210da4074710292c6575bffd08ec5a`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_AuditLogsLast7DaysDetails

Group recent audit-value details by class, method and text.

Domains: performance_billing_maintenance.

- reporting_read_model: Group recent audit-value details by class, method and text. Evidence: E1.

E1: [DB Architecture/sql/1719677174.sql](sql/1719677174.sql), lines 1-11; SHA-256 `21268df399bb3361e71b54834c4e4fb6967af76c0e9157063d8cbd819404ea48`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_DeadlockRecordDetailsLast14Days

List retained audit values matching the fourteen-day deadlock pattern.

Domains: performance_billing_maintenance.

- reporting_read_model: List retained audit values matching the fourteen-day deadlock pattern. Evidence: E1.

E1: [DB Architecture/sql/1703677117.sql](sql/1703677117.sql), lines 1-9; SHA-256 `d0618651c40ae1a94353b769cd6d9373c39e4ee5820c525dc6cdde7758c3e357`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_HighestNbrConcurrentUsrsEver

Sample retained user-activity concurrency hourly from the earliest logon.

Domains: performance_billing_maintenance.

- reporting_read_model: Sample retained user-activity concurrency hourly from the earliest logon. Evidence: E1.

E1: [DB Architecture/sql/1687677060.sql](sql/1687677060.sql), lines 1-40; SHA-256 `0bf2a2fb03dd06a3d7489cf866c8d76d058af3d486e4f3a2e63b388e9b6142d2`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_InventoryRecordsWithEmptyOrNullInventoryStatusCount

Find inventory-status exceptions under specific permanent/location/quantity predicates.

Domains: performance_billing_maintenance.

- reporting_read_model: Find inventory-status exceptions under specific permanent/location/quantity predicates. Evidence: E1.

E1: [DB Architecture/sql/1671677003.sql](sql/1671677003.sql), lines 1-12; SHA-256 `a7f7b7d24f132b88cf21ed5492f8a298f34b4ff046fd4ec8541e0da9b6c43316`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_InventoryRecordsWithEmptyOrNullInventoryStatusDetails

Find inventory-status exceptions under specific permanent/location/quantity predicates.

Domains: performance_billing_maintenance.

- reporting_read_model: Find inventory-status exceptions under specific permanent/location/quantity predicates. Evidence: E1.

E1: [DB Architecture/sql/1655676946.sql](sql/1655676946.sql), lines 1-13; SHA-256 `152f3fd38ae1dd828ee18958d04c21bc1880f728a73610ad22f676f76f092268`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_ItemsWhereAllocatedQtyNotEqualInTransitQtyCount

Compare item/warehouse/company allocated totals with in-transit totals.

Domains: performance_billing_maintenance.

- reporting_read_model: Compare item/warehouse/company allocated totals with in-transit totals. Evidence: E1.

E1: [DB Architecture/sql/1639676889.sql](sql/1639676889.sql), lines 1-15; SHA-256 `a953995538787081045fcafb11c73e3b03583d7cccd8a9c74851d5ad1c445bb9`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_ItemsWhereAllocatedQtyNotEqualInTransitQtyDetails

Compare item/warehouse/company allocated totals with in-transit totals.

Domains: performance_billing_maintenance.

- reporting_read_model: Compare item/warehouse/company allocated totals with in-transit totals. Evidence: E1.

E1: [DB Architecture/sql/1623676832.sql](sql/1623676832.sql), lines 1-14; SHA-256 `a43a935eeb48f3c852986a41757882e257ddc67163c8c8776cdfaad3b2f468b0`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_LocationsWhereAllocatedQtyNotEqualWorkQtyCount

Compare allocated inventory groups to from-work quantities with destination-warehouse filtering.

Domains: performance_billing_maintenance.

- reporting_read_model: Compare allocated inventory groups to from-work quantities with destination-warehouse filtering. Evidence: E1.

E1: [DB Architecture/sql/1607676775.sql](sql/1607676775.sql), lines 1-22; SHA-256 `7f3d5676f68ad4b4644a6c0ab64643e2dd437ec031e6b471e8f7873f1d342e1e`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_LocationsWhereAllocatedQtyNotEqualWorkQtyDetails

Compare allocated inventory groups to from-work quantities with destination-warehouse filtering.

Domains: performance_billing_maintenance.

- reporting_read_model: Compare allocated inventory groups to from-work quantities with destination-warehouse filtering. Evidence: E1.

E1: [DB Architecture/sql/1591676718.sql](sql/1591676718.sql), lines 1-21; SHA-256 `e5d7c53669c6d0843675caac6c763a360fc8d46ee64b4836cdf0e59f5c8df459`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_LocationsWhereInTransitQtyNotEqualWorkQtyCount

Compare aggregated in-transit inventory to work quantities using the exact cross-side warehouse join.

Domains: performance_billing_maintenance.

- reporting_read_model: Compare aggregated in-transit inventory to work quantities using the exact cross-side warehouse join. Evidence: E1.

E1: [DB Architecture/sql/1575676661.sql](sql/1575676661.sql), lines 1-28; SHA-256 `68725a5e62abcfb8ada4c941b936892fa106ae82e97c2d8f14a774a6438ed9ca`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_LocationsWhereInTransitQtyNotEqualWorkQtyDetails

Compare aggregated in-transit inventory to work quantities using the exact cross-side warehouse join.

Domains: performance_billing_maintenance.

- reporting_read_model: Compare aggregated in-transit inventory to work quantities using the exact cross-side warehouse join. Evidence: E1.

E1: [DB Architecture/sql/1559676604.sql](sql/1559676604.sql), lines 1-26; SHA-256 `f327ce68d919a2d89c79531ba0fc0f2a296641526a161eada07ae46f808ed1bc`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_LocationsWithAllocatedQtyButNoWorkExistsCount

Find nonzero ALLOCATED_QTY with no qualifying from-side work match.

Domains: performance_billing_maintenance.

- reporting_read_model: Find nonzero ALLOCATED_QTY with no qualifying from-side work match. Evidence: E1.

E1: [DB Architecture/sql/1543676547.sql](sql/1543676547.sql), lines 1-18; SHA-256 `ccbbe16cf3d4d5ababc30bd3e19eb5920a5f3fb9b9145ba6d607f12aef26f175`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_LocationsWithAllocatedQtyButNoWorkExistsDetails

Find nonzero ALLOCATED_QTY with no qualifying from-side work match.

Domains: performance_billing_maintenance.

- reporting_read_model: Find nonzero ALLOCATED_QTY with no qualifying from-side work match. Evidence: E1.

E1: [DB Architecture/sql/1527676490.sql](sql/1527676490.sql), lines 1-18; SHA-256 `5e4763c546a66f15e38ceb084561e0d47b3c3bd0bb13e403a044bb82f95472bc`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_LocationsWithAllocatedQtyEqualZeroButWorkExistsCount

Find zero ALLOCATED_QTY inventory joined to positive from work quantities.

Domains: performance_billing_maintenance.

- reporting_read_model: Find zero ALLOCATED_QTY inventory joined to positive from work quantities. Evidence: E1.

E1: [DB Architecture/sql/1511676433.sql](sql/1511676433.sql), lines 1-21; SHA-256 `799ec687a2a6f8d0faccfbac077e4b1274566f6bdea4457a03419e8dba1083e4`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_LocationsWithAllocatedQtyEqualZeroButWorkExistsDetails

Find zero ALLOCATED_QTY inventory joined to positive from work quantities.

Domains: performance_billing_maintenance.

- reporting_read_model: Find zero ALLOCATED_QTY inventory joined to positive from work quantities. Evidence: E1.

E1: [DB Architecture/sql/1495676376.sql](sql/1495676376.sql), lines 1-20; SHA-256 `c0133d0efc309d0bfdf5d848bcb14ab146f8e989b35362c1e48faf2333e931ad`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_LocationsWithInTransitQtyButNoWorkExistsCount

Find nonzero IN_TRANSIT_QTY with no qualifying to-side work match.

Domains: performance_billing_maintenance.

- reporting_read_model: Find nonzero IN_TRANSIT_QTY with no qualifying to-side work match. Evidence: E1.

E1: [DB Architecture/sql/1479676319.sql](sql/1479676319.sql), lines 1-17; SHA-256 `692d53fb48dfd8fe90a143f43b38ea4fb9834de9dddf7e70395dacdb978b6786`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_LocationsWithInTransitQtyButNoWorkExistsDetails

Find nonzero IN_TRANSIT_QTY with no qualifying to-side work match.

Domains: performance_billing_maintenance.

- reporting_read_model: Find nonzero IN_TRANSIT_QTY with no qualifying to-side work match. Evidence: E1.

E1: [DB Architecture/sql/1463676262.sql](sql/1463676262.sql), lines 1-17; SHA-256 `8e07b56cf96931208daa18a09cc23e3df74c7b1dfcabcf639227520142b51aa9`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_LocationsWithInTransitQtyEqualZeroButWorkExistsCount

Find zero IN_TRANSIT_QTY inventory joined to positive to work quantities.

Domains: performance_billing_maintenance.

- reporting_read_model: Find zero IN_TRANSIT_QTY inventory joined to positive to work quantities. Evidence: E1.

E1: [DB Architecture/sql/1447676205.sql](sql/1447676205.sql), lines 1-20; SHA-256 `5577de31f94d440ac9334c87ff7d4a8b4f9bff145d9ce4aa6087fab024c3335d`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_LocationsWithInTransitQtyEqualZeroButWorkExistsDetails

Find zero IN_TRANSIT_QTY inventory joined to positive to work quantities.

Domains: performance_billing_maintenance.

- reporting_read_model: Find zero IN_TRANSIT_QTY inventory joined to positive to work quantities. Evidence: E1.

E1: [DB Architecture/sql/1431676148.sql](sql/1431676148.sql), lines 1-19; SHA-256 `675742ecd69976b8fd4e5c0e20073f26cc688f855629a63becf211d29a4d44c6`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_LocationsWithNegativeInventoryValueCount

Find inventory with any negative on-hand, allocated, in-transit or suspense quantity.

Domains: performance_billing_maintenance.

- reporting_read_model: Find inventory with any negative on-hand, allocated, in-transit or suspense quantity. Evidence: E1.

E1: [DB Architecture/sql/1415676091.sql](sql/1415676091.sql), lines 1-11; SHA-256 `f46ba521bfd4b85a2c25583377b452703e3018b7edd90859cd9a1f99391aaf86`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_LocationsWithNegativeInventoryValueDetails

Find inventory with any negative on-hand, allocated, in-transit or suspense quantity.

Domains: performance_billing_maintenance.

- reporting_read_model: Find inventory with any negative on-hand, allocated, in-transit or suspense quantity. Evidence: E1.

E1: [DB Architecture/sql/1399676034.sql](sql/1399676034.sql), lines 1-12; SHA-256 `09afb7e8ae77cac3b68a2da226ad9ace2cbd80d34a9f4e8271c38abd33ae4669`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_LocationsWithNonbaseUMCount

Compare inventory quantity unit against sequence-one item units.

Domains: performance_billing_maintenance.

- reporting_read_model: Compare inventory quantity unit against sequence-one item units. Evidence: E1.

E1: [DB Architecture/sql/1383675977.sql](sql/1383675977.sql), lines 1-8; SHA-256 `00ec673a4692deaa9c54619764add4897de0d1e4890a5c67939bb04d7e3e90be`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_LocationsWithNonbaseUMDetails

Compare inventory quantity unit against sequence-one item units.

Domains: performance_billing_maintenance.

- reporting_read_model: Compare inventory quantity unit against sequence-one item units. Evidence: E1.

E1: [DB Architecture/sql/1367675920.sql](sql/1367675920.sql), lines 1-8; SHA-256 `94fa66f6a39147e5aaccf52015a7e866100bfb6de0e1065624b90cabf050feb3`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_NegativeLicensePlateValuesCount

Find negative on-hand inventory having a non-NULL logistics-unit value.

Domains: performance_billing_maintenance.

- reporting_read_model: Find negative on-hand inventory having a non-NULL logistics-unit value. Evidence: E1.

E1: [DB Architecture/sql/1351675863.sql](sql/1351675863.sql), lines 1-9; SHA-256 `bf145019cd88f1a13aacb39cc5ba0908bb7d00f22b4681086bfbcdd32aab4555`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_NegativeLicensePlateValuesDetails

Find negative on-hand inventory having a non-NULL logistics-unit value.

Domains: performance_billing_maintenance.

- reporting_read_model: Find negative on-hand inventory having a non-NULL logistics-unit value. Evidence: E1.

E1: [DB Architecture/sql/1335675806.sql](sql/1335675806.sql), lines 1-6; SHA-256 `7f0eb709855672b6c7220e1e93df9cb7ba4b674a14aa5960dc0ccfe330552a7f`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_NoInventoryRecordButWorkExistsForFromLocationCount

Find from-side work groups without a matching location-inventory row and count the groups.

Domains: performance_billing_maintenance.

- reporting_read_model: Find from-side work groups without a matching location-inventory row and count the groups. Evidence: E1.

E1: [DB Architecture/sql/1319675749.sql](sql/1319675749.sql), lines 1-15; SHA-256 `5aab9ee96f89e4d03215753c81f977f53d72983a5e70ad7af41bafd68eccf314`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_NoInventoryRecordButWorkExistsForFromLocationDetails

Find from-side work groups without a matching location-inventory row.

Domains: performance_billing_maintenance.

- reporting_read_model: Find from-side work groups without a matching location-inventory row. Evidence: E1.

E1: [DB Architecture/sql/1303675692.sql](sql/1303675692.sql), lines 1-15; SHA-256 `2fa5a926559467336ed85cde1202f967b936d12cfaa7c30f5b911ee56e149dff`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_NoInventoryRecordButWorkExistsForToLocationCount

Find to-side work groups without a matching location-inventory row and count the groups.

Domains: performance_billing_maintenance.

- reporting_read_model: Find to-side work groups without a matching location-inventory row and count the groups. Evidence: E1.

E1: [DB Architecture/sql/1287675635.sql](sql/1287675635.sql), lines 1-17; SHA-256 `be8e7ed243b7786016fd0742f867187f0f8a9b96a7393e6010ffc436b326d157`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_NoInventoryRecordButWorkExistsForToLocationDetails

Find to-side work groups without a matching location-inventory row.

Domains: performance_billing_maintenance.

- reporting_read_model: Find to-side work groups without a matching location-inventory row. Evidence: E1.

E1: [DB Architecture/sql/1271675578.sql](sql/1271675578.sql), lines 1-17; SHA-256 `2269893cc38f986873fd17f6da564fddc1581e6de5f37255e20455c01c3f90e9`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_ShipDockOnHandandAllocatedQtyNotEqualShippingQtyCount

Compare location on-hand quantity with selected shipping-work quantity.

Domains: labor, yard, administration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1255675521.sql](sql/1255675521.sql), lines 1-17; SHA-256 `f2b7495bec1fef64d657361ed0bf48a3b60fe49e8cf058144672ba68b4671d2d`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.RPT_CSO_ShipDockOnHandandAllocatedQtyNotEqualShippingQtyDetails

Compare location on-hand quantity with selected shipping-work quantity.

Domains: labor, yard, administration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1239675464.sql](sql/1239675464.sql), lines 1-17; SHA-256 `fb9722d9326764486b0e16ad75eebd681ea9d88c8186359f3bd50c6270ebf230`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.RPT_CSO_TimesALocationHasGoneNegativeInPast30DaysCount

Count recent transaction records with a negative after-quantity.

Domains: labor, yard, administration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1223675407.sql](sql/1223675407.sql), lines 1-7; SHA-256 `d14b3da654f3e0388cee13b387432593ea77d113400950d885cedf1993b9ac52`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.RPT_CSO_TimesALocationHasGoneNegativeInPast30DaysDetails

Count recent transaction records with a negative after-quantity.

Domains: labor, yard, administration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1207675350.sql](sql/1207675350.sql), lines 1-7; SHA-256 `da476425861e2412b880c7b9770f406b0f4f52e694325d379621c3a4813b6749`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.RPT_CSO_TopFiveTablesByRecordCount

Show five catalog index row-count estimates ordered by size.

Domains: performance_billing_maintenance.

- reporting_read_model: Show five catalog index row-count estimates ordered by size. Evidence: E1.

E1: [DB Architecture/sql/1191675293.sql](sql/1191675293.sql), lines 1-12; SHA-256 `5d067d000c52691b494f4f19c291a53197337c88ecc83bb8227eb4d97147f9f8`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_TotalDeadlockRecordsLast14Days

Count joined retained audit-value rows matching the deadlock pattern over fourteen days.

Domains: performance_billing_maintenance.

- reporting_read_model: Count joined retained audit-value rows matching the deadlock pattern over fourteen days. Evidence: E1.

E1: [DB Architecture/sql/1175675236.sql](sql/1175675236.sql), lines 1-10; SHA-256 `1356e0ebfedfc12e8b13c3597617a908ad285b5c74cba3046162d7747cbdb342`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_UniqueDeadlockRecordsLast14Days

Count distinct retained audit-value texts matching the deadlock pattern over a rolling fourteen-day window.

Domains: performance_billing_maintenance.

- reporting_read_model: Count distinct retained audit-value texts matching the deadlock pattern over a rolling fourteen-day window. Evidence: E1.

E1: [DB Architecture/sql/1159675179.sql](sql/1159675179.sql), lines 1-10; SHA-256 `4a620dfe9bb45a844d6ff276f25e308e6cf77ec5999c2faccf87e2bac0990723`. Complete module body reviewed with original-definition fingerprint.

Limits: Selection describes a diagnostic condition, not a reproduced inventory defect, root cause, remediation or measured count. There is no warehouse/user authorization input in this body.


## dbo.RPT_CSO_UserLocationsGreaterThan1DayOldCount

Report matching location-inventory records older than one server-local day.

Domains: labor, yard, administration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1143675122.sql](sql/1143675122.sql), lines 1-9; SHA-256 `0e64e4d22aff9c6ce57fe7723284399539bafa4889ac98797f6dbdecd1bcadeb`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.RPT_CSO_UserLocationsGreaterThan1DayOldDetails

Report matching location-inventory records older than one server-local day.

Domains: labor, yard, administration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1127675065.sql](sql/1127675065.sql), lines 1-10; SHA-256 `5e75132f83fa26294a69240cd163ac13cc0437f0e0edf1181ac02e4f583b416a`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.RPT_LaborTypeSummaryDetails

Return dated labor-type detail rows for a report.

Domains: labor, yard, administration.

- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.
- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/209748150.sql](sql/209748150.sql), lines 1-52; SHA-256 `ff90fe87519049581334ba783b6f7a7868459990d0f972f0a7b1710c190531d7`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.RPT_UserSummaryReportDetails

Return labor details ordered for a user-summary report.

Domains: labor, yard, administration.

- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.
- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/801750259.sql](sql/801750259.sql), lines 1-40; SHA-256 `57b0bb648ed2e919fca33099639d3f805d9310f4ab3a8a990e9427bec6dc7a0f`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.RPT_YardVisibilityDetails

Return dock, actual/scheduled trailer and receipt visibility details.

Domains: labor, yard, administration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/897750601.sql](sql/897750601.sql), lines 1-65; SHA-256 `364338dd58b6702b5fc1d3caaaf6a2f5fbbab2f5d4b8bc79efd686cd795b8c90`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.RPT_YardVisibilityHdrDetails

Aggregate dock visibility using actual-location trailer matches.

Domains: labor, yard, administration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/913750658.sql](sql/913750658.sql), lines 1-53; SHA-256 `828d2cc84ecb361d1cef791542243769d4396378090743241978588ea9d82a7a`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.RPT_YardVisibilityRcptDetails

Return receipt-line quantities for the yard visibility report.

Domains: labor, yard, administration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/929750715.sql](sql/929750715.sql), lines 1-34; SHA-256 `620629b49184359589e3c1845032df9a0068367e5f6a6876323219ab419b9e0a`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.SaveUserLastActivityEndTime

Store a supplied last-activity end time for one user.

Domains: labor, yard, administration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/1153751513.sql](sql/1153751513.sql), lines 1-25; SHA-256 `e31c570393b014ad18c37574ab5b5129d8c303f310a66e60a6cc81ddca7a0ade`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.SCI_LABOR_MANAGEMENT_DETAIL

Export completed labor details changed within a timestamp window.

Domains: labor, yard, administration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1217751741.sql](sql/1217751741.sql), lines 1-58; SHA-256 `1869e26f5032a0e67f39d026b068821d6a8093b58f896883f0feef64913165db`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.SEC_GetCheckpointsWithResourceFileKeys

Map registered security checkpoints to resource keys and coded permission values.

Domains: labor, yard, administration.

- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.
- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1505752767.sql](sql/1505752767.sql), lines 1-18; SHA-256 `304c8150657d2db85f73afa970a27dcd407183345f3936592a7deedbe158deb6`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.SEC_GetSecurityForms

Return localized security forms using two materially different selection branches.

Domains: labor, yard, administration.

- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.
- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1521752824.sql](sql/1521752824.sql), lines 1-94; SHA-256 `d08e5849fa6457e733713eb7b5292304205bd6c6906bccec0782ad73554ca3aa`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.SHP_GetStatusFlowFromContainer

Find one non-NULL status flow in a container and its descendants.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1601753109.sql](sql/1601753109.sql), lines 1-19; SHA-256 `e8cb620ee625a0d6dc8569047b4f461337584b5bf0ba7b590b548f01832a6379`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.SHP_InsightDetailPaneData

Builds shipment result sets for the documented DetailPane example.

Domains: shipping, ui_and_reporting.

- reporting_read_model: Header, container count, dock and detail scalars are read from shipping objects. Evidence: E1, E2.
- presentation_adapter: Four result sets package values for a DetailPane-style caller. Evidence: E1, E2.

E1: [DB Architecture/sql/1633753223.sql](sql/1633753223.sql), lines 40-75; SHA-256 `91be70e93fcaf6cd46bdc9ff8ae8fb5923ba31e252460dcaf62dd1e520a7342c`. Header/container reads and dock assignment/lookup.

E2: [DB Architecture/sql/1633753223.sql](sql/1633753223.sql), lines 78-90; SHA-256 `91be70e93fcaf6cd46bdc9ff8ae8fb5923ba31e252460dcaf62dd1e520a7342c`. Final detail-derived result set and procedure end.

Limits: The dock-assignment statement lacks a shipment filter; functional impact was not tested. Screen activation and exact rendered labels are not established.


## dbo.SHP_MoveContainersBelowStatusToShipment

Move selected below-threshold container rows to a different shipment.

Domains: shipping, integration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/1761753679.sql](sql/1761753679.sql), lines 1-49; SHA-256 `d5fdba96869d06fa5d19ae5c771068175d7502ab3548f2eff7f6734327cea592`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.SHP_ProcessShipmentDeallocationAndHistory

Deduct allocation or in-transit inventory and optionally write per-shipment history.

Domains: shipping, integration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/1777753736.sql](sql/1777753736.sql), lines 1-519; SHA-256 `f18280d27aa4363baa8792339597984ae1343cedc6ddd5def504a91b42377b99`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.SHP_RemoveContainerGroup

Clear a work-linked container group and its instruction grouping.

Domains: shipping, integration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/1793753793.sql](sql/1793753793.sql), lines 1-68; SHA-256 `dcc30cdcafc522ca49af63f228142ff1e977376c20386bf3bdf8a47596f62853`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.SHP_SetStatusesAtShipConfirm

Propagate supplied ship-confirm status across shipment, detail, containers and load, and enqueue matching alerts.

Domains: receiving_shipping.

- orchestration: Coordinates ordered status/identifier processing. Evidence: E1.
- transactional_mutation: Writes persistent state and can have effects before later failure. Evidence: E1.

E1: [DB Architecture/sql/1809753850.sql](sql/1809753850.sql), lines 1-310; SHA-256 `2e4550ba3972ac8d7cb010387214f2bdab3e30ddb1fa8d5d9f0c70a61c2f411f`. Complete module body reviewed with original-definition fingerprint.

Limits: Body-level review; caller authority, effective data, runtime and complete process semantics remain external.


## dbo.SHP_SetXOfYForShipment

Assign X-of-Y numbering to top-level identified containers in one shipment.

Domains: shipping, integration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/1825753907.sql](sql/1825753907.sql), lines 1-72; SHA-256 `b33b779388b005dc88897d324961f1cac5e94a87b1d55442c5f09b1a7c958042`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.SHP_SetXOfYForWave

Run shipment X-of-Y numbering for each shipment selected from a wave.

Domains: shipping, integration.

- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.
- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1841753964.sql](sql/1841753964.sql), lines 1-42; SHA-256 `9614323a7b317198223865290dae354c3e909e35a43f7cdc5e2c58816c350d9c`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.SHP_SplitAllocRequest

Split an allocation request into a retained requested quantity and cloned remainder.

Domains: shipping, integration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/1857754021.sql](sql/1857754021.sql), lines 1-248; SHA-256 `0e489448cc68859b587f4b6a0b6dd99567545f4d919ef8039d6badbd91f7548c`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.SHP_SplitShippingContainer

Split a shipping-container quantity, optionally creating a parent container.

Domains: shipping, integration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/1873754078.sql](sql/1873754078.sql), lines 1-468; SHA-256 `e3edb38119c092ab33df1377dfb5aba89e6d62b525bffffd46b6f83906129826`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.SHP_TransferDtlForShipDistr

Transfer one shipment detail and associated shipment comments.

Domains: shipping, integration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/1889754135.sql](sql/1889754135.sql), lines 1-45; SHA-256 `3b32586064dd8716a9fb81947952662531e969ebfadc46313e9198c3363d2d84`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.SHP_UpdateFreightCharges

Replace header freight amounts with selected container sums.

Domains: shipping, integration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/1905754192.sql](sql/1905754192.sql), lines 1-48; SHA-256 `17648d4f5b20ea5082715abc277f935363d4a0e5b5519cde942d638329337884`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.SHP_UpdateGroupPosition

Assign group/spot and optionally rename a container and its direct children.

Domains: shipping, integration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/1921754249.sql](sql/1921754249.sql), lines 1-80; SHA-256 `e30e15c76228b00916e258feced6ec9d3d8e5e0b9d357ee5597088e4c49e050b`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.STAT_GetStatisticsValue

Resolve a named statistics field and retrieve a scalar value by source key.

Domains: allocation_wave_replenishment.

- reporting_read_model: Returns the stated context/aggregate/output projection; not process execution. Evidence: E1.

E1: [DB Architecture/sql/2033754648.sql](sql/2033754648.sql), lines 1-51; SHA-256 `750620577d3d522119825e726da77f100d9b378ba2534ae5ff8d0d699cc463f3`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.STAT_SaveStatisticsValue

Insert or update a named stored statistics value.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/2049754705.sql](sql/2049754705.sql), lines 1-81; SHA-256 `2308df3f07a595e298335163da2fb106a93bb89b0d0c68de0ff7229343526ef5`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.TranHist_RepDeallocation

Pass replenishment inventory before/after quantities to transaction-history persistence.

Domains: allocation_wave_replenishment.

- orchestration: Calls the recorded mutation/statistics/history helper; no direct persistent DML. Evidence: E1.

E1: [DB Architecture/sql/142271912.sql](sql/142271912.sql), lines 1-71; SHA-256 `267465b2544a653b253820b4c9e78452950869c81f56e55f0070c74014876b60`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.TRAV_EX01_GetPrintLabelDetails

Prepare label-print parameters for a container ID.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1458208345.sql](sql/1458208345.sql), lines 1-39; SHA-256 `801dafc379a1026593c605529c9d746d5311e90d03187a4ac2985dc2b81ec775`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.TRAV_EX01_ReprintPS

Queue one DIF incoming message per qualifying container for a reprint flow.

Domains: shipping, integration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/1877178033.sql](sql/1877178033.sql), lines 1-47; SHA-256 `bf50fa0cd04470f27387bfd64645e6661e6bd390963643a9d1ca166cbf156590`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.WAVE_AddShipment

Attach one shipment to a wave and assign caller-supplied pending statuses.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/254272311.sql](sql/254272311.sql), lines 1-49; SHA-256 `98713bd8ec243afa861446d6a031047579ae3961a77b67c00e76862fc578a8c4`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.WAVE_InsightDetailPaneData

Return six wave detail-pane result sets.

Domains: allocation_wave_replenishment.

- reporting_read_model: Returns the stated context/aggregate/output projection; not process execution. Evidence: E1.

E1: [DB Architecture/sql/270272368.sql](sql/270272368.sql), lines 1-57; SHA-256 `aacdfce3227f5d5c19de109874c15978c9ecd1d88512a7736c5642ab78f3a3b0`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.WAVE_RemoveShipment

Return a single shipment to pool wave number zero.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/286272425.sql](sql/286272425.sql), lines 1-49; SHA-256 `e7a828577c253f09c3310f35084e1f4866b878c5de06acad18c5aeb017040709`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.WAVE_RemoveShipments

Return all currently matching wave shipments and details to pool wave zero.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/302272482.sql](sql/302272482.sql), lines 1-48; SHA-256 `15bc982cefad1b4dcdc74a4dc182d09082d5ce9e555d00591c9637b3a1dffc94`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.WAVE_TransferShipment

Transfer a single shipment and its details to a supplied wave.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/318272539.sql](sql/318272539.sql), lines 1-43; SHA-256 `c3cec44eae385a2bac38f77c3dd5323a8a7612d786aad0696150680f747285a0`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.WAVE_UpdateStatistics

Refresh stored wave totals from current shipment-header view aggregates.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/334272596.sql](sql/334272596.sql), lines 1-56; SHA-256 `358d358cdf9e80bbd58b79b4ba5262eb446997bb3a7a898b76b5e921b78f02f9`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.WAVE_UpdateStatistics01

Guard selected wave-step starts and refresh progress/statistics within a local transaction.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/350272653.sql](sql/350272653.sql), lines 1-88; SHA-256 `8026bb16d0256cfa3e34753d399d1fa40e29b8acd464d549daaf8602e16aa194`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.wm_DDownloadItem01

Delete downloaded item staging rows by process stamp.

Domains: shipping, integration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/231320234.sql](sql/231320234.sql), lines 1-15; SHA-256 `c6785318233e09f12e30ef699ffa064e079bfda63c097ab8f45d27af24abfaf8`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_DDownloadOrderHeader01

Remove only processed order-download staging rows for a process stamp.

Domains: shipping, integration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/247320291.sql](sql/247320291.sql), lines 1-41; SHA-256 `936705d417b9f7329c7a38597cc3059f1a7e9990e308f36e77ebfb878de53f52`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_DDownloadOrderHeader02

Remove order-download staging rows regardless of interface condition.

Domains: shipping, integration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.

E1: [DB Architecture/sql/263320348.sql](sql/263320348.sql), lines 1-31; SHA-256 `96e48c7169c12896af4f1ab1acad73d85781aa29d80d69b772081f856a114fc5`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_DDownloadReceiptHeader01

Delete receipt-related download staging sets by process stamp.

Domains: shipping, integration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/446272995.sql](sql/446272995.sql), lines 1-48; SHA-256 `818454460b0aea692d6b197b6ab6d19ecb7555bbc47194cfbb56ffcc9b20dc06`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_DUploadOrderHeader01

Delete upload order details linked to selected headers, then those headers.

Domains: shipping, integration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/375320747.sql](sql/375320747.sql), lines 1-12; SHA-256 `865eb26fda32bbacc7196b0ec7899277df36b51ed5f4b7583787a29761006fc4`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_InsertUploadSerialNumber

Create upload serial-number rows from selected inventory-attribute staging rows.

Domains: shipping, integration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/654273736.sql](sql/654273736.sql), lines 1-50; SHA-256 `0e224f17a85d54d8b5ae0c563252504373ce11edfbd0d46796d98e5decf9f4da`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_RCarrier02

Retrieve an active carrier/service record.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1038275104.sql](sql/1038275104.sql), lines 1-19; SHA-256 `f71b5cbac4bfd04abebfc3d5708693bd3948ae30af0a9f48cc6d6f2471faa237`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_RCarrierGroupHeader02

Retrieve an active carrier-group header.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/487321146.sql](sql/487321146.sql), lines 1-14; SHA-256 `1b81939ce17c487886ce3201791234dc0b95ed894e25536b197691a851b164d5`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_RInterfaceDataMapDetail01

Retrieve INTERFACE_DATA_MAP_DETAIL configuration with the documented selectors.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/871322514.sql](sql/871322514.sql), lines 1-12; SHA-256 `7feecf695100e21289ea3a05dbd378c856b180402358014ffa72ed0b7eb6af0e`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_RInterfaceDataMapDetail02

Retrieve INTERFACE_DATA_MAP_DETAIL configuration with the documented selectors.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/887322571.sql](sql/887322571.sql), lines 1-12; SHA-256 `52cc1fb305bb0ed9412cb5affb8b657e24e356108e7558667fc04de5e9260b0e`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_RInterfaceDataMapHeader01

Retrieve INTERFACE_DATA_MAP_HEADER configuration with the documented selectors.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1182275617.sql](sql/1182275617.sql), lines 1-22; SHA-256 `7157fbb2a0fba75e51b61e0c42d1fa612fb75e4ae73a58a3a2994dfd877d36aa`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_RInterfaceDataMapHeader02

Retrieve INTERFACE_DATA_MAP_HEADER configuration with the documented selectors.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1198275674.sql](sql/1198275674.sql), lines 1-18; SHA-256 `c83e8005093e7606aff73042124c80918a8198513c6d4a5c3f98c63d6d188acd`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_RInterfaceDataMapHeader03

Retrieve INTERFACE_DATA_MAP_HEADER configuration with the documented selectors.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1214275731.sql](sql/1214275731.sql), lines 1-16; SHA-256 `eb57366cb84b50f833260575894a897904dfe54f85e19f42547b95049ec37171`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_RInterfaceDetail01

Retrieve INTERFACE_DETAIL configuration with the documented selectors.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/903322628.sql](sql/903322628.sql), lines 1-12; SHA-256 `2c83d9a01901ac499646c80fdc3d60f52402c5a29f28991f9a784e607701851a`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_RInterfaceDetail02

Retrieve INTERFACE_DETAIL configuration with the documented selectors.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/919322685.sql](sql/919322685.sql), lines 1-13; SHA-256 `d6bff57f6b1e9bd37aed4a2dd7072293eed89b643bb812e1dc80be050abe8a7a`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_RInterfaceFlowStep01

Retrieve INTERFACE_FLOW_STEP configuration with the documented selectors.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1230275788.sql](sql/1230275788.sql), lines 1-18; SHA-256 `a03bfa912d2b97f9161b1c6209ce9eb45d85779975f02775330544c5d63e8373`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_RInterfaceFlowStep02

Retrieve INTERFACE_FLOW_STEP configuration with the documented selectors.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1246275845.sql](sql/1246275845.sql), lines 1-18; SHA-256 `b0d0348a515a8486e349f63d1d66e325f9c90f9fb4e1b9d3eec46794bab05e4a`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_RInterfaceHeader01

Retrieve INTERFACE_HEADER configuration with the documented selectors.

Domains: shipping, integration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/935322742.sql](sql/935322742.sql), lines 1-12; SHA-256 `a7c3cfd49faf763393e025e97ec9222db71f7d3476b73517f2870bf23dd24cf9`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_RLocatingRuleHeader01

Retrieve the named locating-rule header.

Domains: receiving_shipping.

- reporting_read_model: Returns a configuration header by key. Evidence: E1.

E1: [DB Architecture/sql/1175323597.sql](sql/1175323597.sql), lines 1-16; SHA-256 `9037fc534df0ef023708507d2628bf752b18614d9263bb469740dfce3e512660`. Complete module body reviewed with original-definition fingerprint.

Limits: Body-level review; caller authority, effective data, runtime and complete process semantics remain external.


## dbo.wm_RUserProfile01

Retrieve a user profile by exact username.

Domains: labor, yard, administration.

- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1783325763.sql](sql/1783325763.sql), lines 1-13; SHA-256 `30caa49713d149e004af6c7b7b7f8ea4eb97bca63c1e82607208a3b3687c0525`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_RUUploadOrderHeader01

Claim or advance an upload header batch and its linked staging records.

Domains: shipping, integration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/410796871.sql](sql/410796871.sql), lines 1-102; SHA-256 `490d5acf6415262167580113676971da683b26cc405a8b3b089850dde2a6dab6`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.wm_UUserActivity01

Mark idle user-activity sessions logged off and return affected row count.

Domains: labor, yard, administration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/762798125.sql](sql/762798125.sql), lines 1-16; SHA-256 `749147d0d712f4bc5781b80fb13f410c0099519f1ba49e24082acecbb9f8cb2f`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.WRK_DeactivateInactiveWork

Move eligible inactive work from active storage to the inactive instruction table.

Domains: work_execution.

- transactional_mutation: Contains explicit persistent work-state writes. Evidence: E1.
- orchestration: Coordinates the documented conditional statement sequence. Evidence: E1.

E1: [DB Architecture/sql/874798524.sql](sql/874798524.sql), lines 1-81; SHA-256 `69eb0afbab68d08b67604fcdbf964ebfc889b55c98fd0eafa049924018c6f9b4`. Complete module body reviewed with original-definition fingerprint.

Limits: Scope is the body and named effects, not runtime success, current data, caller authorization or complete end-to-end semantics.


## dbo.WRK_DeactivateWork

Move closed header/detail work for one instruction number to inactive storage.

Domains: work_execution.

- transactional_mutation: Contains explicit persistent work-state writes. Evidence: E1.
- orchestration: Coordinates the documented conditional statement sequence. Evidence: E1.

E1: [DB Architecture/sql/890798581.sql](sql/890798581.sql), lines 1-33; SHA-256 `1810216ab801e6b9730ea7e24731f8342eebc305c708959cb447e8a40dc4e65b`. Complete module body reviewed with original-definition fingerprint.

Limits: Scope is the body and named effects, not runtime success, current data, caller authorization or complete end-to-end semantics.


## dbo.WRK_GetWorkInstructionsForExecution

Select candidate warehouse instructions; cart regrouping can also persist sequence changes.

Domains: work_execution.

- workflow_selection: Dynamic candidate queries select executable work. Evidence: E1.
- transactional_mutation: Cart branch dynamically updates instruction sequence. Evidence: E1.
- orchestration: Coordinates feature decisions, candidate probes and final dynamic execution. Evidence: E1.

E1: [DB Architecture/sql/51843597.sql](sql/51843597.sql), lines 1-752; SHA-256 `337a1793a82284ecd9d2c95352ab086d5ee8dae4e6e6a8d6025a62198c6678b0`. Complete module body reviewed with original-definition fingerprint.

Limits: Scope is the body and named effects, not runtime success, current data, caller authorization or complete end-to-end semantics.


## dbo.WRK_MonitorAssignedUserChartData

Return assigned-user work chart and six aggregate monitor results.

Domains: labor, yard, administration.

- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.
- presentation_adapter: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/970798866.sql](sql/970798866.sql), lines 1-92; SHA-256 `07d8eb7fbd0ff6db0d91e97c6cc20855576f4f9b459c2c1f09c1cc924d9994a4`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.WRK_MonitorWorkGroupChartData

Build work-group chart plus monitor summary counts.

Domains: work_execution.

- reporting_read_model: Aggregates filtered work state. Evidence: E1.
- presentation_adapter: Shapes chart/tile result sets for the caller. Evidence: E1.

E1: [DB Architecture/sql/1082799265.sql](sql/1082799265.sql), lines 1-79; SHA-256 `5a34e088b302084eeb2eae90fbfc0726d3a11cf9282f597ac5eab59d37d91e13`. Complete module body reviewed with original-definition fingerprint.

Limits: Scope is the body and named effects, not runtime success, current data, caller authorization or complete end-to-end semantics.


## dbo.WRK_MonitorWorkGroupIndicatorTile

Build the selected work indicator tile and threshold classifications.

Domains: work_execution.

- reporting_read_model: Aggregates filtered work state. Evidence: E1.
- presentation_adapter: Shapes chart/tile result sets for the caller. Evidence: E1.

E1: [DB Architecture/sql/1098799322.sql](sql/1098799322.sql), lines 1-93; SHA-256 `3e6ac90c5c4a31ae31bbf43221697a2682362a77fbeb8b943078757d8ff604ae`. Complete module body reviewed with original-definition fingerprint.

Limits: Scope is the body and named effects, not runtime success, current data, caller authorization or complete end-to-end semantics.


## dbo.WRK_MonitorWorkTypeChartData

Build a work-type drilldown within one work group.

Domains: work_execution.

- reporting_read_model: Aggregates filtered work state. Evidence: E1.
- presentation_adapter: Shapes chart/tile result sets for the caller. Evidence: E1.

E1: [DB Architecture/sql/1114799379.sql](sql/1114799379.sql), lines 1-86; SHA-256 `80cd2be3bcea0460ebdd96d291dca2d574aaf5b9fcb49ad74a8d0a87bd86e1d1`. Complete module body reviewed with original-definition fingerprint.

Limits: Scope is the body and named effects, not runtime success, current data, caller authorization or complete end-to-end semantics.


## dbo.WRK_SplitReplenishmentRequest

Retain supplied quantity on an original replenishment request and create a remainder request linked to an instruction.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/1130799436.sql](sql/1130799436.sql), lines 1-190; SHA-256 `8c90a5e42ea4e71a65660da82fb8c75cd08ade333e45fc62aaa31be151ff9798`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.WRK_UnAssignGroupForSystemDirectedWork

Clear group and assignment from the selected system-directed process subset.

Domains: work_execution.

- transactional_mutation: Contains explicit persistent work-state writes. Evidence: E1.
- orchestration: Coordinates the documented conditional statement sequence. Evidence: E1.

E1: [DB Architecture/sql/1146799493.sql](sql/1146799493.sql), lines 1-30; SHA-256 `230e30dce4728e4905ba4e43efa47aaf74d43f9569714ee98807f81b475340d7`. Complete module body reviewed with original-definition fingerprint.

Limits: Scope is the body and named effects, not runtime success, current data, caller authorization or complete end-to-end semantics.


## dbo.WRK_UpdateAllocWorkCreated

Mark one request WORK_CREATED=Y.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/1162799550.sql](sql/1162799550.sql), lines 1-17; SHA-256 `8759b02229458138516896a52d9044058ea11f3462af8d84d6842eff87dd381a`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.WRK_UpdateDockWorkCreated

Mark dock work created and delegate container work-state update.

Domains: labor, yard, administration.

- transactional_mutation: The body directly mutates the explicitly named persistent records. Evidence: E1.
- orchestration: The body coordinates the documented conditional or ordered steps. Evidence: E1.

E1: [DB Architecture/sql/1194799664.sql](sql/1194799664.sql), lines 1-17; SHA-256 `ad959e6a4d1bc657b60c55c421837b37b833ee0b6611bda2f53cc30a3eb14040`. Complete retained body structure reviewed; original fingerprint verified; redacted string selectors remain opaque.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.WRK_UpdateReplenWorkCreated

Mark one request WORK_CREATED=Y.

Domains: allocation_wave_replenishment.

- transactional_mutation: Changes the persistent columns stated in the reviewed ordered branches. Evidence: E1.

E1: [DB Architecture/sql/1258799892.sql](sql/1258799892.sql), lines 1-17; SHA-256 `cc0ae15c67f2e91cc68843f1d91b8670f7ec31c23bfcec96087b1ca80fe9f6d6`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.WRK_UpdateWorkInstructionForSystemDirectedWorkUnitSelection

Attach a named work unit to a group and sequence eligible detail instructions.

Domains: work_execution.

- transactional_mutation: Contains explicit persistent work-state writes. Evidence: E1.
- orchestration: Coordinates the documented conditional statement sequence. Evidence: E1.

E1: [DB Architecture/sql/1354800234.sql](sql/1354800234.sql), lines 1-40; SHA-256 `6f6de83a4c739d9ec3bcb15210763b7d0e0bfa7fcd2adb79ea56bac9b89c5a0a`. Complete module body reviewed with original-definition fingerprint.

Limits: Scope is the body and named effects, not runtime success, current data, caller authorization or complete end-to-end semantics.


## dbo.WVST_AllocatedQuantity

Copy stored wave allocated quantity into the configured statistics value.

Domains: allocation_wave_replenishment.

- orchestration: Calls the recorded mutation/statistics/history helper; no direct persistent DML. Evidence: E1.

E1: [DB Architecture/sql/1610801146.sql](sql/1610801146.sql), lines 1-27; SHA-256 `74d1db3ddf82706c473ea69c4d732b5aa5356d7800e8b08fe16e94701cf655c3`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.WVST_LinesCompletelyRejected

Persist a wave fully-rejected-line metric adjusted for lines removed since a baseline.

Domains: allocation_wave_replenishment.

- orchestration: Calls the recorded mutation/statistics/history helper; no direct persistent DML. Evidence: E1.

E1: [DB Architecture/sql/1658801317.sql](sql/1658801317.sql), lines 1-43; SHA-256 `5a4b8e0e5865473412eb5a50188bd4ed9edf3ee45645e08cf3bb78b381c181f5`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.WVST_LinesPartiallyRejected

Persist count of wave lines with later rejected-status slots while first slot is not rejected.

Domains: allocation_wave_replenishment.

- orchestration: Calls the recorded mutation/statistics/history helper; no direct persistent DML. Evidence: E1.

E1: [DB Architecture/sql/1674801374.sql](sql/1674801374.sql), lines 1-51; SHA-256 `e9cda9ec9473cc63f72993968c9e987768fd11d068c1011a6e2de7f84f9ea6aa`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.WVST_RejectedQuantity

Persist sum of quantities in rejected-status history slots for a wave.

Domains: allocation_wave_replenishment.

- orchestration: Calls the recorded mutation/statistics/history helper; no direct persistent DML. Evidence: E1.

E1: [DB Architecture/sql/1722801545.sql](sql/1722801545.sql), lines 1-39; SHA-256 `0ef110ea521164b64cef73aec36070ceb170751c1a7e317ab961cc7921fbaa6c`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.WVST_TotalLines

Copy stored wave total lines into the configured statistics value.

Domains: allocation_wave_replenishment.

- orchestration: Calls the recorded mutation/statistics/history helper; no direct persistent DML. Evidence: E1.

E1: [DB Architecture/sql/1770801716.sql](sql/1770801716.sql), lines 1-27; SHA-256 `317fffa1f29b3a1eb4ff1441749f7e63122f339a5c3255a0795c101e793d77a7`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.WVST_TotalQuantity

Copy stored wave total quantity into the configured statistics value.

Domains: allocation_wave_replenishment.

- orchestration: Calls the recorded mutation/statistics/history helper; no direct persistent DML. Evidence: E1.

E1: [DB Architecture/sql/1786801773.sql](sql/1786801773.sql), lines 1-27; SHA-256 `4474bb9e7615f27c37cc754018418fb2fd871b89a8228d1e2d36ba65c4c41c93`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.WVST_TotalShipments

Copy stored wave total shipments into the configured statistics value.

Domains: allocation_wave_replenishment.

- orchestration: Calls the recorded mutation/statistics/history helper; no direct persistent DML. Evidence: E1.

E1: [DB Architecture/sql/1802801830.sql](sql/1802801830.sql), lines 1-27; SHA-256 `c75372bf65b9c27f800e42d0facc176d2484f0ded021c7470b50ca575a303926`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.WVST_WaveStatisticsHeaderFields

Return localized wave header values arranged by presentation coordinates.

Domains: allocation_wave_replenishment.

- reporting_read_model: Returns the stated context/aggregate/output projection; not process execution. Evidence: E1.

E1: [DB Architecture/sql/1818801887.sql](sql/1818801887.sql), lines 1-40; SHA-256 `39418b075b8aaa25a1b5cb51131880ebd9e63521c4676a466599a47530e522ad`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.fn_GetMonitorFilterParameters

Parse monitor criterion text into name/value rows.

Domains: work_execution.

- utility_transform: Transforms supplied context into a table/scalar result. Evidence: E1.

E1: [DB Architecture/sql/696701880.sql](sql/696701880.sql), lines 1-77; SHA-256 `a791255fa4c57ea50523da58aaf70dee7debfd5714a3b89c68186fab24e07b9a`. Complete module body reviewed with original-definition fingerprint.

Limits: Scope is the body and named effects, not runtime success, current data, caller authorization or complete end-to-end semantics.


## dbo.GetActionEndPointXMLValues

Flatten configured endpoint XML and assign viewer grouping counters.

Domains: function_semantics.

- reporting_read_model: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/824702336.sql](sql/824702336.sql), lines 1-61; SHA-256 `813aafb655dd5526e29c00781b0f8935e1c9b761d4837e97b972086c88745897`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.INVfn_RtrvConversionInfoForItemAndLocation

Return conversion candidates using location UOM preference then item/class fallback.

Domains: function_semantics.

- reporting_read_model: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1704705471.sql](sql/1704705471.sql), lines 1-165; SHA-256 `4fd09fe0ff426d2b9c0fc4990c383c21bd09df5b8d854fb25223eb96db5644bf`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.INVfn_RtrvItemInfo

Return one item/UOM measurement and descriptive row.

Domains: function_semantics.

- reporting_read_model: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1720705528.sql](sql/1720705528.sql), lines 1-143; SHA-256 `b5706d1ffe11080b76a3957270794d9bd48a46970c26a6011c5c16695f7b4edb`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.INVfn_RtrvItemInfoForBaseUM

Return one item/base-UOM information row with numeric zero substitutions.

Domains: function_semantics.

- reporting_read_model: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/397244470.sql](sql/397244470.sql), lines 1-135; SHA-256 `b2a3d4fc54de140df178ebf596ff27d3484563db86165e8b52a2cf5b2c859bd3`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.INVfn_RtrvWeightUM

Retrieve catch-weight unit candidates through inventory, item/class and generic fallback.

Domains: function_semantics.

- reporting_read_model: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1736705585.sql](sql/1736705585.sql), lines 1-205; SHA-256 `3faa8494302faeb74f33dde3c2959d419b5d3dd84450ef530fc128a8f86f8a27`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.ITMfn_RtrvUnitOfMeasure

Return the first available unit-of-measure set from location, item, class or storage template.

Domains: function_semantics.

- reporting_read_model: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1832705927.sql](sql/1832705927.sql), lines 1-350; SHA-256 `7cd5d4dfaa7e8b66800c0cf6c5a3b2e6c8841f874015d83b966c36a730366a93`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.SECfn_GetSecurityCheckPoint

Expand one form security string into checkpoint rows with whole-result fallback.

Domains: function_semantics.

- reporting_read_model: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1537752881.sql](sql/1537752881.sql), lines 1-90; SHA-256 `c4a7601977699c27104c3efe8fe21655ce4427a3e25ca945c2c830b78f1e2a05`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.SECfn_GetSecurityCheckPointByUsername

Expand security checkpoints across forms with one global fallback decision.

Domains: function_semantics.

- reporting_read_model: Full body supports the recorded projection/transform and its separate NULL/default/error boundaries. Evidence: E1.

E1: [DB Architecture/sql/1553752938.sql](sql/1553752938.sql), lines 1-83; SHA-256 `64451910e2e609e8ed1bbc80c24f84935405925d849d4c2165e3573299216bb0`. Complete module body reviewed with original-definition fingerprint.

Limits: No persistent DML, operational execution, effective permission enforcement or complete process reconciliation is claimed. Read-only output may still depend on mutable configuration/rows.


## dbo.RECEIPT_HEADER_A_I

Link newly inserted receipts to an existing yard record.

Domains: receiving_shipping.

- event_handler: Declared DML event invokes inserted-set logic. Evidence: E1.
- transactional_mutation: Writes the documented persistent columns. Evidence: E1.

E1: [DB Architecture/sql/720057651.sql](sql/720057651.sql), lines 1-30; SHA-256 `b30f95dbe9d69a2adcf3cdd7fa26dc0a986685c363af5b0236683bf888c28f05`. Complete module body reviewed with original-definition fingerprint.

Limits: Body-level review; caller authority, effective data, runtime and complete process semantics remain external.


## dbo.RECEIPT_HEADER_A_U

Refresh or clear a receipt yard link when trailer ID is targeted by an UPDATE.

Domains: receiving_shipping.

- event_handler: Declared DML event invokes inserted-set logic. Evidence: E1.
- transactional_mutation: Writes the documented persistent columns. Evidence: E1.

E1: [DB Architecture/sql/736057708.sql](sql/736057708.sql), lines 1-33; SHA-256 `716ca062537be2d52d536067457f15f1c8f08a26567cc2f2fbe0cec1e0b29beb`. Complete module body reviewed with original-definition fingerprint.

Limits: Body-level review; caller authority, effective data, runtime and complete process semantics remain external.


## dbo.ship_container_tree_unit_a_i

Initialize the root shipping container tree identifier.

Domains: receiving_shipping.

- event_handler: Declared DML event invokes inserted-set logic. Evidence: E1.
- transactional_mutation: Writes the documented persistent columns. Evidence: E1.

E1: [DB Architecture/sql/768057822.sql](sql/768057822.sql), lines 1-13; SHA-256 `5efb0120bcc089cce081aee93c19d4a7443b04335431765aac6b3006766278b1`. Complete module body reviewed with original-definition fingerprint.

Limits: Body-level review; caller authority, effective data, runtime and complete process semantics remain external.


## dbo.shipment_accessorials_a_i

Normalize negative accessorial internal identifiers after INSERT or UPDATE.

Domains: receiving_shipping.

- event_handler: Declared DML event invokes inserted-set logic. Evidence: E1.
- transactional_mutation: Writes the documented persistent columns. Evidence: E1.

E1: [DB Architecture/sql/752057765.sql](sql/752057765.sql), lines 1-31; SHA-256 `2a2157c7562c8aea7899564ba9ca4ea29d41b6f4f2588af925b7a9eefafe3f23`. Complete module body reviewed with original-definition fingerprint.

Limits: Body-level review; caller authority, effective data, runtime and complete process semantics remain external.


## dbo.TRAILER_YARD_STATUS_A_I

Associate existing open-scope receipts when a yard record is inserted.

Domains: receiving_shipping.

- event_handler: Declared DML event invokes inserted-set logic. Evidence: E1.
- transactional_mutation: Writes the documented persistent columns. Evidence: E1.

E1: [DB Architecture/sql/784057879.sql](sql/784057879.sql), lines 1-25; SHA-256 `254d9fee5b3ae0c9cb521ea2cfad05a774f3bb9b9f5f3ee77516c967819b3042`. Complete module body reviewed with original-definition fingerprint.

Limits: Body-level review; caller authority, effective data, runtime and complete process semantics remain external.


## dbo.work_instruction_outgoing_pd

Populate outgoing pick/drop metadata after instruction insertion.

Domains: work_execution.

- event_handler: AFTER INSERT handler uses the inserted set. Evidence: E1.
- transactional_mutation: Writes outgoing location metadata. Evidence: E1.

E1: [DB Architecture/sql/800057936.sql](sql/800057936.sql), lines 1-17; SHA-256 `d55cbece6b3a1cc82e21c2db9d075e9d74a8aff3c79a8cf3bda6fb571cbad664`. Complete module body reviewed with original-definition fingerprint.

Limits: Scope is the body and named effects, not runtime success, current data, caller authorization or complete end-to-end semantics.


## dbo.ACTION_MENU

Store action-menu identity and presentation settings.

Domains: administration, configuration, presentation.

- presentation_metadata: OBJECT_ID is the only captured unique key. The seed guard suppresses matches on either MENU_NAME or DESCRIPTION, although neither has its own unique index. Evidence: E1, E2, E3, E4, E5.

E1: [DB Architecture/objects/1533248517.json](objects/1533248517.json), lines 1-376; SHA-256 `f5b5d57fcc422834532d1c451a03eb9df6a681fafa2cddbefaae0f2969e6a143`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/1708181481.sql](sql/1708181481.sql), lines 1-61; SHA-256 `b591547ee9a4aa395514d1d0212847e840eb0605dbc526dbfc3db53a785d673d`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/sql/1724181538.sql](sql/1724181538.sql), lines 1-79; SHA-256 `a79be4748e07d08c1d18aaf050be75b566efed48c686b647dbf096ec375d7e7e`. Complete retained body reviewed; all string literals remain opaque.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 15914-15931; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1533248517, index 1.

E5: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 13472-13481; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1533248517, index 1.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.ACTION_MENU_OPTION

Store ordered menu actions and separators.

Domains: administration, configuration, presentation.

- presentation_metadata: OBJECT_ID is the only unique key. ACTION_MENU_ID and SEQUENCE are required but their pair lacks a captured unique index; ACTION_ID is nullable for a separator or unresolved action lookup. Evidence: E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12.

E1: [DB Architecture/objects/1565248631.json](objects/1565248631.json), lines 1-418; SHA-256 `f03b991e830822cd6436c2b5867d1b8cdc8aab7858d12fa4ff9c538861758cd2`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/1724181538.sql](sql/1724181538.sql), lines 1-79; SHA-256 `a79be4748e07d08c1d18aaf050be75b566efed48c686b647dbf096ec375d7e7e`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 16310-16327; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1565248631, index 1.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 16328-16345; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1565248631, index 2.

E5: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 16346-16363; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1565248631, index 3.

E6: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 13772-13781; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1565248631, index 1.

E7: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 13782-13791; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1565248631, index 2.

E8: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 13792-13801; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1565248631, index 3.

E9: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 2258-2269; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys row for parent table 1565248631.

E10: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 2306-2317; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys row for parent table 1565248631.

E11: [DB Architecture/catalog/foreign_key_columns.json](catalog/foreign_key_columns.json), lines 1538-1545; SHA-256 `88488a254f09572a507f34c5ade8b7161a76f0806958f5a7b75a1f37044416b3`. Exact foreign_key_columns row for parent table 1565248631.

E12: [DB Architecture/catalog/foreign_key_columns.json](catalog/foreign_key_columns.json), lines 1570-1577; SHA-256 `88488a254f09572a507f34c5ade8b7161a76f0806958f5a7b75a1f37044416b3`. Exact foreign_key_columns row for parent table 1565248631.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.ADJUSTMENT_TYPE

Define inventory adjustment classifications, quantity limits and work/interface flags.

Domains: inventory, configuration.

- configuration: ADJUSTMENT_TYPE is the primary key. Description, class, frozen-inventory permission, active state, interface-upload flag, work flag and warehouse authorization are required. Minimum/maximum quantities and work-creation master are nullable. No captured check enforces minimum less than maximum, and no outgoing foreign key validates WORK_CREATION_MASTER. Caller enforcement and actual authorization remain unknown. Evidence: E1, E2, E3, E4.

E1: [DB Architecture/objects/1597248745.json](objects/1597248745.json), lines 1-523; SHA-256 `774da30a3b8122ab3848092fdaf545cb4a4c7abc0b56bae9339056b545059493`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 16598-16615; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 3215-3221; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E4: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 3257-3263; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.ADJUSTMENT_TYPE_WAREHOUSE_ACCESS

Associate an adjustment type with a warehouse identifier.

Domains: inventory, configuration.

- configuration: OBJECT_ID is the identity primary key. ADJUSTMENT_TYPE and WAREHOUSE are required, but only the adjustment type has a captured foreign key. Warehouse is nvarchar(50), wider than the warehouse identifiers in the other reviewed access tables. The adjustment/warehouse pair is not constrained unique, and this table alone does not prove valid warehouses or effective rights. Evidence: E1, E2, E3.

E1: [DB Architecture/objects/1629248859.json](objects/1629248859.json), lines 1-334; SHA-256 `5654a0162a8028aff9e9516efd844fe5f3308a8b95f69094f49e34555a0bf764`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 16868-16885; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 2342-2353; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.AR_LOT

Retains copied lot records.

Domains: inventory.

- audit_history: The empty-lot routine copies LOT here before active deletion. Evidence: E1, E2.

E1: [DB Architecture/objects/201767776.md](objects/201767776.md), lines 11-30; SHA-256 `3b20f43c90924c570bd0c6d65df7cc454d3a64c236b4eb92ba869f668b5bbf47`. Reviewed column contract.

E2: [DB Architecture/sql/1448704559.sql](sql/1448704559.sql), lines 81-124; SHA-256 `ab5e0948a8c84b089c949d96817e91f33021fc81cbdd87f6809a36893826964d`. Reviewed explicit usage supports this role.

Limits: No operational rows read. Retention, effective settings, activity and permissions remain unestablished.


## dbo.AR_LOT_ATTRIBUTE

Retains copied lot attributes.

Domains: inventory.

- audit_history: Active attributes are copied here before cleanup deletion. Evidence: E1, E2.

E1: [DB Architecture/objects/217767833.md](objects/217767833.md), lines 11-25; SHA-256 `71119ee134ae13b47a422428eda3b9a2f5cc879358813d4f86e041e096ee0eb2`. Reviewed column contract.

E2: [DB Architecture/sql/1448704559.sql](sql/1448704559.sql), lines 127-171; SHA-256 `ab5e0948a8c84b089c949d96817e91f33021fc81cbdd87f6809a36893826964d`. Reviewed explicit usage supports this role.

Limits: No operational rows read. Retention, effective settings, activity and permissions remain unestablished.


## dbo.AR_SERIAL_NUMBER

Retains copied serial records.

Domains: inventory.

- audit_history: Serial archival explicitly copies active serial fields before conditional deletion. Evidence: E1, E2.

E1: [DB Architecture/objects/489768802.md](objects/489768802.md), lines 11-30; SHA-256 `9e78c9c066c7ed6f464bac9b1417a4903b75b97b6e977da7c79d66f04466bca4`. Reviewed column contract.

E2: [DB Architecture/sql/1144703476.sql](sql/1144703476.sql), lines 20-51; SHA-256 `04dd003e9e71b5835e433bb4d09046ce0bfd11ea201ffa3bad6b7299ebf88dc0`. Reviewed explicit usage supports this role.

Limits: No operational rows read. Retention, effective settings, activity and permissions remain unestablished.


## dbo.AR_UPLOAD_ORDER_CONTAINER

Supplies retained container-shaped rows to the current/retained UNION view; no source precedence is imposed.

Domains: integration.

- integration_staging: Supplies retained container-shaped rows to the current/retained UNION view; no source precedence is imposed. Evidence: E1, E2.

E1: [DB Architecture/objects/873770170.md](objects/873770170.md), lines 9-87; SHA-256 `845d68c054316f00254060f3ff254ec37e3c031b8231736dd4be7c26df52407b`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/76579361.sql](sql/76579361.sql), lines 1-14; SHA-256 `a1185d228ad5ac6848a4b311b6abd89098df531c9b5c1569a7a079641c4c8d1e`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.AR_UPLOAD_ORDER_DETAIL

Supplies retained detail-shaped rows to the current/retained UNION view; duplicate projection rows collapse.

Domains: integration.

- integration_staging: Supplies retained detail-shaped rows to the current/retained UNION view; duplicate projection rows collapse. Evidence: E1, E2.

E1: [DB Architecture/objects/889770227.md](objects/889770227.md), lines 9-175; SHA-256 `a531b78b0f4d31dc08ffd2f51e8114390625c27739522d25a0f953264aba6963`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/92579418.sql](sql/92579418.sql), lines 1-12; SHA-256 `0c42d30f7d227cb91ce22583fb7af6006b03892ca5d4c01ba0b830470e214470`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.AR_UPLOAD_ORDER_HEADER

Supplies retained header-shaped rows to the current/retained UNION view; movement and retention policy are not established.

Domains: integration.

- integration_staging: Supplies retained header-shaped rows to the current/retained UNION view; movement and retention policy are not established. Evidence: E1, E2.

E1: [DB Architecture/objects/905770284.md](objects/905770284.md), lines 9-191; SHA-256 `36154346d4dd9ab4f6ae732d94161282e3bffe83873f49c3920fb5ec7243eb04`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/108579475.sql](sql/108579475.sql), lines 1-14; SHA-256 `384be9c6177aaedf538839b7d6e957496d4d99a7334b94717390ddb634036f45`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.BATCH_SUBMISSION_CONFIG

Describes batch-submission types and their scheduling eligibility.

Domains: configuration, work_execution.

- configuration: Record type, parameters, scheduling eligibility and description define batch-submission options. Evidence: E1.

E1: [DB Architecture/objects/1305771709.md](objects/1305771709.md), lines 11-25; SHA-256 `337213aafe6a763b7efe6bca74f6985ff88b9bb2b4f07807c7b7d3737ca391ad`. Reviewed columns support the stated storage responsibilities.

Limits: Submission history, current job state and concrete parameters are not established.


## dbo.CARRIER

Stores carrier/service identities, active flags and reusable shipping/rating attributes; reviewed getter reads exact active service.

Domains: shipping.

- master_reference: Stores carrier/service identities, active flags and reusable shipping/rating attributes; reviewed getter reads exact active service. Evidence: E1, E2.

E1: [DB Architecture/objects/1401772051.md](objects/1401772051.md), lines 9-84; SHA-256 `0029fbc2094b88031866f023a4c0d37f6e6176df6eed15ff6ad4272b01e4f275`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/1038275104.sql](sql/1038275104.sql), lines 1-19; SHA-256 `f71b5cbac4bfd04abebfc3d5708693bd3948ae30af0a9f48cc6d6f2471faa237`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.CARRIER_GROUP_HEADER

Stores carrier-group activity and rating/selection settings; reviewed getter restricts active group identity.

Domains: shipping.

- configuration: Stores carrier-group activity and rating/selection settings; reviewed getter restricts active group identity. Evidence: E1, E2.

E1: [DB Architecture/objects/1529772507.md](objects/1529772507.md), lines 9-28; SHA-256 `2444f27e990a02d50b7cc4cb73bb01ab3f30c7ae94d16ca5da0dc39240f4187c`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/487321146.sql](sql/487321146.sql), lines 1-14; SHA-256 `1b81939ce17c487886ce3201791234dc0b95ed894e25536b197691a851b164d5`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.CATCH_WEIGHT_INFORMATION

Stores inventory-linked catch weight.

Domains: function_semantics, inventory.

- reporting_read_model: Reviewed function consumes the stated fields without altering persistent rows. Evidence: E1, E2.
- transactional_state: Inventory ID, recorded weight and unit are updated/deleted in source movement. Evidence: E3, E4.

E1: [DB Architecture/objects/708509903.json](objects/708509903.json), lines 1-355; SHA-256 `19e56662a3ea4c4b1abf484d6d97a2a0223ed052f25658bf0a3cc5305d18e029`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/1736705585.sql](sql/1736705585.sql), lines 87-95; SHA-256 `3faa8494302faeb74f33dde3c2959d419b5d3dd84450ef530fc128a8f86f8a27`. Exact bounded supporting-table use.

E3: [DB Architecture/objects/708509903.md](objects/708509903.md), lines 11-25; SHA-256 `6820b3a6721bca731a063e7e187542b73eb1c9f9e9bdcfec82ce33d494623fd3`. Reviewed column contract.

E4: [DB Architecture/sql/1400704388.sql](sql/1400704388.sql), lines 755-805; SHA-256 `75f63d082a4062e9b815f5797a8c53d333828c5cf2bec75cea0e22c978d999d2`. Reviewed explicit usage supports this role.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name. No operational rows read. Retention, effective settings, activity and permissions remain unestablished.


## dbo.COMPANY

Stores company reference details and company-scoped operational settings.

Domains: shared_reference, configuration.

- master_reference: Company identity, name and addresses provide reusable party information. Evidence: E1.
- configuration: Host-interface source and upload options hold company-level integration settings. Evidence: E1.

E1: [DB Architecture/objects/1785773419.md](objects/1785773419.md), lines 11-80; SHA-256 `e89d75b3535e83972f8ed12044d6dc1ee6b58a45316b46301cb57a9af9ba9230`. Reviewed columns support the stated storage responsibilities.

Limits: No company records, addresses, endpoints or configured values were read.


## dbo.COMPANY_ACCESS

Store explicit user-to-company membership used by receipt-related presentation filters.

Domains: presentation, configuration.

- configuration: Ordinary PO receipt membership is consulted only in one configured company-authorization branch; NULL COMPANY is a separate allowance. Shipment-to-receipt selection permits an all-company profile, membership in COMPANY_ACCESS, NULL company or a coded blank-company sentinel. Neither wrapper proves the caller is the supplied username. Evidence: E1, E2, E3, E4, E5, E6, E7, E8, E9, E10.
- reporting_read_model: The cited presentation wrappers read the stated fields and preserve the stated selection/null boundaries; no mutation is performed by those uses. Evidence: E1, E2, E3, E4, E5, E6, E7, E8, E9, E10.

E1: [DB Architecture/objects/1817773533.json](objects/1817773533.json), lines 1-334; SHA-256 `1f5ebb7e787714415a8177c003dc2bc0b00f39a0ed05baa41b69bac2d0c37825`. Captured table identity and complete column definitions; this review claims only the described use roles.

E2: [DB Architecture/sql/693225870.sql](sql/693225870.sql), lines 18-40; SHA-256 `64f3074b40be9465ea1a18623d0e04870369cda9010be6442b2f478a68bad468`. Restricted ordinary PO receipt membership and NULL-company bypass.

E3: [DB Architecture/sql/949226782.sql](sql/949226782.sql), lines 25-29; SHA-256 `7a91794f9ae2a658cb76b5f3f9e4d88772572014de5b6447bbf315c077f1e759`. Shipment-to-receipt predicate using membership or all-company profile.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 18362-18379; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes record for this table; identity 1

E5: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 18380-18397; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes record for this table; identity 2

E6: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 18398-18415; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes record for this table; identity 3

E7: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 18416-18433; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes record for this table; identity 4

E8: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 18434-18451; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes record for this table; identity 5

E9: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 3326-3337; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys record for this table; identity 1514488474

E10: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 3374-3385; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys record for this table; identity 1530488531

Limits: Enabled/trusted FKs reference USER_PROFILE and COMPANY; they prove referenced records, not session authentication, effective permission or enforcement by every caller. This role does not describe all authorization logic in SCALE. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.


## dbo.CYCLE_COUNT_MASTER

Define named cycle-count selection and work-generation settings.

Domains: inventory, configuration.

- configuration: MASTER_NAME is the primary key. CREATE_WORK, ACTIVE, UPDATE_CYCLECOUNTS and WAREHOUSE_AUTHORIZATION are required fields; item/location selections and scheduling/randomization fields are nullable. MAX_REQUESTS defaults to numeric zero. The meanings of redacted flag defaults and actual scheduled-job selection are not established. Evidence: E1, E2, E3, E4, E5, E6, E7.

E1: [DB Architecture/objects/86291367.json](objects/86291367.json), lines 1-502; SHA-256 `6ded9e5695bf7bef5850aa8ffe09fbb5c8618785f70c78ecd36d1e128e3e7ec4`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 686-703; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 1367-1373; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E4: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 1395-1401; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E5: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 1423-1429; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E6: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 1458-1464; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E7: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 2550-2556; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.CYCLE_COUNT_MASTER_WAREHOUSE_ACCESS

Associate a cycle-count master with a warehouse.

Domains: inventory, configuration.

- configuration: OBJECT_ID is an identity primary key. Required MASTER_NAME and WAREHOUSE have enabled, trusted NO_ACTION foreign keys to the master and warehouse. The captured indexes do not make the master/warehouse pair unique. This association alone does not establish a particular user or master authorization decision. Evidence: E1, E2, E3, E4.

E1: [DB Architecture/objects/1397840292.json](objects/1397840292.json), lines 1-334; SHA-256 `9488f297ed7655d65796b46b35c34303ab9d6ebe3f16e5285875c779b5a6053a`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 14564-14581; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 3098-3109; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

E4: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 3146-3157; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.CYCLE_COUNT_PLAN

Track a generated cycle-count plan and its progress counters.

Domains: inventory.

- transactional_state: INTERNAL_PLAN_NUM is an identity primary key. MASTER_NAME has a nonunique index but no captured outgoing foreign key. TOTAL_OPEN, TOTAL_REVIEWED and TOTAL_CLOSED are required and default to zero; the two error counters are nullable. The metadata view calculates total transactions as open plus closed, not open plus reviewed plus closed, and uses zero guards for percentage calculations. Evidence: E1, E2, E3, E4, E5, E6, E7, E8.

E1: [DB Architecture/objects/118291481.json](objects/118291481.json), lines 1-628; SHA-256 `145dbf132d4c00e4d08b22ac04afa42e73ef11a4fa1346204c195c3ec347219a`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 902-919; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 920-937; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E4: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 1500-1506; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E5: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 1528-1534; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E6: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 1563-1569; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E7: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 1598-1604; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E8: [DB Architecture/sql/1072058905.sql](sql/1072058905.sql), lines 1-45; SHA-256 `f61ca0a50ae519198e85232c3fc8bbb8b60f83e44eb8983a75da5634bd5ac01a`. Complete reading of selected existing SQL use; no new module credit.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.CYCLE_COUNT_PREFERENCES

Describe count and adjustment preferences with quantity and price tolerances.

Domains: inventory, configuration.

- configuration: PREFERENCE_NAME is the primary key. ACTIVE, IMMEDIATE_ADJUSTMENT and IMMEDIATE_COUNT are required. Positive/negative thresholds and work type/team are nullable; price tolerances are nullable with default zero. No captured check constraint enforces a nonnegative tolerance or a relation between the positive and negative limits. Evidence: E1, E2, E3, E4, E5.

E1: [DB Architecture/objects/150291595.json](objects/150291595.json), lines 1-523; SHA-256 `14ec9e8e94d2157f27e4fff706c61b9d1324ed97cc32019fca145c8e37b6e4cc`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 1172-1189; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 1633-1639; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E4: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 1675-1681; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E5: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 1710-1716; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.CYCLE_COUNT_REQUEST

Stores cycle-count request and reconciliation state.

Domains: inventory.

- transactional_state: Count identity/assignment/expected-counted quantities and condition encode requests; threshold handling can delete/request creation. Evidence: E1, E2.

E1: [DB Architecture/objects/182291709.md](objects/182291709.md), lines 11-49; SHA-256 `2f73cbafc5c7989fc6e45236e81ec15a77e8b13e98f7d02823deee976a6c40a9`. Reviewed column contract.

E2: [DB Architecture/sql/1160703533.sql](sql/1160703533.sql), lines 119-203; SHA-256 `1723eed69b74a258bec467e61523165fb454c8a3088169c068050265307c7065`. Reviewed explicit usage supports this role.

Limits: No operational rows read. Retention, effective settings, activity and permissions remain unestablished.


## dbo.CYCLE_COUNT_THRESHOLD

Configures activity-driven cycle-count eligibility.

Domains: inventory.

- configuration: Dimensions, activation, quantity/unit and days-between govern threshold checking. Evidence: E1, E2.

E1: [DB Architecture/objects/214291823.md](objects/214291823.md), lines 11-29; SHA-256 `db88086ed61b54c4d1358bea276674a53867a06d634262728680b14fe8e02381`. Reviewed column contract.

E2: [DB Architecture/sql/1160703533.sql](sql/1160703533.sql), lines 43-75; SHA-256 `1723eed69b74a258bec467e61523165fb454c8a3088169c068050265307c7065`. Reviewed explicit usage supports this role.

Limits: No operational rows read. Retention, effective settings, activity and permissions remain unestablished.


## dbo.DASHBOARD_DATA

Persist warehouse KPI text cache and time-series snapshots, including expiration and update timestamps.

Domains: function_semantics, performance_billing_maintenance.

- reporting_read_model: Reviewed function consumes the stated fields without altering persistent rows. Evidence: E1, E2.
- reporting_read_model: Persist warehouse KPI text cache and time-series snapshots, including expiration and update timestamps. Evidence: E1, E3, E4, E5.

E1: [DB Architecture/objects/246291937.json](objects/246291937.json), lines 1-439; SHA-256 `46066cdad1cd1bf0fb595e31e02018b17e76d7e96e09bc1fa0541dcb34b22ead`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/1612181139.sql](sql/1612181139.sql), lines 331-367; SHA-256 `eb1cf3fccc19e9cdaca90a9011a207abd2eb8367b218a653c47f26ea57c8c9b1`. Exact bounded supporting-table use.

E3: [DB Architecture/sql/1436180512.sql](sql/1436180512.sql), lines 31-93; SHA-256 `4051064c7062a0de172b44170a26887c352da6e472b6f2eb072de8f8b9db6f12`. Snapshot deletion and pair insertion.

E4: [DB Architecture/sql/1532180854.sql](sql/1532180854.sql), lines 31-107; SHA-256 `7b87fd482468f23947a100209cdb0c254c8d67ff3a68d17cac08e05be12a85dc`. Cache completeness and rebuild/refresh.

E5: [DB Architecture/sql/1516180797.sql](sql/1516180797.sql), lines 20-40; SHA-256 `7c3be4a907964bf5089a8c296b2876ba0057d652484a0183e450ef53c081da47`. Text-value pivot retrieval.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.DATA_RETRIEVAL_STMT_HEADER

Store retrieval-header identity and calculation/external-source flags.

Domains: administration, configuration, presentation.

- configuration: STMT_HEADER_KEY_NUM is the primary key; the seed writes header flags but neither query text nor executes a retrieval. Evidence: E1, E2, E3, E4.

E1: [DB Architecture/objects/342292279.json](objects/342292279.json), lines 1-376; SHA-256 `71e46a00015ce9663a950b26f4090020defa2213ba5f24e33a8aee8983c85cfc`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/1836181937.sql](sql/1836181937.sql), lines 1-66; SHA-256 `b32fb3d435df077cda7fc434fb4f3d138f83d666bf6a23b511a9da39855ce9f1`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 2648-2665; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 342292279, index 1.

E4: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 1742-1751; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 342292279, index 1.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.DIF_INCOMING_MESSAGE

Stores incoming DIF payload, processing state, routing/event identifiers and timestamps; reviewed custom flow inserts Ready requests.

Domains: integration.

- integration_staging: Stores incoming DIF payload, processing state, routing/event identifiers and timestamps; reviewed custom flow inserts Ready requests. Evidence: E1, E2.

E1: [DB Architecture/objects/502292849.md](objects/502292849.md), lines 9-65; SHA-256 `26a4a8a33de9c3e71f8399c3fd9881a2b7f85120b0e6989b0b17e162804f6162`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/1877178033.sql](sql/1877178033.sql), lines 1-47; SHA-256 `bf50fa0cd04470f27387bfd64645e6661e6bd390963643a9d1ca166cbf156590`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.DOCUMENT_TYPE

Stores document identity, renderer/data-source references and five print-process/default pairs used by print selection.

Domains: shipping.

- configuration: Stores document identity, renderer/data-source references and five print-process/default pairs used by print selection. Evidence: E1, E2.

E1: [DB Architecture/objects/822293989.md](objects/822293989.md), lines 9-42; SHA-256 `66b59626875a1245f42f48fccc20bc0d8f2e8302618fb2c9b038deb4f29732b9`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/901226611.sql](sql/901226611.sql), lines 1-300; SHA-256 `5e4b1a969339ecb9c4eb7ad07570b13ff9cc514233bf15e2bc889f2706dd583f`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.DOWNLOAD_APPT_SCHEDULE

Holds incoming appointment payload and link types; receipt cleanup restricts its captured link type as well as stamp.

Domains: integration.

- integration_staging: Holds incoming appointment payload and link types; receipt cleanup restricts its captured link type as well as stamp. Evidence: E1, E2.

E1: [DB Architecture/objects/854294103.md](objects/854294103.md), lines 9-31; SHA-256 `bdee45e2f658dec5d44c588ba51ac45430e74c016a328d766baa89273c9294a6`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/446272995.sql](sql/446272995.sql), lines 1-48; SHA-256 `818454460b0aea692d6b197b6ab6d19ecb7555bbc47194cfbb56ffcc9b20dc06`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.DOWNLOAD_ITEM

Holds downloaded item interface records and condition/error/process-stamp fields; selected cleanup removes rows by process stamp.

Domains: integration, inventory.

- integration_staging: Interface identity/action/condition/error fields accompany item attributes and rules. Evidence: E1.
- integration_staging: Holds downloaded item interface records and condition/error/process-stamp fields; selected cleanup removes rows by process stamp. Evidence: E2, E3.

E1: [DB Architecture/objects/886294217.md](objects/886294217.md), lines 11-25; SHA-256 `43fce2f8a73578119c961c2ac1f3f0dd854fb6c0cab9bcf4e670d723564306ea`. Reviewed columns support the stated storage responsibilities.

E2: [DB Architecture/objects/886294217.md](objects/886294217.md), lines 9-291; SHA-256 `43fce2f8a73578119c961c2ac1f3f0dd854fb6c0cab9bcf4e670d723564306ea`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E3: [DB Architecture/sql/231320234.sql](sql/231320234.sql), lines 1-15; SHA-256 `c6785318233e09f12e30ef699ffa064e079bfda63c097ab8f45d27af24abfaf8`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Payload/control columns support the role; direction, consumer, transport and successful processing are not established from names or columns. Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.DOWNLOAD_ORDER_COMMENT

Holds incoming comment payloads with interface links and processing state; selected cleanup is table-local by stamp.

Domains: integration.

- integration_staging: Holds incoming comment payloads with interface links and processing state; selected cleanup is table-local by stamp. Evidence: E1, E2.

E1: [DB Architecture/objects/918294331.md](objects/918294331.md), lines 9-31; SHA-256 `020a5be620a745f2135ce7eb43e9c6efe7c634eb357bf08aa3bbe50ed0f23b43`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/247320291.sql](sql/247320291.sql), lines 1-41; SHA-256 `936705d417b9f7329c7a38597cc3059f1a7e9990e308f36e77ebfb878de53f52`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.DOWNLOAD_ORDER_CONTAINER

Holds incoming container-shaped payload and interface-link/state fields; selected cleanup uses stamp and optional Processed condition.

Domains: integration.

- integration_staging: Holds incoming container-shaped payload and interface-link/state fields; selected cleanup uses stamp and optional Processed condition. Evidence: E1, E2.

E1: [DB Architecture/objects/950294445.md](objects/950294445.md), lines 9-71; SHA-256 `ce473b700df136f8d0897d6f7c950d85009c637041a59d967083ac5b700e7b67`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/247320291.sql](sql/247320291.sql), lines 1-41; SHA-256 `936705d417b9f7329c7a38597cc3059f1a7e9990e308f36e77ebfb878de53f52`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.DOWNLOAD_ORDER_DETAIL

Holds incoming order-line payloads and links; directly deleted by selected batch-cleanup routines.

Domains: integration.

- integration_staging: Holds incoming order-line payloads and links; directly deleted by selected batch-cleanup routines. Evidence: E1, E2.

E1: [DB Architecture/objects/982294559.md](objects/982294559.md), lines 9-141; SHA-256 `44ab406c5870643947f5488d969c9dc8297eccd22fd46b6c3c82adbc6521b2ac`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/247320291.sql](sql/247320291.sql), lines 1-41; SHA-256 `936705d417b9f7329c7a38597cc3059f1a7e9990e308f36e77ebfb878de53f52`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.DOWNLOAD_ORDER_HEADER

Holds incoming order/shipment header-shaped records, conditions and process stamps; cleanup variants apply different conditions.

Domains: integration.

- integration_staging: Holds incoming order/shipment header-shaped records, conditions and process stamps; cleanup variants apply different conditions. Evidence: E1, E2.

E1: [DB Architecture/objects/1014294673.md](objects/1014294673.md), lines 9-170; SHA-256 `7e7d7fc29ad66c9876e172248a3580a26cd982ba78467a04ebe31ff2fa9934ce`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/247320291.sql](sql/247320291.sql), lines 1-41; SHA-256 `936705d417b9f7329c7a38597cc3059f1a7e9990e308f36e77ebfb878de53f52`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.DOWNLOAD_ORDER_VAS_ACTIVITY

Holds incoming value-added activity records; explicitly deleted by cleanup 01, not by cleanup 02.

Domains: integration.

- integration_staging: Holds incoming value-added activity records; explicitly deleted by cleanup 01, not by cleanup 02. Evidence: E1, E2.

E1: [DB Architecture/objects/1046294787.md](objects/1046294787.md), lines 9-31; SHA-256 `10a7fd7a910aa66f55e321a094b96bc674c835c1bad254141c1a096dc4e3fbad`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/247320291.sql](sql/247320291.sql), lines 1-41; SHA-256 `936705d417b9f7329c7a38597cc3059f1a7e9990e308f36e77ebfb878de53f52`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.DOWNLOAD_PURCHASE_ORDER_DETAIL

Holds incoming purchase-order lines and links; receipt cleanup directly deletes them after the header statement.

Domains: integration.

- integration_staging: Holds incoming purchase-order lines and links; receipt cleanup directly deletes them after the header statement. Evidence: E1, E2.

E1: [DB Architecture/objects/1078294901.md](objects/1078294901.md), lines 9-60; SHA-256 `869c68da18279effeb4b3008ecb1cad345c1b9cfb8692285f1ac8c13f821c138`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/446272995.sql](sql/446272995.sql), lines 1-48; SHA-256 `818454460b0aea692d6b197b6ab6d19ecb7555bbc47194cfbb56ffcc9b20dc06`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.DOWNLOAD_PURCHASE_ORDER_HEADER

Holds incoming purchase-order header payload; receipt cleanup directly deletes it before purchase-order details.

Domains: integration.

- integration_staging: Holds incoming purchase-order header payload; receipt cleanup directly deletes it before purchase-order details. Evidence: E1, E2.

E1: [DB Architecture/objects/1110295015.md](objects/1110295015.md), lines 9-59; SHA-256 `0153047f5c91845e484829be86ce7a44fd6e15ff99659d6a6226cd6477cc0b7c`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/446272995.sql](sql/446272995.sql), lines 1-48; SHA-256 `818454460b0aea692d6b197b6ab6d19ecb7555bbc47194cfbb56ffcc9b20dc06`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.DOWNLOAD_RECEIPT_CONTAINER

Holds incoming receipt-container payload and parent/link/state fields; reviewed cleanup deletes by stamp.

Domains: integration.

- integration_staging: Holds incoming receipt-container payload and parent/link/state fields; reviewed cleanup deletes by stamp. Evidence: E1, E2.

E1: [DB Architecture/objects/1142295129.md](objects/1142295129.md), lines 9-60; SHA-256 `c4b97f7a6527d040e5c177cedd69dd31abe1a05876935c584d3a2ca582c4ffd3`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/446272995.sql](sql/446272995.sql), lines 1-48; SHA-256 `818454460b0aea692d6b197b6ab6d19ecb7555bbc47194cfbb56ffcc9b20dc06`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.DOWNLOAD_RECEIPT_DETAIL

Holds incoming receipt-line payload and interface links/state; reviewed cleanup deletes by stamp.

Domains: integration.

- integration_staging: Holds incoming receipt-line payload and interface links/state; reviewed cleanup deletes by stamp. Evidence: E1, E2.

E1: [DB Architecture/objects/1174295243.md](objects/1174295243.md), lines 9-88; SHA-256 `e6b7448f9aa7670c0dab9bc10d36586394e1d39683d2cbf47ef85c105e0e719e`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/446272995.sql](sql/446272995.sql), lines 1-48; SHA-256 `818454460b0aea692d6b197b6ab6d19ecb7555bbc47194cfbb56ffcc9b20dc06`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.DOWNLOAD_RECEIPT_HEADER

Holds incoming receipt header payload and interface processing fields; reviewed cleanup deletes by stamp.

Domains: integration.

- integration_staging: Holds incoming receipt header payload and interface processing fields; reviewed cleanup deletes by stamp. Evidence: E1, E2.

E1: [DB Architecture/objects/1206295357.md](objects/1206295357.md), lines 9-77; SHA-256 `53f13c48a59ba3578379fc0c7954c71cd6ce24b0570df97290c4beb2877c0770`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/446272995.sql](sql/446272995.sql), lines 1-48; SHA-256 `818454460b0aea692d6b197b6ab6d19ecb7555bbc47194cfbb56ffcc9b20dc06`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.DOWNLOAD_SERIAL_NUMBER

Holds incoming serial-number payload and links; receipt cleanup selects process stamp without link restriction.

Domains: integration.

- integration_staging: Holds incoming serial-number payload and links; receipt cleanup selects process stamp without link restriction. Evidence: E1, E2.

E1: [DB Architecture/objects/1238295471.md](objects/1238295471.md), lines 9-30; SHA-256 `e437a7c3a340e2f053b33d02b1add2c6ab0dd1b9132ff958e5b9ae878a9be340`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/446272995.sql](sql/446272995.sql), lines 1-48; SHA-256 `818454460b0aea692d6b197b6ab6d19ecb7555bbc47194cfbb56ffcc9b20dc06`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.DYNAMIC_ACTION

Store named actions and their endpoint/security metadata.

Domains: administration, configuration, presentation.

- configuration: OBJECT_ID is the primary key; ACTION_NAME is required but has no captured unique index. ACTION_ENDPOINT_ID is required; optional FORM_ID and SECURITY_CHECKPOINT do not prove user authorization. Evidence: E1, E2, E3, E4, E5, E6, E7, E8, E9, E10.

E1: [DB Architecture/objects/1270295585.json](objects/1270295585.json), lines 1-481; SHA-256 `34cd85d01e2ec3c4bd0d0c8f03a12faa58189a2a46fd5676ee18a33887d8687c`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/1724181538.sql](sql/1724181538.sql), lines 1-79; SHA-256 `a79be4748e07d08c1d18aaf050be75b566efed48c686b647dbf096ec375d7e7e`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/sql/1884182108.sql](sql/1884182108.sql), lines 1-79; SHA-256 `b39032bd478feb33486bcc5306de5875a992cb0cfda39a65a17d6e0f76b5b712`. Complete retained body reviewed; all string literals remain opaque.

E4: [DB Architecture/sql/1900182165.sql](sql/1900182165.sql), lines 1-67; SHA-256 `007d9cf10b4f75e9d59348c571183f77b1072e03fd65d9602ea76b3007381a93`. Complete retained body reviewed; all string literals remain opaque.

E5: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 12908-12925; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1270295585, index 1.

E6: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 12926-12943; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1270295585, index 2.

E7: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 10622-10631; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1270295585, index 1.

E8: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 10632-10641; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1270295585, index 2.

E9: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 4814-4825; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys row for parent table 1270295585.

E10: [DB Architecture/catalog/foreign_key_columns.json](catalog/foreign_key_columns.json), lines 3266-3273; SHA-256 `88488a254f09572a507f34c5ade8b7161a76f0806958f5a7b75a1f37044416b3`. Exact foreign_key_columns row for parent table 1270295585.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.DYNAMIC_ACTION_RULE

Store conditions associated with dynamic actions.

Domains: administration, configuration, presentation.

- configuration: OBJECT_ID is the primary key; ACTION_ID is required and indexed. Table/column/operator/value/conjunction fields are metadata; the reviewed seed unconditionally appends rows. Evidence: E1, E2, E3, E4, E5, E6, E7, E8.

E1: [DB Architecture/objects/1302295699.json](objects/1302295699.json), lines 1-418; SHA-256 `5a6f65f3d10de1e261b83de95a1d239c7641395cf02d7d965f247cf5cb11f41e`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/1900182165.sql](sql/1900182165.sql), lines 1-67; SHA-256 `007d9cf10b4f75e9d59348c571183f77b1072e03fd65d9602ea76b3007381a93`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 13430-13447; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1302295699, index 1.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 13448-13465; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1302295699, index 2.

E5: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 11082-11091; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1302295699, index 1.

E6: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 11092-11101; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1302295699, index 2.

E7: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 4850-4861; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys row for parent table 1302295699.

E8: [DB Architecture/catalog/foreign_key_columns.json](catalog/foreign_key_columns.json), lines 3290-3297; SHA-256 `88488a254f09572a507f34c5ade8b7161a76f0806958f5a7b75a1f37044416b3`. Exact foreign_key_columns row for parent table 1302295699.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.DYNAMIC_CALLING_DETAIL

Store endpoint binding and transport metadata.

Domains: administration, configuration, presentation.

- configuration: OBJECT_ID is the primary key, with an additional unique RECORD_TYPE+IDENTIFIER key. URI and code/transform fields are nullable; ENDPOINT_TYPE and TIME_OUT are required. The seed does not populate HTTP_HEADERS/TIME_OUT or invoke the endpoint. Evidence: E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12.

E1: [DB Architecture/objects/1334295813.json](objects/1334295813.json), lines 1-691; SHA-256 `e6cefd7de2a0662def4e776a724016f1255580437bff75f9ad9a2d3ecff17bbf`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/1884182108.sql](sql/1884182108.sql), lines 1-79; SHA-256 `b39032bd478feb33486bcc5306de5875a992cb0cfda39a65a17d6e0f76b5b712`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/sql/1916182222.sql](sql/1916182222.sql), lines 1-105; SHA-256 `0685e5db616688ba9177e96eec024fa30152ee99b10abcb89c1b6efc63c2a25e`. Complete retained body reviewed; all string literals remain opaque.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 13664-13681; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1334295813, index 1.

E5: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 13682-13699; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1334295813, index 2.

E6: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 13700-13717; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1334295813, index 3.

E7: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 11262-11271; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1334295813, index 1.

E8: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 11272-11281; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1334295813, index 2.

E9: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 11282-11291; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1334295813, index 2.

E10: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 11292-11301; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1334295813, index 3.

E11: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 4874-4885; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys row for parent table 1334295813.

E12: [DB Architecture/catalog/foreign_key_columns.json](catalog/foreign_key_columns.json), lines 3306-3313; SHA-256 `88488a254f09572a507f34c5ade8b7161a76f0806958f5a7b75a1f37044416b3`. Exact foreign_key_columns row for parent table 1334295813.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.DYNAMIC_CALLING_HEADER

Define dynamic-calling record types and supported endpoint categories.

Domains: administration, configuration, presentation.

- configuration: RECORD_TYPE is the primary key; SUPPORTED_ENDPOINT_TYPES is required. The seed preserves existing headers and does not test endpoint availability. Evidence: E1, E2, E3, E4.

E1: [DB Architecture/objects/1366295927.json](objects/1366295927.json), lines 1-355; SHA-256 `67e60962aaf4f36d5a87abfab95fc82604fd5d8833f52306d55bd2fbc1228911`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/1932182279.sql](sql/1932182279.sql), lines 1-38; SHA-256 `8e687c505e16b00aea6c4cf174a0623ebb1ea84f59393efb7f643a6c9093daea`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 14456-14473; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1366295927, index 1.

E4: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 12412-12421; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1366295927, index 1.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.EXIT_POINT

Store named exit-point hooks and their category/binding.

Domains: administration, configuration, presentation.

- configuration: EXIT_POINT is the primary key; category and ACTIVE are required, EXECUTION_IDENTIFIER nullable. Registration does not execute a hook. Evidence: E1, E2, E3, E4, E5, E6, E7, E8.

E1: [DB Architecture/objects/1494296383.json](objects/1494296383.json), lines 1-376; SHA-256 `f87686d5c57b07507d1cfad3905dd5f5ba63b5ccc053afe69494985775400c88`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/1948182336.sql](sql/1948182336.sql), lines 1-64; SHA-256 `83ba3bbbf81221fbe42846926807aed364a83df642886461bcce50d850523d3b`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 15590-15607; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1494296383, index 1.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 15608-15625; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1494296383, index 2.

E5: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 13222-13231; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1494296383, index 1.

E6: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 13232-13241; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1494296383, index 2.

E7: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 38-49; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys row for parent table 1494296383.

E8: [DB Architecture/catalog/foreign_key_columns.json](catalog/foreign_key_columns.json), lines 26-33; SHA-256 `88488a254f09572a507f34c5ade8b7161a76f0806958f5a7b75a1f37044416b3`. Exact foreign_key_columns row for parent table 1494296383.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.EXIT_POINT_CATEGORY

Define categories for exit-point metadata.

Domains: administration, configuration, presentation.

- master_reference: EXIT_POINT_CATEGORY is the primary key; description and system flag are required. The reviewed seed inserts absent categories only. Evidence: E1, E2, E3, E4.

E1: [DB Architecture/objects/1526296497.json](objects/1526296497.json), lines 1-334; SHA-256 `bb5fdf84f2a9ae447616e5f4bf6bfd50ca199e2a8ab4a75f3b82f729f61e8857`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/1946802343.sql](sql/1946802343.sql), lines 1-33; SHA-256 `ecd5dcd6ff750841a886f6adae91aee493471d5476a058005181ad4727819de2`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 15860-15877; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1526296497, index 1.

E4: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 13442-13451; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1526296497, index 1.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.EXIT_POINT_DETAIL

Store ordered exit-point parameter definitions.

Domains: administration, configuration, presentation.

- configuration: OBJECT_ID is the primary key; EXIT_POINT+SEQUENCE has a unique index. SEQUENCE is nullable while parameter, type and direction are required; NULL equality in the seed is not NULL-safe duplicate detection. Evidence: E1, E2, E3, E4, E5, E6, E7, E8, E9.

E1: [DB Architecture/objects/1558296611.json](objects/1558296611.json), lines 1-397; SHA-256 `1eb943183ea6efc14ead43f37f54231d2690a08ba96e77f80351719e11aea95d`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/1964182393.sql](sql/1964182393.sql), lines 1-64; SHA-256 `465dc69d5db1815a7a7d0c8bfa0ed56e3cf68ef82390ef534b4dab8fa7f26fad`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 16220-16237; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1558296611, index 1.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 16238-16255; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1558296611, index 2.

E5: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 13712-13721; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1558296611, index 1.

E6: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 13722-13731; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1558296611, index 2.

E7: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 13732-13741; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1558296611, index 2.

E8: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 86-97; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys row for parent table 1558296611.

E9: [DB Architecture/catalog/foreign_key_columns.json](catalog/foreign_key_columns.json), lines 58-65; SHA-256 `88488a254f09572a507f34c5ade8b7161a76f0806958f5a7b75a1f37044416b3`. Exact foreign_key_columns row for parent table 1558296611.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.FEATURE_MANAGEMENT

Defines named feature settings consumed by the feature resolver.

Domains: work_execution.

- configuration: ENABLED participates in global and user-scoped feature resolution. Evidence: E1, E2.

E1: [DB Architecture/objects/2071730483.json](objects/2071730483.json), lines 1-418; SHA-256 `423160b747b4f8de2a30edd247beb1c7baf3c12383ea9e7f8dfbef60ac3dad0e`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/680701823.sql](sql/680701823.sql), lines 9-16; SHA-256 `77e132ef10237d4ba41dc2326eb114aa18def1a75579f7db4b065d6856aa260e`. Feature lookup CASE and user join.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.FEATURE_MANAGEMENT_USER

Associates feature IDs with users for feature resolution.

Domains: work_execution.

- configuration: The feature resolver tests for an exact matching user row. Evidence: E1, E2.

E1: [DB Architecture/objects/2103730597.json](objects/2103730597.json), lines 1-334; SHA-256 `2f19ee2ae73dbfb8233458c72d692b72960fe3be368cbb80fd254473646734ad`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/680701823.sql](sql/680701823.sql), lines 9-16; SHA-256 `77e132ef10237d4ba41dc2326eb114aa18def1a75579f7db4b065d6856aa260e`. User override join.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.FILTER_ATTRIBUTES

Define filterable attributes and validation metadata.

Domains: administration, configuration, presentation.

- configuration: ATTRIBUTE alone is the primary key; RECORD_TYPE and VALIDATION_LIST are nullable. The seed cannot create a separate same-named attribute merely by supplying another record type. Evidence: E1, E2, E3, E4.

E1: [DB Architecture/objects/1622296839.json](objects/1622296839.json), lines 1-376; SHA-256 `2a006ef3c312fb3be859c57186c389bfd50772085eb4d2914199e2b16601793b`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/1996182507.sql](sql/1996182507.sql), lines 1-65; SHA-256 `9eccc3fdc47784344b93d9c69a2a736680e7b70b7817f31bcfecb2c1093e699f`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 16796-16813; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1622296839, index 1.

E4: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 14032-14041; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1622296839, index 1.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.FILTER_CONFIG_DETAIL

Store named filter definitions for record types.

Domains: administration, configuration, presentation.

- configuration: OBJECT_ID is the primary key and RECORD_TYPE+FILTER_NAME is separately unique. FILTER_STATEMENT may be NULL. The reviewed seed stores optional filter text without executing it. Evidence: E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11.

E1: [DB Architecture/objects/1654296953.json](objects/1654296953.json), lines 1-418; SHA-256 `d40098e9835534bd783960fdcb39e99f18e5ae3eb9b2cf7740cabcb83cfe768f`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/1962802400.sql](sql/1962802400.sql), lines 1-66; SHA-256 `509da87fb8cf9e09307cd25f36eca5edd9195806c79e679b24887d62da286368`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 17030-17047; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1654296953, index 1.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 17048-17065; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1654296953, index 2.

E5: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 17066-17083; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1654296953, index 3.

E6: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 14162-14171; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1654296953, index 1.

E7: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 14172-14181; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1654296953, index 2.

E8: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 14182-14191; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1654296953, index 2.

E9: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 14192-14201; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1654296953, index 3.

E10: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 158-169; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys row for parent table 1654296953.

E11: [DB Architecture/catalog/foreign_key_columns.json](catalog/foreign_key_columns.json), lines 106-113; SHA-256 `88488a254f09572a507f34c5ade8b7161a76f0806958f5a7b75a1f37044416b3`. Exact foreign_key_columns row for parent table 1654296953.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.FILTER_CONFIG_HEADER

Define filter record types and expression-building metadata.

Domains: administration, configuration, presentation.

- configuration: RECORD_TYPE is the primary key; DO_PATH and matching/order flags are required. JOIN_CLAUSE, TABLE_DO_NAME and VALUE_TABLE_NAME are nullable; seed writes these as metadata. Evidence: E1, E2, E3, E4.

E1: [DB Architecture/objects/1686297067.json](objects/1686297067.json), lines 1-460; SHA-256 `1802896e46f190b2c55619ea881eee1fcefbafd6fb951c6ccd853168511d90db`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/1978802457.sql](sql/1978802457.sql), lines 1-75; SHA-256 `837bec565498c48f1f476b26ad6def16221d3988f98a080f1c8b7df53a005040`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 17336-17353; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1686297067, index 1.

E4: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 14382-14391; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1686297067, index 1.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.FILTER_STATEMENT

Store ordered terms in named filter expressions.

Domains: administration, configuration, presentation.

- configuration: The primary key is RECORD_TYPE+FILTER_NAME+SEQUENCE. Operand/attribute are required while literal, conjunction and parenthesis counts are nullable; the seed does not validate expression grammar. Evidence: E1, E2, E3, E4, E5, E6.

E1: [DB Architecture/objects/1782297409.json](objects/1782297409.json), lines 1-460; SHA-256 `34539971b063767b677102ba164866958f86ec5d33fa250999d3f2ef5805d0b9`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/1994802514.sql](sql/1994802514.sql), lines 1-77; SHA-256 `3e6d2b72c77ce3990f63c3ea63804ea5fa9d8e30eaddb66ab8c5e1c3202ff341`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 18002-18019; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1782297409, index 1.

E4: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 14802-14811; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1782297409, index 1.

E5: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 14812-14821; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1782297409, index 1.

E6: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 14822-14831; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1782297409, index 1.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.FORM

Store form identifiers consulted by the monitoring-builder wrapper when suggesting a new form number.

Domains: presentation, configuration.

- presentation_metadata: The only FORM use in this wrapper is MAX(FORM_ID)+1 when @internalFormId=0. A nonzero or NULL argument follows the CASE alternative and is returned as supplied. The wrapper returns presentation metadata in five result sets and does not insert a FORM row, reserve an identifier or verify an explicitly supplied identifier exists. Evidence: E1, E2, E3, E4.
- reporting_read_model: The cited presentation wrappers read the stated fields and preserve the stated selection/null boundaries; no mutation is performed by those uses. Evidence: E1, E2, E3, E4.

E1: [DB Architecture/objects/1878297751.json](objects/1878297751.json), lines 1-460; SHA-256 `fb2545fde280f65d7805fe1b72193684a5b0ea55754ad3597640dd2d31f42b3d`. Captured table identity and complete column definitions; this review claims only the described use roles.

E2: [DB Architecture/sql/869226497.sql](sql/869226497.sql), lines 23-48; SHA-256 `906f47f5af041484e2931989e79b784d35c64c787154494c17be7edf3389a2bb`. First of five metadata result sets uses MAX(FORM_ID)+1 when input is0.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 18812-18829; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes record for this table; identity 1

E4: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 2851-2857; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact default_constraints record for this table; identity 1684917074

Limits: The table contains form/security descriptors, but this use site does not establish UI access or activation. A suggested number is not a created form, successful insert or sequence-object reservation. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.


## dbo.FUNCTIONAL_AREA_STATUS_FLOW

Maps functional areas and status identities to numeric status flow.

Domains: receiving_shipping.

- configuration: Action resolver reads SYSTEM_STS-to-STATUS mapping. Evidence: E1, E2.

E1: [DB Architecture/objects/1942297979.json](objects/1942297979.json), lines 1-523; SHA-256 `240b4641972e3222a5d0e27aab9b4d2444843c5d52194c445931a7b392763319`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/2113754933.sql](sql/2113754933.sql), lines 38-44; SHA-256 `554a8cd67dceb9ecaa61f3ce2864629bce9628df5e8a8a7e53de3fd3194ed2ac`. Two-layer status mapping read.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.GENERIC_CONFIG_DETAIL

Store typed configuration entries used as two separate packing-option lists.

Domains: presentation, configuration.

- configuration: The first packing list selects DESCRIPTION/IDENTIFIER by a fixed SYS1VALUE and a caller-resolved allow-over-pack display value; it has no RECORD_TYPE or ACTIVE predicate. The second list selects identifier/description for one fixed RECORD_TYPE and ACTIVE=Y. Both are read projections without defaulting missing description or updating configuration. Evidence: E1, E2, E3, E4, E5, E6, E7.
- reporting_read_model: The cited presentation wrappers read the stated fields and preserve the stated selection/null boundaries; no mutation is performed by those uses. Evidence: E1, E2, E3, E4, E5, E6, E7.

E1: [DB Architecture/objects/2038298321.json](objects/2038298321.json), lines 1-670; SHA-256 `a0b88261a9f7906afe2ef3ef436775ebfc1084569788ede93fd3f4052e965d91`. Captured table identity and complete column definitions; this review claims only the described use roles.

E2: [DB Architecture/sql/1109227352.sql](sql/1109227352.sql), lines 66-76; SHA-256 `736df22832cd0bf57f0cf670fd86afd57f26e414ec5185530d9e111325a617e7`. Packing lists use different generic-configuration predicates.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 20252-20269; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes record for this table; identity 1

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 20270-20287; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes record for this table; identity 2

E5: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 20288-20305; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes record for this table; identity 3

E6: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 20306-20323; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes record for this table; identity 4

E7: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 266-277; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys record for this table; identity 103007448

Limits: Generic configuration is not globally one value per identifier. Scope/active/precedence depends on each consumer; this role covers only the two cited packing lists. No effective configuration entries, packing actions or current over-pack authorization were observed. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.


## dbo.GENERIC_CONFIG_HEADER

Define generic-configuration field names, types, lookups and required flags.

Domains: administration, configuration, presentation.

- configuration: RECORD_TYPE is the primary key. Five system and eight user field groups have nullable name/type/lookup columns and required flags. The reviewed procedure replaces all listed groups on update without validating existing detail values. Evidence: E1, E2, E3, E4.

E1: [DB Architecture/objects/2070298435.json](objects/2070298435.json), lines 1-1426; SHA-256 `ce2197b2637e146627d02603f3a78cdfeb9cc7747e8e71d78443a72e8f73291d`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/2042802685.sql](sql/2042802685.sql), lines 1-255; SHA-256 `1cc19b146e76042f668465bb9fc1e76c25b1d17559a74d10da0b821bace98ae1`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 20504-20521; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 2070298435, index 1.

E4: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 16922-16931; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 2070298435, index 1.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.IA_WORK_INSTRUCTION

Stores inactive copies of work instructions and supplies combined monitor history.

Domains: work_execution.

- transactional_state: Reviewed deactivation routines insert copied instructions. Evidence: E1, E2, E3.
- reporting_read_model: Combined view includes these rows in reads; immutability is not established. Evidence: E1, E2, E3.

E1: [DB Architecture/objects/2102298549.json](objects/2102298549.json), lines 1-2182; SHA-256 `b4b66db66443fc81a7160373129a262ad9beda8969345a1eedf8db1764f3fd49`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/890798581.sql](sql/890798581.sql), lines 16-27; SHA-256 `1810216ab801e6b9730ea7e24731f8342eebc305c708959cb447e8a40dc4e65b`. Explicit copy then delete flow.

E3: [DB Architecture/sql/172579703.sql](sql/172579703.sql), lines 5-9; SHA-256 `f8ad80899fdf8de790c7a4e5df028bf9981cc3f774a55f1a3f99538f86e109c2`. UNION ALL consumer.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.IMMEDIATE_NEEDS_REQUEST

Record prioritized item demand and optional fulfillment linkage.

Domains: inventory.

- transactional_state: INTERNAL_REQUEST_NUM is the identity primary key. Warehouse, request type, priority, item, quantities/units and logged time are required; company, target location, line and fulfillment identity are nullable. The receipt-line view joins by item and normalized company while treating null fulfillment as zero. That join has no warehouse or receipt-line predicate and can multiply rows; it cannot establish an exact receipt-to-demand relationship. Evidence: E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12.

E1: [DB Architecture/objects/2134298663.json](objects/2134298663.json), lines 1-691; SHA-256 `62bc0e6ab368187920b9699ab2f7c94509d2435bf972b0b7315f8821ce9a87ea`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 21404-21421; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 21422-21439; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 21440-21457; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E5: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 21458-21475; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E6: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 21476-21493; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E7: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 21494-21511; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E8: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 21512-21529; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E9: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 21530-21547; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E10: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 518-529; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

E11: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 554-565; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

E12: [DB Architecture/sql/1280059646.sql](sql/1280059646.sql), lines 1-109; SHA-256 `ecb27e1ccd04eaafdce6768137bfd18ef391bbafd8ed51043f5a326b84b8fdff`. Complete reading of selected existing SQL use; no new module credit.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.IMMEDIATE_NEEDS_TRIGGER

Define immediate-needs request types with priority and work-creation flags.

Domains: inventory, configuration.

- configuration: REQUEST_KEY_NUM is the primary key referenced by request rows. REQUEST_DESC, PRIORITY, CREATE_WORK, ACTIVE and SYSTEM_CREATED are required. This captured object is a user table, not a SQL DML trigger. Flag defaults are redacted; the existence of configuration fields does not establish request creation or enabled processing. Evidence: E1, E2, E3, E4.

E1: [DB Architecture/objects/18815129.json](objects/18815129.json), lines 1-397; SHA-256 `89caa910ff28d764d7a9b269501469f6c529567cd2501d67df6e9573b005f9d2`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 110-127; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 3565-3571; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E4: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 3607-3613; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.INTERFACE_DATA_MAP_DETAIL

Defines named-map field positions, names and lengths; retrieval alone does not validate mapping correctness.

Domains: shipping.

- configuration: Defines named-map field positions, names and lengths; retrieval alone does not validate mapping correctness. Evidence: E1, E2.

E1: [DB Architecture/objects/82815357.md](objects/82815357.md), lines 9-27; SHA-256 `c03344d19f4d5831a4a59d3cd6c2bcf27c0ac91faf2503e9c392f4bf5bd5c445`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/871322514.sql](sql/871322514.sql), lines 1-12; SHA-256 `7feecf695100e21289ea3a05dbd378c856b180402358014ffa72ed0b7eb6af0e`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.INTERFACE_DATA_MAP_HEADER

Defines map identity, record/action/direction and interface type used by exact or prefix selectors.

Domains: integration.

- configuration: Defines map identity, record/action/direction and interface type used by exact or prefix selectors. Evidence: E1, E2.

E1: [DB Architecture/objects/114815471.md](objects/114815471.md), lines 9-28; SHA-256 `1c476216a09ff4319377bf963f2a15921eabc64d29b11be80a6ff00d8cb272b7`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/1182275617.sql](sql/1182275617.sql), lines 1-22; SHA-256 `7157fbb2a0fba75e51b61e0c42d1fa612fb75e4ae73a58a3a2994dfd877d36aa`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.INTERFACE_DETAIL

Holds interface execution definitions, sequence, active flag, mode/process/event and staging settings; these getters retrieve rows but do not execute them.

Domains: integration.

- configuration: Holds interface execution definitions, sequence, active flag, mode/process/event and staging settings; these getters retrieve rows but do not execute them. Evidence: E1, E2.

E1: [DB Architecture/objects/162815642.md](objects/162815642.md), lines 9-43; SHA-256 `f3209601f1a64eb04aa9b70cfa4c82f8a5f600c70cbc0779a8b52ab9216922c9`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/919322685.sql](sql/919322685.sql), lines 1-13; SHA-256 `d6bff57f6b1e9bd37aed4a2dd7072293eed89b643bb812e1dc80be050abe8a7a`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.INTERFACE_ERROR

Stores interface error identities, messages, file-path references, processing stamps and reference fields exposed by read adapters.

Domains: integration, audit.

- audit_history: Error identity/message, file references, process/mode, notification flag and identifiers describe error records. Evidence: E1.
- audit_history: Stores interface error identities, messages, file-path references, processing stamps and reference fields exposed by read adapters. Evidence: E2, E3.

E1: [DB Architecture/objects/194815756.md](objects/194815756.md), lines 11-29; SHA-256 `b01877101fd969c0c6eebc64331363af1b0fca937c3563f8d6e715169bf0aaee`. Reviewed columns support the stated storage responsibilities.

E2: [DB Architecture/objects/194815756.md](objects/194815756.md), lines 9-51; SHA-256 `b01877101fd969c0c6eebc64331363af1b0fca937c3563f8d6e715169bf0aaee`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E3: [DB Architecture/sql/1112703362.sql](sql/1112703362.sql), lines 1-21; SHA-256 `8a5d30ac4125a5bed42f645adcd7cea0ca399bf77b0eedca9499dd93110d12d6`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: No messages, paths or error occurrences were read; retention, completeness and replay/retry semantics are unverified. Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.INTERFACE_FLOW_STEP

Stores interface step timing, sequence, action type and process definitions; reviewed getters impose no execution order.

Domains: integration.

- configuration: Stores interface step timing, sequence, action type and process definitions; reviewed getters impose no execution order. Evidence: E1, E2.

E1: [DB Architecture/objects/226815870.md](objects/226815870.md), lines 9-29; SHA-256 `31b07559eda2c23c5472eb83336137a2bfbdd1d342649c0ab493548f189f30ac`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/1246275845.sql](sql/1246275845.sql), lines 1-18; SHA-256 `b0d0348a515a8486e349f63d1d66e325f9c90f9fb4e1b9d3eec46794bab05e4a`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.INTERFACE_HEADER

Holds interface header identities and descriptions retrieved by header key.

Domains: integration.

- configuration: Holds interface header identities and descriptions retrieved by header key. Evidence: E1, E2.

E1: [DB Architecture/objects/258815984.md](objects/258815984.md), lines 9-25; SHA-256 `2f2bab61320047f609125f7d84faac694bc945944fcb84809dc78ec64995d205`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/935322742.sql](sql/935322742.sql), lines 1-12; SHA-256 `a7c3cfd49faf763393e025e97ec9222db71f7d3476b73517f2870bf23dd24cf9`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.INVENTORY_ARGUMENT

Groups inventory arguments.

Domains: inventory.

- transactional_state: Group/name/value columns supply selected serial IDs and lot attributes. Evidence: E1, E2.

E1: [DB Architecture/objects/354816326.md](objects/354816326.md), lines 11-14; SHA-256 `58b858c5cac57bcdb5216466e759641d544e19161cc4fcc745ed2e8e2945f27b`. Reviewed column contract.

E2: [DB Architecture/sql/1256703875.sql](sql/1256703875.sql), lines 26-47; SHA-256 `a1a3c696a9ef59cbeb3bd70f6a1a07ad5d2b91da8542a0667d0440d40c07fee5`. Reviewed explicit usage supports this role.

Limits: No operational rows read. Retention, effective settings, activity and permissions remain unestablished.


## dbo.ITEM

Combines item reference data with item-level warehouse behavior settings.

Domains: inventory, shared_reference.

- master_reference: Item/company identity, description and product attributes define reusable item records. Evidence: E1.
- configuration: Locating/allocation rules and lot/serial/tracking controls attach behavior settings to an item. Evidence: E1.

E1: [DB Architecture/objects/386816440.md](objects/386816440.md), lines 12-81; SHA-256 `1839edfac39cdeb258b4a3990ac52c361589350d4ba01169db6b4028f6a7678c`. Reviewed columns support the stated storage responsibilities.

Limits: A control column does not establish its configured value or enabled behavior.


## dbo.ITEM_LOCATION_ASSIGNMENT

Associate an item with an allocation location in a warehouse.

Domains: inventory.

- master_reference: INTERNAL_ITEM_LOC_NUM is the identity primary key. ITEM, warehouse and ALLOCATION_LOC are required; COMPANY and QUANTITY_UM are nullable. The item/company and location/warehouse indexes are nonunique. The movement-class view left-joins on item, allocation location, warehouse and null-aware company; duplicate matching assignment rows can multiply the projection. Captured foreign keys cover company and warehouse, not item or location. Evidence: E1, E2, E3, E4, E5, E6, E7, E8.

E1: [DB Architecture/objects/466816725.json](objects/466816725.json), lines 1-397; SHA-256 `c6313af902031a7ea0c1a22434766e9121637481a5e1540eed58c352fda94314`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 4142-4159; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 4160-4177; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 4178-4195; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E5: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 4196-4213; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E6: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 1118-1129; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

E7: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 1154-1165; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

E8: [DB Architecture/sql/572581128.sql](sql/572581128.sql), lines 1-51; SHA-256 `645d00297f8eeff8f3c92b264203523c809bef4d25046669b32053ff8c2aa55b`. Complete reading of selected existing SQL use; no new module credit.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.ITEM_LOCATION_CAPACITY

Stores item/class and location/type replenishment capacity candidates.

Domains: allocation_wave_replenishment.

- configuration: Resolver fallback is driven by scope and current output state. Evidence: E1, E2.

E1: [DB Architecture/objects/498816839.json](objects/498816839.json), lines 1-523; SHA-256 `9c9983244aa40201176508aee00f09761217d755bbe06d0b82f0a12557bf7c5f`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/23319493.sql](sql/23319493.sql), lines 36-104; SHA-256 `43396e6c7991646988e2f6da79d277b3b24d29a13de5bb00f596bc96abdafb50`. Conditional capacity fallback.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.ITEM_SUBSTITUTE

Record candidate substitute item identities and their sequence.

Domains: inventory.

- master_reference: OBJECT_ID is the identity primary key. Both required item identities reference ITEM through enabled, trusted NO_ACTION foreign keys. The unique key is INTERNAL_ITEM_NUM, SEQUENCE, SUBSTITUTE together. It does not make a sequence unique independently of its substitute, nor prevent the same substitute at different sequences. No reviewed caller establishes selection order or activation. Evidence: E1, E2, E3, E4, E5, E6.

E1: [DB Architecture/objects/530816953.json](objects/530816953.json), lines 1-355; SHA-256 `f01c03486450c446b44dc8d67e514784283acf68c086449b4efeba4ce6fd1612`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 4880-4897; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 4898-4915; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 4916-4933; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E5: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 1262-1273; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

E6: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 4178-4189; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.ITEM_TEMPLATE

Define a named item format with a separator and up to five typed field lengths.

Domains: inventory, configuration.

- configuration: ITEM_TEMPLATE is the primary key. The separator, first field length/type and ACTIVE are required; field pairs two through five are nullable. Lengths are numeric(2,0), not automatically positive. No captured check constraint validates a supported field type, matched nullable pairs or a parsing algorithm. Evidence: E1, E2.

E1: [DB Architecture/objects/562817067.json](objects/562817067.json), lines 1-544; SHA-256 `d785da64466bab7c16248972f1c8ac6db28a60971ed7870e4365dd935c89228c`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 5312-5329; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.ITEM_UNIT_OF_MEASURE

Stores item/company/class conversion and measurement sets with routine-specific fallback.

Domains: allocation_wave_replenishment, function_semantics.

- configuration: Item-specific existence can suppress item-class fallback. Evidence: E1, E2.
- configuration: Reviewed function consumes the stated fields without altering persistent rows. Evidence: E1, E3.

E1: [DB Architecture/objects/594817181.json](objects/594817181.json), lines 1-691; SHA-256 `6ce2314022c56c51b50d1fafcd5f809186f7a76b7e0c4bfce431b98b5cb347a9`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/1834801944.sql](sql/1834801944.sql), lines 23-142; SHA-256 `04f74553073971af9cd383ea7375c6cbe1ab33c0582ef70ae70f6a0e98e60838`. Conversion candidate and sequence use.

E3: [DB Architecture/sql/1832705927.sql](sql/1832705927.sql), lines 176-218; SHA-256 `7cd5d4dfaa7e8b66800c0cf6c5a3b2e6c8841f874015d83b966c36a730366a93`. Exact bounded supporting-table use.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.LABEL_IMAGE_DATA

Stores container-linked binary label images and returns-label flag; read adapter chooses ordinary versus returns data.

Domains: shipping.

- transactional_state: Stores container-linked binary label images and returns-label flag; read adapter chooses ordinary versus returns data. Evidence: E1, E2.

E1: [DB Architecture/objects/825874109.md](objects/825874109.md), lines 9-27; SHA-256 `fab4282f33ee347e29b9013261a766fa2f018e5aa6390a860c649759fc30a59e`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/968702849.sql](sql/968702849.sql), lines 1-25; SHA-256 `b930acfbbbaf54dcdcbc3f2fbd7db8235474da5324809a621f04680d2ca55fc7`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.LAUNCH_MASTER

Defines wave master identity/configuration; the reviewed dialog only projects constants from its rows.

Domains: allocation_wave_replenishment.

- configuration: Wave orchestration uses masters by vendor documentation; this body does not execute the master. Evidence: E1, E2.

E1: [DB Architecture/objects/1010818663.json](objects/1010818663.json), lines 1-733; SHA-256 `bd6276234d85baed4e3033b0133f5ae2e64d80bf4f42ea0f37b49063d5d6e3c5`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/421224901.sql](sql/421224901.sql), lines 9-18; SHA-256 `84cef4b66e9066dbf4d14640b889b32ef010c53becf0707af9e099d13978e300`. Unfiltered constant projection from masters.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.LAUNCH_STATISTICS

Supply launch boundaries and shipment/line totals for fully contained interval summaries or active-wave samples.

Domains: allocation_wave_replenishment, performance_billing_maintenance.

- transactional_state: Wave helpers change membership-related progress and aggregate totals. Evidence: E1, E2, E3.
- reporting_read_model: Insight/statistics helpers consume stored summaries, not direct physical execution. Evidence: E1, E2, E3.
- audit_history: Supply launch boundaries and shipment/line totals for fully contained interval summaries or active-wave samples. Evidence: E1, E4, E5.

E1: [DB Architecture/objects/1074818891.json](objects/1074818891.json), lines 1-817; SHA-256 `41a8f3000db11353a43209daf7f4aad35e628ac136af1496861294d7129c8c08`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/350272653.sql](sql/350272653.sql), lines 52-87; SHA-256 `8026bb16d0256cfa3e34753d399d1fa40e29b8acd464d549daaf8602e16aa194`. Progress/total refresh and return boundary.

E3: [DB Architecture/sql/270272368.sql](sql/270272368.sql), lines 21-57; SHA-256 `aacdfce3227f5d5c19de109874c15978c9ecd1d88512a7736c5642ab78f3a3b0`. Detail-pane projections.

E4: [DB Architecture/sql/1621229176.sql](sql/1621229176.sql), lines 16-25; SHA-256 `60f840c0869d988c7d7a03f60d9d0bfcaa5ad37b971d6e2c83cdea9a4d854817`. Fully contained launch aggregation.

E5: [DB Architecture/sql/1797229803.sql](sql/1797229803.sql), lines 26-35; SHA-256 `e7cd393778912f91e93dfbffc03a5e887023db164ef2180bc327bd7cb89abc6b`. Inclusive active-wave sampling.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.LOCATING_REQUEST

Retain a locating request with item quantity, source/destination and work-creation bookkeeping.

Domains: inventory.

- transactional_state: INTERNAL_LOC_REQ_NUM is the identity primary key. ITEM, LOCATE_QTY, INVENTORY_TRACKING, INTERNAL_NUM, INTERNAL_NUM_TYPE and WORK_CREATED are required. Source/destination warehouse, locations, units, conversion values and receipt/container identifiers are nullable. The internal reference and launch indexes are nonunique; only company and from/to warehouse have captured outgoing foreign keys. No positive-quantity check, completion-state meaning or queue consumer is established. Evidence: E1, E2, E3, E4, E5, E6, E7, E8, E9.

E1: [DB Architecture/objects/1202819347.json](objects/1202819347.json), lines 1-1846; SHA-256 `6ba578bc32a35171642bd39526fdca9408db586840ca7d42b7feaa8c3c60e5b7`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 12368-12385; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 12386-12403; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 12404-12421; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E5: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 12422-12439; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E6: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 12440-12457; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E7: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 1826-1837; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

E8: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 1850-1861; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

E9: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 1886-1897; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.LOCATING_RULE_DETAIL

Associate locating-rule entries with a named strategy and location selection.

Domains: inventory, configuration.

- configuration: OBJECT_ID is the identity primary key. LOCATING_NAME references its header; SEQUENCE and STRATEGY are required while LOCATION_SEL and SPLIT_QTY are nullable. No captured unique key makes LOCATING_NAME plus SEQUENCE unique. The schema does not establish how equal sequence values are ordered or whether quantity splitting is active. Evidence: E1, E2, E3, E4.

E1: [DB Architecture/objects/1234819461.json](objects/1234819461.json), lines 1-397; SHA-256 `fdc983d34eb41cf3b602911303b5e4a9d7b693875517f904d82aa79260f79a91`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 12620-12637; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 12638-12655; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E4: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 1910-1921; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.LOCATING_RULE_HEADER

Defines locating rules including activation and delayed-locating flags.

Domains: receiving_shipping.

- configuration: Named header retrieval exposes rules but does not select destinations. Evidence: E1, E2.

E1: [DB Architecture/objects/1266819575.json](objects/1266819575.json), lines 1-355; SHA-256 `a3fad763373135c3dad807d74fb80792112190849a56c972ce797a767cda61f2`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/1175323597.sql](sql/1175323597.sql), lines 8-15; SHA-256 `9037fc534df0ef023708507d2628bf752b18614d9263bb469740dfce3e512660`. Equality-only locating-header lookup.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.LOCATION

Stores real-time replenishment flags and destination zone/template metadata.

Domains: inventory, work_execution, allocation_wave_replenishment.

- master_reference: Warehouse/location identity and zone attributes define reusable location references. Evidence: E1, E2.
- configuration: Picking/putaway sequences and movement controls influence warehouse movement. Evidence: E1, E2.
- transactional_state: Status/locate-lock fields represent mutable state, and inventory code explicitly updates location status. Evidence: E1, E2.
- master_reference: Location/warehouse key supplies destination context. Evidence: E3, E4, E5.
- configuration: RPLN_EVALUATION and REAL_TIME_RPLN influence marking. Evidence: E3, E4, E5.

E1: [DB Architecture/objects/1298819689.md](objects/1298819689.md), lines 11-52; SHA-256 `5344f85ed29f053f01d4188311c415f82c971878416ccbc1b28f4329f490b012`. Reviewed columns support the stated storage responsibilities.

E2: [DB Architecture/sql/1400704388.sql](sql/1400704388.sql), lines 325-340; SHA-256 `75f63d082a4062e9b815f5797a8c53d333828c5cf2bec75cea0e22c978d999d2`. Inventory handling can insert inventory and update LOCATION.LOCATION_STS.

E3: [DB Architecture/objects/1298819689.json](objects/1298819689.json), lines 1-1174; SHA-256 `a06637b35d763f060234c5dcdad5950b42d3cee1d41e0877760ad5110b8c3363`. Column types, nullability and object identity support the stated structural role.

E4: [DB Architecture/sql/197224103.sql](sql/197224103.sql), lines 19-81; SHA-256 `9679de63cd615ef991516e9773f4585ae32206e2750c961ea4bf9d47f7da03f6`. Marking and history request.

E5: [DB Architecture/sql/1404180398.sql](sql/1404180398.sql), lines 22-41; SHA-256 `a527bc32567208f0db3b03322552712a641464e33d1f204d7cf5715405f4ff9a`. Destination metadata assignment.

Limits: Current availability, capacity and operator eligibility are unknown. No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.LOCATION_INVENTORY

Stores inventory quantities and identity variants used in replenishment cancellation/cleanup.

Domains: inventory, allocation_wave_replenishment.

- transactional_state: Location/item/company/lot keys coexist with on-hand, in-transit, allocated and suspense quantities. Evidence: E1, E2, E3.
- transactional_state: Cancellation subtracts allocated/in-transit; cleanup removes zero-quantity rows. Evidence: E4, E5, E6.

E1: [DB Architecture/objects/1362819917.md](objects/1362819917.md), lines 11-50; SHA-256 `c77fe1c89b28039d752fbb4beb1f87d35980d9f9976a66951f3fb142bb1344c9`. Reviewed columns support the stated storage responsibilities.

E2: [DB Architecture/sql/1400704388.sql](sql/1400704388.sql), lines 497-519; SHA-256 `75f63d082a4062e9b815f5797a8c53d333828c5cf2bec75cea0e22c978d999d2`. Conditional location-inventory deletion.

E3: [DB Architecture/sql/1400704388.sql](sql/1400704388.sql), lines 610-614; SHA-256 `75f63d082a4062e9b815f5797a8c53d333828c5cf2bec75cea0e22c978d999d2`. Explicit location-inventory update.

E4: [DB Architecture/objects/1362819917.json](objects/1362819917.json), lines 1-1027; SHA-256 `38f1526d383c99525c93da4d2bc2139a41e97648a72e0f432d3f09f55c40faa4`. Column types, nullability and object identity support the stated structural role.

E5: [DB Architecture/sql/988178916.sql](sql/988178916.sql), lines 24-145; SHA-256 `ebda03e703ec6002f5089f4de170ea826e869e8ff12073e97c88abdd75be220c`. Two-sided cancellation mutation.

E6: [DB Architecture/sql/1288703989.sql](sql/1288703989.sql), lines 17-67; SHA-256 `ed2fe8a5b640dee867ac779ff92f01f46bff25d77f71c1856ebd85974aa73f4f`. Broader identity cleanup scope.

Limits: No stock quantities were read; quantity effects depend on transaction flags and callers. No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.LOCATION_INVENTORY_ATTRIBUTES

Stores location-inventory attribute sets.

Domains: function_semantics, inventory.

- reporting_read_model: Reviewed function consumes the stated fields without altering persistent rows. Evidence: E1, E2.
- transactional_state: Twenty attributes and optional shipping-container linkage are copied by destination placement. Evidence: E3, E4.

E1: [DB Architecture/objects/1394820031.json](objects/1394820031.json), lines 1-733; SHA-256 `9f4e63d3323b6d8fdfa05a3aa60ff9977381fac134ef166184b82761c0470516`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/1640705243.sql](sql/1640705243.sql), lines 32-60; SHA-256 `c67a204561da81005427972c7aea9318dbfc07b36ead546cdac42afd732842f7`. Exact bounded supporting-table use.

E3: [DB Architecture/objects/1394820031.md](objects/1394820031.md), lines 11-43; SHA-256 `618269aad3abb5fbc65ebaf1f0b8803395f0e07bb63fd5c101fe16f8917393a6`. Reviewed column contract.

E4: [DB Architecture/sql/1464704616.sql](sql/1464704616.sql), lines 543-580; SHA-256 `8986ffa4b9635c50100e3f8b6b00a2b4a29f3cc25f0f8357337d80ac760579de`. Reviewed explicit usage supports this role.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name. No operational rows read. Retention, effective settings, activity and permissions remain unestablished.


## dbo.LOCATION_TYPE

Store location-type codes and dimensions displayed by the active location-type selector.

Domains: presentation, configuration.

- master_reference: The wrapper selects LOCATION_TYPE, LENGTH, WIDTH, HEIGHT and DIMENSION_UM for ACTIVE=Y, ordered by the type code. It does not evaluate location capacity, unit compatibility or whether a warehouse uses the selected type. MAXIMUM_WEIGHT and WEIGHT_UM are stored but are not projected by this wrapper. Evidence: E1, E2, E3, E4.
- reporting_read_model: The cited presentation wrappers read the stated fields and preserve the stated selection/null boundaries; no mutation is performed by those uses. Evidence: E1, E2, E3, E4.

E1: [DB Architecture/objects/1458820259.json](objects/1458820259.json), lines 1-439; SHA-256 `bfef516f085839cc65d7f12910978269b3b01f1ad500aa6d259c25dc92e08d55`. Captured table identity and complete column definitions; this review claims only the described use roles.

E2: [DB Architecture/sql/741226041.sql](sql/741226041.sql), lines 11-19; SHA-256 `a5e9106f37a4111b00b1bc22647ae6a574ba12cd1858991de94b754d98e29c9b`. Active location-type/dimension projection.

E3: [DB Architecture/sql/652581413.sql](sql/652581413.sql), lines 2-3; SHA-256 `9909b339cce32cf65f8aba5d4fd37e40153b9aef79a5a6f622f05284e8f03845`. Bound shared numeric-zero default, without new module-contract credit.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 14924-14941; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes record for this table; identity 1

Limits: No captured check constraint on this table establishes positive dimensions or valid capacity policy. Other location-type consumers and actual dimensional configuration remain outside this role review. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.


## dbo.LOCATION_UNIT_OF_MEASURE

Stores inventory-linked unit/package measurements.

Domains: function_semantics, inventory.

- configuration: Reviewed function consumes the stated fields without altering persistent rows. Evidence: E1, E2.
- transactional_state: Inventory/container/location linkage and conversion/dimension fields accompany unit movement. Evidence: E3, E4.

E1: [DB Architecture/objects/1490820373.json](objects/1490820373.json), lines 1-691; SHA-256 `7ff75f58ecab555775a93b78ec870d7475955dd9c78b10fa5f4ff9ae607a5b26`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/1816705870.sql](sql/1816705870.sql), lines 46-73; SHA-256 `0299d93edc38fb585f8ec11a5b4d4147f0a9334e64675e2e49abb8eb0746eb4c`. Exact bounded supporting-table use.

E3: [DB Architecture/objects/1490820373.md](objects/1490820373.md), lines 11-41; SHA-256 `3d1a6f2621f1ace4371009c135906449769a73c7b321e7c2caf45619c407367b`. Reviewed column contract.

E4: [DB Architecture/sql/1400704388.sql](sql/1400704388.sql), lines 440-483; SHA-256 `75f63d082a4062e9b815f5797a8c53d333828c5cf2bec75cea0e22c978d999d2`. Reviewed explicit usage supports this role.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name. No operational rows read. Retention, effective settings, activity and permissions remain unestablished.


## dbo.LOOKUP_REFERENCE

Store lookup field names and type descriptors returned for a requested record type.

Domains: presentation, configuration.

- presentation_metadata: The wrapper filters only RECORD_TYPE and projects TABLE_FIELD1..10 and their type markers. It also returns the passed warehouse value/field as presentation values. TABLE_NAME, CONFIG_RECORD_TYPE, INCLUDE_WAREHOUSE and USE_ACTIVE_FLAG are not used as filters by this wrapper; no target table is queried or modified here. Evidence: E1, E2, E3, E4, E5.
- reporting_read_model: The cited presentation wrappers read the stated fields and preserve the stated selection/null boundaries; no mutation is performed by those uses. Evidence: E1, E2, E3, E4, E5.

E1: [DB Architecture/objects/1522820487.json](objects/1522820487.json), lines 1-796; SHA-256 `e1bbeac4219bf5939daeea2a6bb0492e914d7b7bf5d4959f1dc1a7928825c117`. Captured table identity and complete column definitions; this review claims only the described use roles.

E2: [DB Architecture/sql/773226155.sql](sql/773226155.sql), lines 27-59; SHA-256 `6e814eb187167bb0834a3d5c5ca93128ff6612f0c61facce014a305a4859add0`. Lookup field/type projection and warehouse argument echo.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 15842-15859; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes record for this table; identity 1

E4: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 1815-1821; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact default_constraints record for this table; identity 977438556

E5: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 1843-1849; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact default_constraints record for this table; identity 993438613

Limits: Configured field text is metadata, not proof that the field exists or that a lookup is authorized/operational. No row values, arbitrary lookup names, UI schema or current configuration were read. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.


## dbo.LOT

Stores current lot identity and state.

Domains: inventory.

- transactional_state: Lot/item/company/warehouse identity and expiration/frozen/status fields are inserted and later eligible for cleanup. Evidence: E1, E2.

E1: [DB Architecture/objects/1554820601.md](objects/1554820601.md), lines 11-30; SHA-256 `c8cf09fe186ad34bb37b1db44440f43bbf5cff804458300556efdcd43d1b9278`. Reviewed column contract.

E2: [DB Architecture/sql/1432704502.sql](sql/1432704502.sql), lines 69-105; SHA-256 `3f5cd7b8b517b41c09ea4cb9df5422be5f94fd61aa93668b0dca27ea12d2b261`. Reviewed explicit usage supports this role.

Limits: No operational rows read. Retention, effective settings, activity and permissions remain unestablished.


## dbo.LOT_ATTRIBUTE

Stores template-keyed lot values.

Domains: inventory.

- transactional_state: Lot/template IDs and value are populated from inventory arguments. Evidence: E1, E2.

E1: [DB Architecture/objects/1586820715.md](objects/1586820715.md), lines 11-25; SHA-256 `4fb1d2a449dd18dde291db87f63cc5631b735141c279126ba789200a2640bea4`. Reviewed column contract.

E2: [DB Architecture/sql/1256703875.sql](sql/1256703875.sql), lines 26-47; SHA-256 `a1a3c696a9ef59cbeb3bd70f6a1a07ad5d2b91da8542a0667d0440d40c07fee5`. Reviewed explicit usage supports this role.

Limits: No operational rows read. Retention, effective settings, activity and permissions remain unestablished.


## dbo.MAIN_UI_SCREEN

Store screen binding, routing and menu metadata.

Domains: administration, configuration, presentation.

- presentation_metadata: OBJECT_ID is the primary key, with unique FORM_ID+ACTIVE and a foreign key to FORM. PATH and object/restriction/default identifiers are nullable. Procedure count checks do not replace uniqueness and do not establish a rendered or authorized screen. Evidence: E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13.

E1: [DB Architecture/objects/1682821057.json](objects/1682821057.json), lines 1-586; SHA-256 `2071da68b12146673a756a770111fa15e20c94fe92d2786efcbfe6cb00fc22d2`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/24699486.sql](sql/24699486.sql), lines 1-69; SHA-256 `257012b40dc256a6359fab0116a98a2246673253d679fe443a1c24f9e8828bc4`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/sql/40699543.sql](sql/40699543.sql), lines 1-65; SHA-256 `2fec9184e7b74d491156bd25af60fd5c1b6c9b9e1c3444bd55f6edb6cfaa0177`. Complete retained body reviewed; all string literals remain opaque.

E4: [DB Architecture/sql/2124182963.sql](sql/2124182963.sql), lines 1-105; SHA-256 `8132e6c957040ce527763c47397163e4bec96660a357689fe99edee73f4946db`. Complete retained body reviewed; all string literals remain opaque.

E5: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 17282-17299; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1682821057, index 1.

E6: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 17300-17317; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1682821057, index 2.

E7: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 17318-17335; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1682821057, index 3.

E8: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 14342-14351; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1682821057, index 1.

E9: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 14352-14361; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1682821057, index 2.

E10: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 14362-14371; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1682821057, index 2.

E11: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 14372-14381; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1682821057, index 3.

E12: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 3686-3697; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys row for parent table 1682821057.

E13: [DB Architecture/catalog/foreign_key_columns.json](catalog/foreign_key_columns.json), lines 2506-2513; SHA-256 `88488a254f09572a507f34c5ade8b7161a76f0806958f5a7b75a1f37044416b3`. Exact foreign_key_columns row for parent table 1682821057.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.MAIN_UI_TEMP_FUN_GRP_XREF

Associate UI templates with functional groups.

Domains: administration, configuration, presentation.

- presentation_metadata: OBJECT_ID is the only unique key; MAIN_UI_TEMPLATE_ID and FUNCTIONAL_GROUP are required. The seed joins by template name and avoids existing pairs, but that logical pair is not backed by a captured unique index. Evidence: E1, E2, E3, E4, E5, E6, E7, E8.

E1: [DB Architecture/objects/1730821228.json](objects/1730821228.json), lines 1-334; SHA-256 `43bd5ebe068794d0abfb0903643c494dc28ba26566f7a52be1315c9fa23d2ee4`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/8699429.sql](sql/8699429.sql), lines 1-62; SHA-256 `2e076e1f1eb2994a855aa3e58ee09fc40050459ccdbd0448b623baa820e46f07`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 17642-17659; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1730821228, index 1.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 17660-17677; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1730821228, index 2.

E5: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 14582-14591; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1730821228, index 1.

E6: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 14592-14601; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1730821228, index 2.

E7: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 2702-2713; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys row for parent table 1730821228.

E8: [DB Architecture/catalog/foreign_key_columns.json](catalog/foreign_key_columns.json), lines 1834-1841; SHA-256 `88488a254f09572a507f34c5ade8b7161a76f0806958f5a7b75a1f37044416b3`. Exact foreign_key_columns row for parent table 1730821228.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.MAIN_UI_TEMPLATE

Store named main-UI templates.

Domains: administration, configuration, presentation.

- presentation_metadata: OBJECT_ID is the only captured unique key; TEMPLATE is required without a captured unique name index. The seed uses a name-based existence guard, so concurrency cannot be inferred safe from that guard. Evidence: E1, E2, E3, E4, E5.

E1: [DB Architecture/objects/1762821342.json](objects/1762821342.json), lines 1-355; SHA-256 `1faada3239c22af219b4ed10fb072ac0bc0660d33d172542a3bc48b148afa42e`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/8699429.sql](sql/8699429.sql), lines 1-62; SHA-256 `2e076e1f1eb2994a855aa3e58ee09fc40050459ccdbd0448b623baa820e46f07`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/sql/2140183020.sql](sql/2140183020.sql), lines 1-63; SHA-256 `d62db712ef9355749a50c6c950df8b49cf6a33605c9a72bfcde75893a248285f`. Complete retained body reviewed; all string literals remain opaque.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 17876-17893; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1762821342, index 1.

E5: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 14732-14741; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1762821342, index 1.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.MAIN_UI_WM_LICENSE_XREF

Associate screen identities with license-module metadata.

Domains: administration, configuration, presentation.

- configuration: OBJECT_ID is the primary key; screen/license/advanced fields are required, without a unique index on their combined logical tuple. These stored links do not establish license entitlement. Evidence: E1, E2, E3, E4, E5, E6, E7, E8, E9.

E1: [DB Architecture/objects/1794821456.json](objects/1794821456.json), lines 1-355; SHA-256 `7b1aa776e766dc55f431bf5b380af1ebb1aa10f5fd3f4249c81ae33bfc9acbd4`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/24699486.sql](sql/24699486.sql), lines 1-69; SHA-256 `257012b40dc256a6359fab0116a98a2246673253d679fe443a1c24f9e8828bc4`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/sql/40699543.sql](sql/40699543.sql), lines 1-65; SHA-256 `2fec9184e7b74d491156bd25af60fd5c1b6c9b9e1c3444bd55f6edb6cfaa0177`. Complete retained body reviewed; all string literals remain opaque.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 18110-18127; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1794821456, index 1.

E5: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 18128-18145; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1794821456, index 2.

E6: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 14902-14911; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1794821456, index 1.

E7: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 14912-14921; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1794821456, index 2.

E8: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 2738-2749; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys row for parent table 1794821456.

E9: [DB Architecture/catalog/foreign_key_columns.json](catalog/foreign_key_columns.json), lines 1866-1873; SHA-256 `88488a254f09572a507f34c5ade8b7161a76f0806958f5a7b75a1f37044416b3`. Exact foreign_key_columns row for parent table 1794821456.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.ORDER_DETAIL

Stores order-line condition and open quantity targeted by wave completion.

Domains: allocation_wave_replenishment.

- transactional_state: Selected-wave sum replaces open quantity for matching order/ERP line. Evidence: E1, E2.

E1: [DB Architecture/objects/2082822482.json](objects/2082822482.json), lines 1-2686; SHA-256 `de4db98450937a4a8b3d25f1d3845e40c08597cdc0850f571af7d663d73988ee`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/1324180113.sql](sql/1324180113.sql), lines 20-47; SHA-256 `b5dce494366abfcc2734de0791fbee747c75861e1c8cb67a3624cd9179ae8586`. Grouped wave update.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.ORDER_HEADER

Stores order condition and its timestamp.

Domains: allocation_wave_replenishment.

- transactional_state: Direct completion helper writes supplied condition without line rollup. Evidence: E1, E2.

E1: [DB Architecture/objects/2114822596.json](objects/2114822596.json), lines 1-2434; SHA-256 `5ba3f1663d44494c65cde3db8732b6acaf8c864adb2eb940f601d659e2196e6a`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/1340180170.sql](sql/1340180170.sql), lines 20-30; SHA-256 `e2b4af66378327687a5f34123e503468e68f934e15b3107a03915a3ad9a3d1e8`. Condition/timestamp assignment.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.PACKING_PREFERENCES

Stores packing/QC preference flags read through user preference selection; getter does not enforce inspection actions.

Domains: shipping.

- configuration: Stores packing/QC preference flags read through user preference selection; getter does not enforce inspection actions. Evidence: E1, E2.

E1: [DB Architecture/objects/287340088.md](objects/287340088.md), lines 9-48; SHA-256 `65abb06c92dc080d73857feb9d0354ffa16b64de1552155f70220a8ce44868d7`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/1205227694.sql](sql/1205227694.sql), lines 1-86; SHA-256 `aad03af2d2969904b5975d7ff2a5a7e7e8e584e3874ede1de2017bfb74404295`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.PICK_LOCATION_GROUP_DETAIL

Store sequenced location-selection criteria within a pick-location group.

Domains: inventory, configuration.

- configuration: The composite primary key is PICK_LOCATION_GROUP and SEQUENCE. Warehouse, start/end locations and WORK_ZONES are nullable. Required group and optional warehouse have enabled, trusted NO_ACTION foreign keys. The sequence key distinguishes rule rows, but the interpretation of ranges, zone-list syntax and null scope requires the caller. Evidence: E1, E2, E3, E4, E5, E6.

E1: [DB Architecture/objects/607341228.json](objects/607341228.json), lines 1-397; SHA-256 `9d574611306766b5fa41a5ce29f4a7e622c7e6be819789016848e9e7f5fa47f8`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 5744-5761; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 5762-5779; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 5780-5797; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E5: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 4034-4045; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

E6: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 4070-4081; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.PICK_LOCATION_GROUP_HEADER

Name a reusable pick-location group.

Domains: inventory, configuration.

- configuration: PICK_LOCATION_GROUP is the primary key; ACTIVE is required and DESCRIPTION is nullable. Its detail rows carry location-selection criteria. The table defines the group identity; a stored ACTIVE field alone does not prove a caller filters inactive groups. Evidence: E1, E2.

E1: [DB Architecture/objects/639341342.json](objects/639341342.json), lines 1-334; SHA-256 `772162b1a630ea20655144ce9340798c7f7e59a4bc410d666d7800b650bf092a`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 6392-6409; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.PICKING_GROUP_DETAIL

Associate sequenced picking-group entries with pick-location groups.

Domains: inventory, configuration.

- configuration: The primary key is PICKING_GROUP and SEQUENCE. PICK_LOCATION_GROUP is nullable. Enabled, trusted NO_ACTION foreign keys bind the required picking group and optional pick-location group. The key does not prevent the same location group from appearing at multiple sequences. No caller ordering or null fallback is asserted. Evidence: E1, E2, E3, E4, E5, E6.

E1: [DB Architecture/objects/671341456.json](objects/671341456.json), lines 1-334; SHA-256 `8f98821dd73eb2757f853ec8085e6275245a2abdfa2977e5de20714c17a24f2e`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 6626-6643; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 6644-6661; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 6662-6679; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E5: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 4118-4129; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

E6: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 4154-4165; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.PICKING_GROUP_HEADER

Define a named picking group with optional loose/full container limits.

Domains: inventory, configuration.

- configuration: PICKING_GROUP is the primary key and ACTIVE is required. NUMBER_OF_LOOSE_CONTAINERS and NUMBER_OF_FULL_CONTAINERS are nullable numeric(19,5), so the schema alone does not restrict them to nonnegative integers or establish enforcement. No captured check constraints supply those restrictions. Evidence: E1, E2.

E1: [DB Architecture/objects/703341570.json](objects/703341570.json), lines 1-376; SHA-256 `7a943508ebd4ba4754e5622b6f0fcd7b7fc013bad1930a94188b30402d1216b4`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 7310-7327; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.PROCESS_HISTORY

Stores timestamped process/action history and contextual identifiers.

Domains: audit, work_execution.

- audit_history: Process/action, activity time, identifiers and message columns define process-event records. Evidence: E1.

E1: [DB Architecture/objects/911342311.md](objects/911342311.md), lines 13-20; SHA-256 `73f63239fd81f5bca1fdfaf711c486cebc6b7893c2d468121ef1e87f620961fd`. Reviewed columns support the stated storage responsibilities.

Limits: Schema does not prove start/end pairing, complete process durations or immutable history.


## dbo.PURCHASE_ORDER_DETAIL

Store purchase-order lines and open quantities selected for ordinary or TPM receipt presentation.

Domains: presentation, receiving_work_orders.

- transactional_state: Both wrappers filter PURCHASE_ORDER_OBJECT_ID and OPEN_QUANTITY>0, project line/item/company/unit and total/open quantity, and order LINE_NUMBER then ITEM. OPEN_QUANTITY is projected twice; this is not a quantity reservation or decrement. Ordinary receipt selection uses USER_PROFILE.COMPANY_AUTH and COMPANY_ACCESS but also permits NULL company independently. The TPM wrapper accepts username/culture yet uses neither in its SELECT filter. Evidence: E1, E2, E3, E4, E5, E6, E7, E8, E9.
- reporting_read_model: The cited presentation wrappers read the stated fields and preserve the stated selection/null boundaries; no mutation is performed by those uses. Evidence: E1, E2, E3, E4, E5, E6, E7, E8, E9.

E1: [DB Architecture/objects/943342425.json](objects/943342425.json), lines 1-985; SHA-256 `5ea46c66e5f4afbd6807d7089ed3dc74e4c33488950bf88066a066293a49fa72`. Captured table identity and complete column definitions; this review claims only the described use roles.

E2: [DB Architecture/sql/693225870.sql](sql/693225870.sql), lines 18-42; SHA-256 `64f3074b40be9465ea1a18623d0e04870369cda9010be6442b2f478a68bad468`. Ordinary receipt selection with supplied-user company predicate.

E3: [DB Architecture/sql/709225927.sql](sql/709225927.sql), lines 14-31; SHA-256 `6864b7e5532ab71305861994ec8e23130c63c15b0d860e114c6d10f03a2cafaa`. TPM selection without a company-access predicate.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 9416-9433; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes record for this table; identity 1

E5: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 9434-9451; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes record for this table; identity 2

E6: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 4286-4297; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys record for this table; identity 1879013775

E7: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 2718-2724; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact default_constraints record for this table; identity 1585440722

E8: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 2739-2745; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact default_constraints record for this table; identity 1601440779

E9: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 2760-2766; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact default_constraints record for this table; identity 1617440836

Limits: Header FK establishes a valid header identity, not item/company eligibility, active receipt state or actual receipt creation. No PO/shipment rows, identities, quantities or live authorization were read. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.


## dbo.PURCHASE_ORDER_HEADER

Store purchase-order header context projected by ordinary and TPM receipt presentation wrappers.

Domains: presentation, receiving_work_orders.

- transactional_state: Both wrappers select by the supplied OBJECT_ID only. They project the purchase-order ID, source contact/address metadata, company and warehouse; TPM additionally projects the ship-from group. Neither wrapper filters STATUS, closed date, company access, warehouse membership or open line quantity, and neither creates a receipt. Culture is accepted but not used in these SELECTs. Evidence: E1, E2, E3, E4.
- reporting_read_model: The cited presentation wrappers read the stated fields and preserve the stated selection/null boundaries; no mutation is performed by those uses. Evidence: E1, E2, E3, E4.

E1: [DB Architecture/objects/975342539.json](objects/975342539.json), lines 1-985; SHA-256 `0c48838a3328404e69db81b3ead1c243f4f877f0e335a86bef8d2a12e40ee4e5`. Captured table identity and complete column definitions; this review claims only the described use roles.

E2: [DB Architecture/sql/933226725.sql](sql/933226725.sql), lines 14-36; SHA-256 `fa87aecaae4ef175c302a33f900dc11d15dcd982f4be9935bb8d058510bd30e8`. Ordinary header projection by OBJECT_ID.

E3: [DB Architecture/sql/981226896.sql](sql/981226896.sql), lines 15-50; SHA-256 `3edd484685e34be712e850d00e376f695b7580db6848475313429ef49ed250d9`. TPM projection adds ship-from fields.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 9812-9829; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes record for this table; identity 1

Limits: No outgoing FK is captured for this header table; this absence is a snapshot metadata fact, not proof that application or external constraints never validate its fields. No contact/address/business data was read; only field names/types and wrapper projection were reviewed. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.


## dbo.PUTAWAY_GROUP

Represent a putaway group, its closed state and optional assigned user/location.

Domains: inventory.

- transactional_state: INTERNAL_GROUP_NUM is the identity primary key. The location reference and warehouse are nullable foreign keys; GROUP_ID and USER_NAME are also nullable. CLOSED is required with a redacted default. The metadata view preserves groups through left joins and can yield multiple rows through receipt containers; its shape is not one row per group. Evidence: E1, E2, E3, E4, E5, E6, E7, E8.

E1: [DB Architecture/objects/1007342653.json](objects/1007342653.json), lines 1-397; SHA-256 `52aa23147091f6cde1871db747be7f35461bf86100bff0c0fd2a9bc5d6a78e6f`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 10136-10153; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 10154-10171; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 10172-10189; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E5: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 4322-4333; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

E6: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 4358-4369; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

E7: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 2781-2787; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E8: [DB Architecture/sql/1232059475.sql](sql/1232059475.sql), lines 1-35; SHA-256 `82420f049e1fc10754966f58d95d2070f1b898630b689e612adba764672ee377`. Complete reading of selected existing SQL use; no new module credit.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.PUTAWAY_GROUP_LOCATION

Define putaway-group location rules and assignment options.

Domains: inventory, configuration.

- configuration: INTERNAL_GROUP_LOC_NUM is the identity primary key. The named group location, ASSIGNMENT_METHOD, ONE_PER_USER and VERIFY_GROUP_ID are required; location bounds, unit list, zone, warehouse and MAX_UNITS are nullable. The name/warehouse pair is not constrained unique. The view reads the descriptive name by internal ID; it does not apply these assignment settings. Evidence: E1, E2, E3, E4, E5, E6.

E1: [DB Architecture/objects/1039342767.json](objects/1039342767.json), lines 1-502; SHA-256 `d895469c143bdf7a1c8363c76da8326383e57993a99216c9e01593ad2fe3a0d3`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 10460-10477; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 2802-2808; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E4: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 2823-2829; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E5: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 2844-2850; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E6: [DB Architecture/sql/1232059475.sql](sql/1232059475.sql), lines 1-35; SHA-256 `82420f049e1fc10754966f58d95d2070f1b898630b689e612adba764672ee377`. Complete reading of selected existing SQL use; no new module credit.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.RATE_WEIGHT_BREAK_DTL

Store minimum/maximum weight ranges under a header ID; exact range existence controls helper insertion.

Domains: performance_billing_maintenance.

- configuration: Store minimum/maximum weight ranges under a header ID; exact range existence controls helper insertion. Evidence: E1, E2.

E1: [DB Architecture/objects/1231343451.json](objects/1231343451.json), lines 1-355; SHA-256 `c5515e84125fa6f5296d6da1029a89e5abadca596711226d5f5a1fd067e58506`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/152699942.sql](sql/152699942.sql), lines 28-65; SHA-256 `c902ad302af70b0de107f639a92e93f34bb17a24525de2e5bc7d6735f0f49b76`. Detail insertion and exact range check.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.RATE_WEIGHT_BREAK_HDR

Store a named active/minimum weight-break configuration header selected by the insert helpers.

Domains: performance_billing_maintenance.

- configuration: Store a named active/minimum weight-break configuration header selected by the insert helpers. Evidence: E1, E2, E3.

E1: [DB Architecture/objects/1263343565.json](objects/1263343565.json), lines 1-376; SHA-256 `31cd4d9afecffc9250c945cab427c05d79a86666609ff552c0426984b0eac761`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/168699999.sql](sql/168699999.sql), lines 28-62; SHA-256 `75353b3a2aaa8f9904facc069abb3aae515182ac8f6d190ee47bb54351f8d44e`. Guarded header insertion.

E3: [DB Architecture/sql/152699942.sql](sql/152699942.sql), lines 56-65; SHA-256 `c902ad302af70b0de107f639a92e93f34bb17a24525de2e5bc7d6735f0f49b76`. Header lookup and scalar identity subquery.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.RECEIPT_CONTAINER

Stores receipt container identities, status and locating-rule association.

Domains: receiving_shipping.

- transactional_state: Identifier helper writes CONTAINER_ID. Evidence: E1, E2.

E1: [DB Architecture/objects/1487344363.json](objects/1487344363.json), lines 1-1384; SHA-256 `0366d5074a3cdc26dcff98d7979d08acc161d9daa92671f1381332231c09de18`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/2103678542.sql](sql/2103678542.sql), lines 55-59; SHA-256 `bdc04cd2a06b69859e4321248666d20781243da1a4dfbdb896e1d4536d568a1c`. Input is used as numeric internal row key for identifier UPDATE.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.RECEIPT_DETAIL

Represents receipt lines and quantities used in receiving and placement.

Domains: receiving, inventory.

- transactional_state: Line identity, total/open quantity, item/lot and expected inventory status retain inbound line state. Evidence: E1.

E1: [DB Architecture/objects/1551344591.md](objects/1551344591.md), lines 11-67; SHA-256 `8d8ee0dc17de58dc9fd82197597fc85ce7047640ed2ecde7b00526e4ab5ca2dd`. Reviewed columns support the stated storage responsibilities.

Limits: No current quantities, placement choices or configured putaway rules were read.


## dbo.RECEIPT_HEADER

Receipt header state includes progress and nullable yard association.

Domains: receiving, receiving_shipping.

- transactional_state: Receipt identity, leading/trailing statuses and arrival/unitization timestamps retain inbound progress. Evidence: E1, E2.
- transactional_state: Receipt/yard triggers mutate the link and stamps. Evidence: E3, E4.

E1: [DB Architecture/objects/1599344762.md](objects/1599344762.md), lines 11-91; SHA-256 `5a926ff252f226cc241cc0e3205c246e66fb1a3626d7282d9fe70425e5c61f9e`. Reviewed columns support the stated storage responsibilities.

E2: [DB Architecture/sql/720057651.sql](sql/720057651.sql), lines 3-29; SHA-256 `b30f95dbe9d69a2adcf3cdd7fa26dc0a986685c363af5b0236683bf888c28f05`. An AFTER INSERT trigger can update trailer-yard association and stamps.

E3: [DB Architecture/objects/1599344762.json](objects/1599344762.json), lines 1-1783; SHA-256 `ebf448bb1df70ee1a9c08d66aad457a4a5051c9c71249322978ce2161f30ffa8`. Column types, nullability and object identity support the stated structural role.

E4: [DB Architecture/sql/736057708.sql](sql/736057708.sql), lines 14-32; SHA-256 `716ca062537be2d52d536067457f15f1c8f08a26567cc2f2fbe0cec1e0b29beb`. Trailer-targeted update may clear the link.

Limits: Actual receipt progress and trailer matching were not observed. No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.RECEIVING_PREFERENCE_USER_AUTHORIZATION

Associate users with receiving preference definitions.

Domains: inventory, configuration.

- configuration: OBJECT_ID is the identity primary key. Required user and preference references have enabled, trusted NO_ACTION foreign keys. Unlike adjustment-user authorization, this table has no captured unique user/preference pair. DeleteUserProfileReferences removes all matching target-user rows. Neither the association nor cleanup proves the current user is authorized or which preference is selected. Evidence: E1, E2, E3, E4, E5.

E1: [DB Architecture/objects/1711345161.json](objects/1711345161.json), lines 1-334; SHA-256 `b05ab2638eb3fd5a66847d8e030d20b553490192750ba6c802f06973049eabb7`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 17552-17569; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 542-553; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

E4: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 566-577; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

E5: [DB Architecture/sql/568701424.sql](sql/568701424.sql), lines 1-23; SHA-256 `cd532e390b24b1eafa31a8cbe112bf08c34051992ffe408a5078cbc3d88a3336`. Complete reading of selected existing SQL use; no new module credit.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.RECEIVING_PREFERENCES

Define receipt checking, inventory status, locating, putaway and authorization options.

Domains: inventory, configuration.

- configuration: PREFERENCE_NAME is the primary key. Required fields include default status/dock, locating/assignment methods, work and QC flags, and USER_AUTHORIZATION. GS1_SCAN_REQUIRED and application-identifier template are nullable. INITIATION_METHOD is NOT NULL although its captured default is NULL: omission does not supply a valid value without some other write behavior. Other literal defaults remain redacted; actual precedence and enabled behavior require application evidence. Evidence: E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15, E16.

E1: [DB Architecture/objects/1743345275.json](objects/1743345275.json), lines 1-859; SHA-256 `840694e3c8ff84b891503da9376dddfcde08cd8cd7165a577c9e01baa549b7e4`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 17732-17749; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 3278-3284; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E4: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 3320-3326; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E5: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 3355-3361; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E6: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 3404-3410; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E7: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 3446-3452; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E8: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 3488-3494; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E9: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 3523-3529; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E10: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 3558-3564; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E11: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 3600-3606; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E12: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 3642-3648; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E13: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 3670-3676; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E14: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 3698-3704; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E15: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 3726-3732; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E16: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 3754-3760; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.REPLENISHMENT_MASTER

Define named replenishment selection, allocation and work-creation settings.

Domains: inventory, configuration.

- configuration: REPLENISHMENT_NAME is the primary key. ALLOCATION_RULE is a nullable foreign key. ACTIVE, REPLENISHMENT_TYPE, CREATE_MULTIPLE_REQUESTS, WORK_CREATION_METHOD, CONSOLIDATE, ALLOCATE_ANY_UM_TO_CLEAR_LOC and WAREHOUSE_AUTHORIZATION are required. The manual-replenishment view filters modes and active state using redacted literals; it does not execute replenishment or establish current settings. Evidence: E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11.

E1: [DB Architecture/objects/1775345389.json](objects/1775345389.json), lines 1-628; SHA-256 `121699042ff86d835a7654f535a766bd6a147d649873bf9839624e1a803c401d`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 17966-17983; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 17984-18001; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E4: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 602-613; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

E5: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 23-29; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E6: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 51-57; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E7: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 86-92; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E8: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 121-127; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E9: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 2662-2668; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E10: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 3782-3788; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E11: [DB Architecture/sql/1748513608.sql](sql/1748513608.sql), lines 1-20; SHA-256 `aff6798e34e7ea1f49cc897ce5872978f23e3343222eb2c353ec3475e4e4b768`. Complete reading of selected existing SQL use; no new module credit.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.REPLENISHMENT_MASTER_WAREHOUSE_ACCESS

Associate named replenishment definitions with warehouses.

Domains: inventory, configuration.

- configuration: OBJECT_ID is the identity primary key, with required trusted NO_ACTION foreign keys to the replenishment master and warehouse. The pair is not constrained unique. The manual view left-joins these rows only when its authorization-mode predicate allows it, so a definition can appear without a warehouse association; duplicate associations can yield duplicate rows. Literal mode meaning is outside this review. Evidence: E1, E2, E3, E4, E5.

E1: [DB Architecture/objects/1477840577.json](objects/1477840577.json), lines 1-334; SHA-256 `8171becd10a2917adbc91cb945dc9521bbdf2f870b62e1032286dfd76364df09`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 15104-15121; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 3302-3313; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

E4: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 3350-3361; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

E5: [DB Architecture/sql/1748513608.sql](sql/1748513608.sql), lines 1-20; SHA-256 `aff6798e34e7ea1f49cc897ce5872978f23e3343222eb2c353ec3475e4e4b768`. Complete reading of selected existing SQL use; no new module credit.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.REPLENISHMENT_REQUEST

Stores source/destination replenishment allocation and work linkage.

Domains: allocation_wave_replenishment.

- transactional_state: Request quantities and instruction links participate in splitting and cancellation. Evidence: E1, E2, E3.
- reporting_read_model: Detail/view/count projections do not perform replenishment. Evidence: E1, E2, E3.

E1: [DB Architecture/objects/1807345503.json](objects/1807345503.json), lines 1-1447; SHA-256 `5f37be71f27e6a5d94f494efbc00d6cb59c05ccbb2adf16d4a37e82eda5c9d94`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/1130799436.sql](sql/1130799436.sql), lines 23-190; SHA-256 `8c90a5e42ea4e71a65660da82fb8c75cd08ade333e45fc62aaa31be151ff9798`. Remainder split contract.

E3: [DB Architecture/sql/1656705300.sql](sql/1656705300.sql), lines 34-108; SHA-256 `e77620d3a791fe8d958ca3268f5e2571ce6c60f76e938d4315f6ca1f8cb36860`. Count-like open indicator.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.REPLENISHMENT_STRATEGY

Store sequenced strategy names under a replenishment master.

Domains: inventory, configuration.

- configuration: The primary key is REPLENISHMENT_NAME and SEQUENCE. The master reference and STRATEGY are required; the master foreign key is enabled, trusted and NO_ACTION. The key prevents duplicate sequence slots for the same master but does not require positive or contiguous values. No strategy lookup constraint or caller execution order was established. Evidence: E1, E2, E3, E4.

E1: [DB Architecture/objects/1839345617.json](objects/1839345617.json), lines 1-334; SHA-256 `39ee54f562f264870864b3a6ef40572b019b7fec686c4a93b5a762f38892ee29`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 18524-18541; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 18542-18559; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E4: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 746-757; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.RESOURCE_FILE_BASE

Stores base resources with reviewed en-US fallback.

Domains: function_semantics.

- configuration: Reviewed function consumes the stated fields without altering persistent rows. Evidence: E1, E2.

E1: [DB Architecture/objects/1903345845.json](objects/1903345845.json), lines 1-418; SHA-256 `f41c15d864bb9427879028521587c64aced227af1776349931741260182e8ea1`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/1105751342.sql](sql/1105751342.sql), lines 62-81; SHA-256 `7c9d25958f7928d70de4fa85be0750c5061fdf8f1adce770b2bbda19071c55bc`. Exact bounded supporting-table use.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.RESOURCE_FILE_CUSTOM

Stores language/group/key overrides preferred over base text when non-NULL.

Domains: function_semantics.

- configuration: Reviewed function consumes the stated fields without altering persistent rows. Evidence: E1, E2.

E1: [DB Architecture/objects/1935345959.json](objects/1935345959.json), lines 1-439; SHA-256 `f60779cf4df12e4c3f33cf88d4cf7545611d2a2119b5d743a02378ff42710998`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/1105751342.sql](sql/1105751342.sql), lines 55-61; SHA-256 `7c9d25958f7928d70de4fa85be0750c5061fdf8f1adce770b2bbda19071c55bc`. Exact bounded supporting-table use.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.SCHEDULED_JOBS

Combines application scheduled-job definitions with last/next-run bookkeeping.

Domains: configuration, work_execution.

- configuration: Job identity, parameters, recurrence fields, active flag and timezone define scheduling settings. Evidence: E1.
- transactional_state: Last-run and next-run timestamps store scheduler bookkeeping alongside configuration. Evidence: E1.

E1: [DB Architecture/objects/11863109.md](objects/11863109.md), lines 11-38; SHA-256 `64ec3680b40eb8e59daf774b10a47c76094853b3d7f53030917a7018ece457a9`. Reviewed columns support the stated storage responsibilities.

Limits: No schedules or enabled jobs were read; this does not prove SQL Agent use, backlog, polling intervals or actual execution.


## dbo.SCREEN_CONTROL

Stores form-group controls and sequences used by nonreserving ID/sequence suggestions.

Domains: ui_and_reporting, configuration, function_semantics.

- presentation_metadata: Control type, resource key, screen group, data binding and template fields describe screen controls. Evidence: E1.
- configuration: Active, default-state and default-action fields carry configurable control behavior. Evidence: E1.
- configuration: Reviewed function consumes the stated fields without altering persistent rows. Evidence: E2, E3.

E1: [DB Architecture/objects/43863223.md](objects/43863223.md), lines 12-39; SHA-256 `a30cae1215b52b4b99d5a24e22b1d2f143e6e12cabc9b444cb7ce964c618a865`. Reviewed columns support the stated storage responsibilities.

E2: [DB Architecture/objects/43863223.json](objects/43863223.json), lines 1-649; SHA-256 `44423b08e6d4b425b8dae24726d17a7f93ba0271a859fda271b74536a598711d`. Column types, nullability and object identity support the stated structural role.

E3: [DB Architecture/sql/341224616.sql](sql/341224616.sql), lines 19-25; SHA-256 `3175de7db0f59b7a0ecab279941cdf212922708e71c82cda0fa2338c92f46805`. Exact bounded supporting-table use.

Limits: Actual screen composition, activation and user permissions require records/application evidence not collected here. No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.SCREEN_CONTROL_ATTRIBUTES

Store screen-control attribute values used to choose which database object a metadata wrapper describes.

Domains: presentation, configuration.

- presentation_metadata: The wrapper reads ATTRIBUTE_VALUE for SCREEN_CONTROL_ID and one fixed ATTRIBUTE_NAME. It does not filter ACTIVE, SYSTEM_CREATED or IS_CONTROL_PROPERTY. ATTRIBUTE_VALUE is used as an object name for metadata inspection, not executed as SQL by this wrapper. Procedure targets use the first-result-set describer; the other branch filters INFORMATION_SCHEMA.COLUMNS by TABLE_NAME without schema. Evidence: E1, E2, E3, E4, E5, E6, E7.
- reporting_read_model: The cited presentation wrappers read the stated fields and preserve the stated selection/null boundaries; no mutation is performed by those uses. Evidence: E1, E2, E3, E4, E5, E6, E7.

E1: [DB Architecture/objects/75863337.json](objects/75863337.json), lines 1-628; SHA-256 `a071628a23183f2ed229f53e184ff35e4e4d7b0ac0c8d048078464a7f1f05d2f`. Captured table identity and complete column definitions; this review claims only the described use roles.

E2: [DB Architecture/sql/485225129.sql](sql/485225129.sql), lines 14-52; SHA-256 `97218f5392e526f300a80e1c6e373ec7d5b10f7993a1b8ac4fc23c48eb665ab7`. Attribute lookup and object-result/column metadata branch.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 614-631; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes record for this table; identity 1

E4: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 1142-1153; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys record for this table; identity 499532863

E5: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 604-610; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact default_constraints record for this table; identity 333960266

E6: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 632-638; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact default_constraints record for this table; identity 349960323

E7: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 660-666; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact default_constraints record for this table; identity 365960380

Limits: The SCREEN_CONTROL_ID foreign key validates referenced screen-control identity, not existence/type of the object named in ATTRIBUTE_VALUE. Broader control-property interpretation, UI binding and active configuration values are outside this use-site review. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.


## dbo.SCREEN_CONTROL_EVENT

Store control-event registrations and optional grid-column context.

Domains: administration, configuration, presentation.

- presentation_metadata: The seed uses EVENT_ID+SCREEN_CONTROL_ID to preserve existing registrations, regardless of changed event name or grid-column input. Registration itself triggers no event. Evidence: E1, E2, E3, E4, E5, E6.

E1: [DB Architecture/objects/107863451.json](objects/107863451.json), lines 1-418; SHA-256 `19e3112c3ff046475ad3221bdfaf352ca3b369c749c4f4765d2014c18c045439`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/296700455.sql](sql/296700455.sql), lines 1-67; SHA-256 `661e041f8c7a2f69ebf659d994f7a2e560a6306bae28343f06f84689cc8b7be8`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 848-865; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 107863451, index 1.

E4: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 512-521; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 107863451, index 1.

E5: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 1178-1189; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys row for parent table 107863451.

E6: [DB Architecture/catalog/foreign_key_columns.json](catalog/foreign_key_columns.json), lines 794-801; SHA-256 `88488a254f09572a507f34c5ade8b7161a76f0806958f5a7b75a1f37044416b3`. Exact foreign_key_columns row for parent table 107863451.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.SCREEN_CONTROL_EVENT_PARAMETERS

Store named values for registered screen-control events.

Domains: administration, configuration, presentation.

- presentation_metadata: The seed preserves existing PARAMETER_NAME+SCREEN_CONTROL_EVENT_ID pairs; parameter values remain metadata, not verified typed event arguments. Evidence: E1, E2, E3, E4, E5, E6.

E1: [DB Architecture/objects/139863565.json](objects/139863565.json), lines 1-397; SHA-256 `75868b99e27c929f51e91e61d666d36c643af676d32530dca1ac62bae5b5e410`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/312700512.sql](sql/312700512.sql), lines 1-64; SHA-256 `05a2633bc8df8982129b4685418e18f1221ea5a2824c42aba2b6e494616d5c71`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 1100-1117; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 139863565, index 1.

E4: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 682-691; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 139863565, index 1.

E5: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 1214-1225; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys row for parent table 139863565.

E6: [DB Architecture/catalog/foreign_key_columns.json](catalog/foreign_key_columns.json), lines 818-825; SHA-256 `88488a254f09572a507f34c5ade8b7161a76f0806958f5a7b75a1f37044416b3`. Exact foreign_key_columns row for parent table 139863565.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.SCREEN_CONTROL_GRID_COLUMNS

Store grid-column expressions and edit/display/binding settings.

Domains: administration, configuration, presentation.

- presentation_metadata: The seed compares control, field, field name and clause type, normalizing NULL field values with ISNULL. Stored primary-key/edit flags are presentation metadata and create no database constraint. Evidence: E1, E2, E3, E4, E5, E6.

E1: [DB Architecture/objects/171863679.json](objects/171863679.json), lines 1-733; SHA-256 `a94aabb376cc5d6487011cd91a339a7a99a049f09d7165368a67c266b7ce2d5e`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/328700569.sql](sql/328700569.sql), lines 1-105; SHA-256 `a13a940fb1e1c070497b5ba6c79d307959a50a34d768c4e635f8af147953ef9d`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 1316-1333; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 171863679, index 1.

E4: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 802-811; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 171863679, index 1.

E5: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 1250-1261; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys row for parent table 171863679.

E6: [DB Architecture/catalog/foreign_key_columns.json](catalog/foreign_key_columns.json), lines 842-849; SHA-256 `88488a254f09572a507f34c5ade8b7161a76f0806958f5a7b75a1f37044416b3`. Exact foreign_key_columns row for parent table 171863679.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.SCREEN_GROUP

Links named groups to screen parts; resolver may match multiple groups.

Domains: function_semantics.

- configuration: Reviewed function consumes the stated fields without altering persistent rows. Evidence: E1, E2.

E1: [DB Architecture/objects/203863793.json](objects/203863793.json), lines 1-586; SHA-256 `7496318c8b5ab83ad737d36c02fc054b181a18faeb01db5cc8d05ccaf66260ee`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/373224730.sql](sql/373224730.sql), lines 18-34; SHA-256 `7e06a28402de584f802b0e9834fd18d5a110880482b668d5af68252ac29fa3c5`. Exact bounded supporting-table use.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.SCREEN_GROUP_COLUMN

Store layout columns for screen groups.

Domains: administration, configuration, presentation.

- presentation_metadata: The seed inserts absent group/name pairs and preserves existing CSS and sequence. The table records layout metadata, not rendered or accessibility acceptance. Evidence: E1, E2, E3, E4, E5, E6.

E1: [DB Architecture/objects/235863907.json](objects/235863907.json), lines 1-418; SHA-256 `33b6afe6074874d3aa80b9a96e713b658aa79a80508706ae8f1f4d81096d210e`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/360700683.sql](sql/360700683.sql), lines 1-63; SHA-256 `a0843b0748243052721fff7daa1d78c8ce2e154241e65d45e73ebc2dfcd89a0f`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 1802-1819; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 235863907, index 1.

E4: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 1202-1211; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 235863907, index 1.

E5: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 1358-1369; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys row for parent table 235863907.

E6: [DB Architecture/catalog/foreign_key_columns.json](catalog/foreign_key_columns.json), lines 914-921; SHA-256 `88488a254f09572a507f34c5ade8b7161a76f0806958f5a7b75a1f37044416b3`. Exact foreign_key_columns row for parent table 235863907.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.SCREEN_PART

Store screen parts and their sequence/type metadata.

Domains: administration, configuration, presentation.

- presentation_metadata: The seed inserts absent screen/name pairs without executing the stored default action. Parent references and nullable presentation fields require separate runtime interpretation. Evidence: E1, E2, E3, E4, E5, E6.

E1: [DB Architecture/objects/267864021.json](objects/267864021.json), lines 1-502; SHA-256 `0bbefeb857e228c997a2021a8c025761f5bc6c3bdea058e17c73729e13a1f19d`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/376700740.sql](sql/376700740.sql), lines 1-84; SHA-256 `6c1094b9823450557b2fadb0243dea2e98e07e83a8a158343ed385512922dff7`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 2018-2035; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 267864021, index 1.

E4: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 1312-1321; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 267864021, index 1.

E5: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 1394-1405; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys row for parent table 267864021.

E6: [DB Architecture/catalog/foreign_key_columns.json](catalog/foreign_key_columns.json), lines 938-945; SHA-256 `88488a254f09572a507f34c5ade8b7161a76f0806958f5a7b75a1f37044416b3`. Exact foreign_key_columns row for parent table 267864021.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.SECURITY

Stores form-level security value strings whose precedence differs across reviewed helpers.

Domains: function_semantics.

- configuration: Reviewed function consumes the stated fields without altering persistent rows. Evidence: E1, E2.

E1: [DB Architecture/objects/363864363.json](objects/363864363.json), lines 1-418; SHA-256 `f3901b15bbe15d6976171ecd513e1732ed9a96d4e55760fbfe28e1187d1d6d55`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/712701937.sql](sql/712701937.sql), lines 9-22; SHA-256 `d8f5363c8994a7584c0cfaa919e45fb316f63afb072e9f860a5ce897a71d9c3a`. Exact bounded supporting-table use.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.SERIAL_NUMBER

Stores active serial identity and linkage.

Domains: inventory.

- transactional_state: Serial/group identity plus nullable inventory/container keys are changed by serial movement. Evidence: E1, E2.

E1: [DB Architecture/objects/491864819.md](objects/491864819.md), lines 11-30; SHA-256 `ca148749c49104636b045c382d835a35f9a386a9e4443b79130decb3f24f1418`. Reviewed column contract.

E2: [DB Architecture/sql/1416704445.sql](sql/1416704445.sql), lines 57-66; SHA-256 `e763924616e0e97b2f8d56b00a30978cb815a76741550b7a1e65fefd04d9e535`. Reviewed explicit usage supports this role.

Limits: No operational rows read. Retention, effective settings, activity and permissions remain unestablished.


## dbo.SHIPMENT_ACCESSORIALS

Stores shipment/container accessorial associations.

Domains: receiving_shipping.

- transactional_state: INSERT/UPDATE trigger normalizes negative association numbers. Evidence: E1, E2.

E1: [DB Architecture/objects/523864933.json](objects/523864933.json), lines 1-523; SHA-256 `7c8d98aa8e0c067a2169768aee8fcc5164e4a57b47d1a447e5f6ed3065bde761`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/752057765.sql](sql/752057765.sql), lines 3-30; SHA-256 `2a2157c7562c8aea7899564ba9ca4ea29d41b6f4f2588af925b7a9eefafe3f23`. Association-key update can include existing negative rows.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.SHIPMENT_ALLOC_REQUEST

Stores allocated shipment requests, conversions, destination metadata and work-created flags.

Domains: allocation_wave_replenishment.

- transactional_state: Reviewed helpers alter conversions, split requests, change destinations and mark work. Evidence: E1, E2, E3, E4.

E1: [DB Architecture/objects/555865047.json](objects/555865047.json), lines 1-2119; SHA-256 `9c916d049cd5c44c2a8014be6aeb1ca20a052d04755bc484f803c96477f8acc3`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/1834801944.sql](sql/1834801944.sql), lines 23-142; SHA-256 `04f74553073971af9cd383ea7375c6cbe1ab33c0582ef70ae70f6a0e98e60838`. UOM metadata update.

E3: [DB Architecture/sql/1388180341.sql](sql/1388180341.sql), lines 13-85; SHA-256 `61dfbb007648170cefd1052c9b49f50ae8eabba8451fbe66384cf9ac2af81718`. Allocation split and identity output.

E4: [DB Architecture/sql/1162799550.sql](sql/1162799550.sql), lines 9-17; SHA-256 `8759b02229458138516896a52d9044058ea11f3462af8d84d6842eff87dd381a`. Work flag alone.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.SHIPMENT_DETAIL

Stores wave membership and ten status/quantity history slots.

Domains: shipping, inventory, allocation_wave_replenishment.

- transactional_state: Line identity, requested quantity and quantity-at-status slots retain fulfillment-line progress. Evidence: E1, E2.
- transactional_state: Membership/completion writes first status; order/open and rejected statistics read slots. Evidence: E3, E4, E5.

E1: [DB Architecture/objects/619865275.md](objects/619865275.md), lines 11-111; SHA-256 `4f52d15b0420f898ff302a8e2aa72f2f28fb0ac78e5af231d20ad8c41cce8300`. Reviewed columns support the stated storage responsibilities.

E2: [DB Architecture/sql/1809753850.sql](sql/1809753850.sql), lines 81-119; SHA-256 `2e4550ba3972ac8d7cb010387214f2bdab3e30ddb1fa8d5d9f0c70a61c2f411f`. Status/quantity updates preserve the explicit 995 exclusion.

E3: [DB Architecture/objects/619865275.json](objects/619865275.json), lines 1-3358; SHA-256 `4f56eebc9bb3ef9cca21ebe827c2152e0b2b30fbb44f880e64eb9ae1f28a8f1d`. Column types, nullability and object identity support the stated structural role.

E4: [DB Architecture/sql/1324180113.sql](sql/1324180113.sql), lines 20-47; SHA-256 `b5dce494366abfcc2734de0791fbee747c75861e1c8cb67a3624cd9179ae8586`. Order-line open quantity from selected history.

E5: [DB Architecture/sql/1722801545.sql](sql/1722801545.sql), lines 16-39; SHA-256 `0ef110ea521164b64cef73aec36070ceb170751c1a7e317ab961cc7921fbaa6c`. Rejected sum nullable arithmetic.

Limits: Column slots alone do not define status meanings or caller-specific transition rules. No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.SHIPMENT_HEADER

Stores shipment wave/load membership and leading/trailing progress.

Domains: shipping, allocation_wave_replenishment.

- transactional_state: Shipment identity, load linkage, leading/trailing statuses and actual ship time encode operational progress. Evidence: E1, E2.
- transactional_state: Membership helpers assign wave/statuses and cancellation can detach loads. Evidence: E3, E4, E5.

E1: [DB Architecture/objects/683865503.md](objects/683865503.md), lines 11-83; SHA-256 `5f06cae375acbd68def993834ad66533ac745c3b36604ad330480a3f4a52c5b9`. Reviewed columns support the stated storage responsibilities.

E2: [DB Architecture/sql/1809753850.sql](sql/1809753850.sql), lines 65-78; SHA-256 `2e4550ba3972ac8d7cb010387214f2bdab3e30ddb1fa8d5d9f0c70a61c2f411f`. Ship-confirm handling updates header status and timestamps.

E3: [DB Architecture/objects/683865503.json](objects/683865503.json), lines 1-3589; SHA-256 `31cec782f34012105de8d1df66a9691c657222419a2e7a6a5efc5cfbd2c355c1`. Column types, nullability and object identity support the stated structural role.

E4: [DB Architecture/sql/254272311.sql](sql/254272311.sql), lines 19-49; SHA-256 `98713bd8ec243afa861446d6a031047579ae3961a77b67c00e76862fc578a8c4`. Membership and status assignment.

E5: [DB Architecture/sql/1020179030.sql](sql/1020179030.sql), lines 49-62; SHA-256 `a235ff8adf4c9e93b36f33b94731d69df3337b6adc6ba3be731de055b1719f13`. Load detachment.

Limits: Status meanings require documented/configured context; no current shipment progress was observed. No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.SHIPPING_CONTAINER

Stores shipping container hierarchy and progress.

Domains: shipping, allocation_wave_replenishment, receiving_shipping.

- transactional_state: Container identity, parent hierarchy, shipment linkage, quantity and manifest/status fields retain packing/shipping state. Evidence: E1, E2.
- transactional_state: Completion sets status; association helper changes allocation ID. Evidence: E3, E4, E5.
- transactional_state: Root tree ID initialized on insert; confirmation writes status. Evidence: E3, E6, E2.
- master_reference: Container identities connect parent/child hierarchy; lifecycle is mutable. Evidence: E3, E6, E2.

E1: [DB Architecture/objects/1067866871.md](objects/1067866871.md), lines 11-58; SHA-256 `c6ec254882f0e09716e52205c0c8c6d18522cf3daeac91c94510f1fbbe831a58`. Reviewed columns support the stated storage responsibilities.

E2: [DB Architecture/sql/1809753850.sql](sql/1809753850.sql), lines 289-292; SHA-256 `2e4550ba3972ac8d7cb010387214f2bdab3e30ddb1fa8d5d9f0c70a61c2f411f`. Ship-confirm handling updates container status.

E3: [DB Architecture/objects/1067866871.json](objects/1067866871.json), lines 1-1888; SHA-256 `0d1067e2fa860ec66c388190209ded0d18a7a1d28d5db358ca99a69d7ce2ba7f`. Column types, nullability and object identity support the stated structural role.

E4: [DB Architecture/sql/1276179942.sql](sql/1276179942.sql), lines 15-23; SHA-256 `28ea81593bbdc47d8b840e297ad407494b3d430a7927a1567255400ada249ac8`. Status assignment.

E5: [DB Architecture/sql/1420180455.sql](sql/1420180455.sql), lines 20-32; SHA-256 `ffb6ed3845e8400798570d52d8201e9fb387c8840d38ce40735d9059c2b152f7`. Allocation association update.

E6: [DB Architecture/sql/768057822.sql](sql/768057822.sql), lines 2-13; SHA-256 `5efb0120bcc089cce081aee93c19d4a7443b04335431765aac6b3006766278b1`. Root-only tree initialization.

Limits: Manifest fields do not prove carrier transmission, label printing or successful shipment. No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.SHIPPING_CONTAINER_CATCH_WEIGHT_INFORMATION

Links shipping-container catch weight to inventory.

Domains: inventory.

- transactional_state: Container/inventory IDs and weight/unit support conditional movement cleanup. Evidence: E1, E2.

E1: [DB Architecture/objects/1028511043.md](objects/1028511043.md), lines 11-26; SHA-256 `51da2b8398b5d12412b15b3e2e55bebd8f487c189ab3db4559342ab5738d86f9`. Reviewed column contract.

E2: [DB Architecture/sql/1400704388.sql](sql/1400704388.sql), lines 497-507; SHA-256 `75f63d082a4062e9b815f5797a8c53d333828c5cf2bec75cea0e22c978d999d2`. Reviewed explicit usage supports this role.

Limits: No operational rows read. Retention, effective settings, activity and permissions remain unestablished.


## dbo.SHIPPING_LOAD

Stores aggregate shipping-load leading/trailing statuses.

Domains: shipping, allocation_wave_replenishment.

- transactional_state: Load identity, progress statuses, closure state and departure timestamps encode transport-load execution state. Evidence: E1, E2.
- transactional_state: Completion applies asymmetric rules; cancellation aggregates remaining shipments. Evidence: E3, E4, E5.

E1: [DB Architecture/objects/1131867099.md](objects/1131867099.md), lines 11-50; SHA-256 `9b42206ef05a4477fe890540fedb4231d71f698658a3d49a9e9e1e01f55b4ae8`. Reviewed columns support the stated storage responsibilities.

E2: [DB Architecture/sql/1809753850.sql](sql/1809753850.sql), lines 295-306; SHA-256 `2e4550ba3972ac8d7cb010387214f2bdab3e30ddb1fa8d5d9f0c70a61c2f411f`. Load trailing status is derived from child shipment statuses.

E3: [DB Architecture/objects/1131867099.json](objects/1131867099.json), lines 1-901; SHA-256 `1fb984c33b91698e00b9add1bcbdd2ccc175991820d1a3645018b2a6f79439e3`. Column types, nullability and object identity support the stated structural role.

E4: [DB Architecture/sql/1356180227.sql](sql/1356180227.sql), lines 20-37; SHA-256 `33ef3191963ae79f10b57d789626dafb99df5a75b998b78a8fc062def77b723d`. Asymmetric update rules.

E5: [DB Architecture/sql/1020179030.sql](sql/1020179030.sql), lines 25-62; SHA-256 `a235ff8adf4c9e93b36f33b94731d69df3337b6adc6ba3be731de055b1719f13`. Remaining shipment aggregation and detach.

Limits: No departure, closure or carrier activity was observed. No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.STATISTICS_FIELD

Defines fields within statistics sources.

Domains: allocation_wave_replenishment.

- configuration: Missing field yields severity18 and -1 in reviewed getter/saver. Evidence: E1, E2.

E1: [DB Architecture/objects/1387868011.json](objects/1387868011.json), lines 1-460; SHA-256 `c3779bd927a26407f2e461c5a8e76b04a126fe0a6969c3637cf4b4241acb637c`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/2033754648.sql](sql/2033754648.sql), lines 20-38; SHA-256 `750620577d3d522119825e726da77f100d9b378ba2534ae5ff8d0d699cc463f3`. Missing-field behavior.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.STATISTICS_SOURCE

Names statistics sources referenced by field resolution.

Domains: allocation_wave_replenishment.

- configuration: Source name participates in field identity resolution. Evidence: E1, E2.

E1: [DB Architecture/objects/1451868239.json](objects/1451868239.json), lines 1-355; SHA-256 `cfbc034e2fa4e6ca3c2547e34921894cced2ca138fb6caccdec7f866c09aee3c`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/2049754705.sql](sql/2049754705.sql), lines 20-39; SHA-256 `2308df3f07a595e298335163da2fb106a93bb89b0d0c68de0ff7229343526ef5`. Named source and field lookup.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.STATISTICS_VALUE

Stores numeric values by field and source key with timestamp.

Domains: allocation_wave_replenishment.

- reporting_read_model: Wave metrics persist here; values are not warehouse movements. Evidence: E1, E2.
- transactional_state: Saver inserts/updates scalar values. Evidence: E1, E2.

E1: [DB Architecture/objects/1483868353.json](objects/1483868353.json), lines 1-355; SHA-256 `e83a9a4abeb6f9f9a9c946c01bc03015133c433c0fae6ed591431b49bbd29ef1`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/2049754705.sql](sql/2049754705.sql), lines 42-80; SHA-256 `2308df3f07a595e298335163da2fb106a93bb89b0d0c68de0ff7229343526ef5`. Read-then-insert/update.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.STORAGE_TEMPLATE_DETAIL

Supplies final UOM fallback and zero treat-full substitutions by sequence.

Domains: function_semantics.

- configuration: Reviewed function consumes the stated fields without altering persistent rows. Evidence: E1, E2.

E1: [DB Architecture/objects/1515868467.json](objects/1515868467.json), lines 1-397; SHA-256 `6e4849fb412b8b55cf1ad65f54383bcc21b84b1edf80fb2a68888cbeb3dbb21f`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/1832705927.sql](sql/1832705927.sql), lines 334-346; SHA-256 `7cd5d4dfaa7e8b66800c0cf6c5a3b2e6c8841f874015d83b966c36a730366a93`. Exact bounded supporting-table use.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.SYSTEM_CONFIG_DETAIL

Stores delimiter/language settings used by scalar transforms.

Domains: configuration, function_semantics.

- configuration: System key, record type, lookup/validation metadata and warehouse/company scope surround SYSTEM_VALUE. Evidence: E1, E2.
- configuration: Reviewed function consumes the stated fields without altering persistent rows. Evidence: E3, E4.

E1: [DB Architecture/objects/1643868923.md](objects/1643868923.md), lines 12-31; SHA-256 `46ecf273aa5efb984401da189142e2f921429d42936c2be4be3c25e8d51f87d9`. Reviewed columns support the stated storage responsibilities.

E2: [DB Architecture/sql/51843597.sql](sql/51843597.sql), lines 270-275; SHA-256 `337a1793a82284ecd9d2c95352ab086d5ee8dae4e6e6a8d6025a62198c6678b0`. Work selection reads a system value into a numeric selection parameter.

E3: [DB Architecture/objects/1643868923.json](objects/1643868923.json), lines 1-481; SHA-256 `d4788430a9831a6b2975d830edea85446975b27c10355465a1fc75ea84cf63dd`. Column types, nullability and object identity support the stated structural role.

E4: [DB Architecture/sql/1386800348.sql](sql/1386800348.sql), lines 33-46; SHA-256 `9b3b5f343d15a7c27bd88f1a9ffad44ef2d349cf0b209b9ff361e5671f2e31f9`. Exact bounded supporting-table use.

Limits: Configuration values were not read; masking metadata does not establish effective application authorization. No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.SYSTEM_CONFIG_HEADER

Define system-configuration record-type headers.

Domains: administration, configuration, presentation.

- configuration: RECORD_TYPE is the primary key; the seed creates only the header and leaves actual detail values to other behavior. Evidence: E1, E2, E3, E4.

E1: [DB Architecture/objects/1675869037.json](objects/1675869037.json), lines 1-334; SHA-256 `40bd86126da1a25d7c93f69dc5352c0fe8106b048ceb28e1976eb13c4de62a21`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/2074802799.sql](sql/2074802799.sql), lines 1-34; SHA-256 `7cbb8e2811a5f72afc6d25605975e9c0d4252f0213d25f36634416d206e1af4a`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 17228-17245; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1675869037, index 1.

E4: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 14312-14321; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1675869037, index 1.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.TRAILER_YARD_STATUS

Stores trailer/warehouse yard state used for receipt association.

Domains: receiving_shipping.

- transactional_state: Insertion drives receipt linking; no full yard-movement workflow is proved. Evidence: E1, E2.

E1: [DB Architecture/objects/1915869892.json](objects/1915869892.json), lines 1-502; SHA-256 `eeb31f41931415c61964c5842cbbcfb184f3b0d20d128663a96faf2db5922ba3`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/784057879.sql](sql/784057879.sql), lines 4-25; SHA-256 `254d9fee5b3ae0c9cb521ea2cfad05a774f3bb9b9f5f3ee77516c967819b3042`. Yard insertion attaches matching unlinked receipts.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.TRANSACTION_HISTORY

Stores transaction history with before-and-after inventory/status measures.

Domains: inventory, work_execution, audit.

- audit_history: Transaction/work identity, actor, activity time and before/after measures describe recorded changes. Evidence: E1.

E1: [DB Architecture/objects/1979870120.md](objects/1979870120.md), lines 13-53; SHA-256 `1ceff5e4fe278dabfa752fa6295841ceaf76b60cc785c4fbced64b3ff4ec30f9`. Reviewed columns support the stated storage responsibilities.

Limits: Schema does not prove complete logging, immutability or retention.


## dbo.UPLOAD_LOCATION_INVENTORY_ATTRIBUTES

Holds outbound inventory-attribute payload and links; drives selected serial insertion and receives linked batch-condition updates.

Domains: integration.

- integration_staging: Holds outbound inventory-attribute payload and links; drives selected serial insertion and receives linked batch-condition updates. Evidence: E1, E2.

E1: [DB Architecture/objects/2139870690.md](objects/2139870690.md), lines 9-48; SHA-256 `60d036dbd6c0323d71e0e893b909c7b0257692ab315527b55af321e4d2742301`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/654273736.sql](sql/654273736.sql), lines 1-50; SHA-256 `0e224f17a85d54d8b5ae0c563252504373ce11edfbd0d46796d98e5decf9f4da`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.UPLOAD_ORDER_COMMENT

Holds outbound comments linked to either upload header or detail; claim follows both link forms.

Domains: integration.

- integration_staging: Holds outbound comments linked to either upload header or detail; claim follows both link forms. Evidence: E1, E2.

E1: [DB Architecture/objects/24387156.md](objects/24387156.md), lines 9-32; SHA-256 `54cf1f33649c5b9b7d7c4864b0be5ad7b310d2d5e85eb1fb2eeb69445fa7aa1e`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/410796871.sql](sql/410796871.sql), lines 1-102; SHA-256 `490d5acf6415262167580113676971da683b26cc405a8b3b089850dde2a6dab6`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.UPLOAD_ORDER_CONTAINER

Holds outbound container payload linked to upload headers; claim/update and current/retained view reference it.

Domains: integration.

- integration_staging: Holds outbound container payload linked to upload headers; claim/update and current/retained view reference it. Evidence: E1, E2.

E1: [DB Architecture/objects/56387270.md](objects/56387270.md), lines 9-87; SHA-256 `a60521c60948cc351b2f7875f23f4a6216e7a6745e5d188c4f006e16994b769b`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/410796871.sql](sql/410796871.sql), lines 1-102; SHA-256 `490d5acf6415262167580113676971da683b26cc405a8b3b089850dde2a6dab6`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.UPLOAD_ORDER_DETAIL

Holds outbound order-line payload linked to headers; reviewed claim and cleanup follow interface links.

Domains: integration.

- integration_staging: Holds outbound order-line payload linked to headers; reviewed claim and cleanup follow interface links. Evidence: E1, E2.

E1: [DB Architecture/objects/88387384.md](objects/88387384.md), lines 9-175; SHA-256 `7ac097e017fb470ac57187bf26e1d322ded15e7550dc34470e57322cdc6dae9c`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/410796871.sql](sql/410796871.sql), lines 1-102; SHA-256 `490d5acf6415262167580113676971da683b26cc405a8b3b089850dde2a6dab6`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.UPLOAD_ORDER_HEADER

Holds outbound order/shipment header payload and processing state; claim/update routine uses interface detail and process stamp.

Domains: integration, shipping.

- integration_staging: Interface identity/action/condition/error fields accompany shipment identifiers, statuses and totals. Evidence: E1.
- integration_staging: Holds outbound order/shipment header payload and processing state; claim/update routine uses interface detail and process stamp. Evidence: E2, E3.

E1: [DB Architecture/objects/120387498.md](objects/120387498.md), lines 11-167; SHA-256 `7f50678d2020b7070e6a13c7080a67dbcba75430618927e7c99f908e48aebe12`. Reviewed columns support the stated storage responsibilities.

E2: [DB Architecture/objects/120387498.md](objects/120387498.md), lines 9-191; SHA-256 `7f50678d2020b7070e6a13c7080a67dbcba75430618927e7c99f908e48aebe12`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E3: [DB Architecture/sql/410796871.sql](sql/410796871.sql), lines 1-102; SHA-256 `490d5acf6415262167580113676971da683b26cc405a8b3b089850dde2a6dab6`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Staging is not proof of transmission or acknowledgment; endpoint, direction and active interface configuration remain unknown. Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.UPLOAD_SERIAL_NUMBER

Holds outbound serial payload and condition/link/stamp fields; insertion is selected from inventory attributes and has no explicit deduplication.

Domains: integration.

- integration_staging: Holds outbound serial payload and condition/link/stamp fields; insertion is selected from inventory attributes and has no explicit deduplication. Evidence: E1, E2.

E1: [DB Architecture/objects/248387954.md](objects/248387954.md), lines 9-31; SHA-256 `5bf54bc54bbe08a28266b8fde903e2976de1215d17ed82e6bfd6831691e8d067`. Column structure supports the bounded state/configuration/payload role; no table rows read.

E2: [DB Architecture/sql/654273736.sql](sql/654273736.sql), lines 1-50; SHA-256 `0e224f17a85d54d8b5ae0c563252504373ce11edfbd0d46796d98e5decf9f4da`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Only the stated column role and reviewed usage are established. No active values, row completeness, retention, transport success, permissions or runtime were checked.


## dbo.USER_ACTIVITY

Supply retained user-session timestamps to the hourly distinct-user concurrency sampler.

Domains: performance_billing_maintenance.

- audit_history: Supply retained user-session timestamps to the hourly distinct-user concurrency sampler. Evidence: E1, E2.

E1: [DB Architecture/objects/280388068.json](objects/280388068.json), lines 1-502; SHA-256 `7a6c42ac3c0742f92b65744f6870d5c10fd070e4218d478739450b18e473ab07`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/1687677060.sql](sql/1687677060.sql), lines 5-39; SHA-256 `0bf2a2fb03dd06a3d7489cf866c8d76d058af3d486e4f3a2e63b388e9b6142d2`. Hourly session interval sampling.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.USER_ADJSTMNT_AUTHORIZATION

Associate users with adjustment types.

Domains: inventory, configuration.

- configuration: The primary key is USER_NAME and ADJUSTMENT_TYPE, both supported by enabled, trusted NO_ACTION foreign keys. ROW_VERSION is numeric(9,0) with default one, not SQL Server rowversion. DeleteUserProfileReferences explicitly deletes rows for its target username; that cleanup does not prove how permission checks consume the association. Evidence: E1, E2, E3, E4, E5, E6, E7, E8.

E1: [DB Architecture/objects/312388182.json](objects/312388182.json), lines 1-334; SHA-256 `ec519354cc94510ff435e3ab3a3e6b5147b796ef71afc2a2094b911f53fe57be`. Captured identity and complete column metadata, reviewed for the stated role.

E2: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 2378-2395; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 2396-2413; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 2414-2431; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact captured indexes record.

E5: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 4310-4321; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

E6: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 4346-4357; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact captured foreign_keys record.

E7: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 198-204; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact captured default_constraints record.

E8: [DB Architecture/sql/568701424.sql](sql/568701424.sql), lines 1-23; SHA-256 `cd532e390b24b1eafa31a8cbe112bf08c34051992ffe408a5078cbc3d88a3336`. Complete reading of selected existing SQL use; no new module credit.

Limits: No application/configuration/transactional rows were read and no SQL was executed. Role review is bounded to captured schema and stated uses, not all consumers or full table lifecycles. Redacted flag and mode defaults are not reconstructed. Numeric precision is schema evidence, not a business validation rule. NO_ACTION foreign keys do not imply a safe deletion workflow or runtime acceptance.


## dbo.USER_PROFILE

Supplies group/default-warehouse context; these attributes do not themselves establish authentication or active warehouse.

Domains: function_semantics.

- configuration: Reviewed function consumes the stated fields without altering persistent rows. Evidence: E1, E2.

E1: [DB Architecture/objects/344388296.json](objects/344388296.json), lines 1-1174; SHA-256 `e1e80b2a1bd2de67c9fec88fadbfb00ab6bfb30a0220495df5df13ccdbec6222`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/1185751627.sql](sql/1185751627.sql), lines 21-26; SHA-256 `f6a3eff734ab05e0a1902be18072c6dd12349a55ddc460c5d735bcb75a504041`. Exact bounded supporting-table use.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.VIEWER_TEMPLATE

Store viewer data-source and linking-field definitions.

Domains: administration, configuration, presentation.

- presentation_metadata: FORM_ID controls the seed duplicate guard. Header/detail data-source names are metadata; the helper neither executes queries nor validates that names resolve. Evidence: E1, E2, E3, E4, E5, E6, E7, E8, E9, E10.

E1: [DB Architecture/objects/536388980.json](objects/536388980.json), lines 1-460; SHA-256 `ec6f341b0b0c89c3a22a23cc4591d0b0ab9b0ab436e78e0d489dea8515ccf176`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/504701196.sql](sql/504701196.sql), lines 1-69; SHA-256 `46403b4b49d9b5cad0e8a58da9629182f52994aeabc9841d056f141c53a81b1f`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 4970-4987; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 536388980, index 1.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 4988-5005; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 536388980, index 2.

E5: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 3242-3251; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 536388980, index 1.

E6: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 3252-3261; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 536388980, index 2.

E7: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 2-13; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys row for parent table 536388980.

E8: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 3830-3841; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys row for parent table 536388980.

E9: [DB Architecture/catalog/foreign_key_columns.json](catalog/foreign_key_columns.json), lines 2-9; SHA-256 `88488a254f09572a507f34c5ade8b7161a76f0806958f5a7b75a1f37044416b3`. Exact foreign_key_columns row for parent table 536388980.

E10: [DB Architecture/catalog/foreign_key_columns.json](catalog/foreign_key_columns.json), lines 2602-2609; SHA-256 `88488a254f09572a507f34c5ade8b7161a76f0806958f5a7b75a1f37044416b3`. Exact foreign_key_columns row for parent table 536388980.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.WAREHOUSE

Defines warehouse identity and timezone used for local status dates.

Domains: shared_reference, configuration, receiving_shipping.

- master_reference: Warehouse identity, description and addresses provide facility reference information. Evidence: E1, E2.
- configuration: Timezone and upload options hold facility-scoped processing settings. Evidence: E1, E2.
- master_reference: Warehouse is a reusable identity. Evidence: E3, E4.
- configuration: TIME_ZONE changes date/time conversion. Evidence: E3, E4.

E1: [DB Architecture/objects/664389436.md](objects/664389436.md), lines 11-67; SHA-256 `abbb274c7b0d84cb2ed978c1062808d02e4d8fdcc80f1a8c9f137b9346843219`. Reviewed columns support the stated storage responsibilities.

E2: [DB Architecture/sql/1000702963.sql](sql/1000702963.sql), lines 20-25; SHA-256 `6b5bdff46dfcee6ee4cf96dd5356cf4034277711d5b7749bcdb558dab325a3e4`. Timezone conversion reads WAREHOUSE.TIME_ZONE.

E3: [DB Architecture/objects/664389436.json](objects/664389436.json), lines 1-1237; SHA-256 `6788db0325d25e6472f902f0e88575c92698ccc1355862cb3c6ff44532d65214`. Column types, nullability and object identity support the stated structural role.

E4: [DB Architecture/sql/1000702963.sql](sql/1000702963.sql), lines 21-25; SHA-256 `6b5bdff46dfcee6ee4cf96dd5356cf4034277711d5b7749bcdb558dab325a3e4`. Warehouse timezone lookup and conversion.

Limits: The TIME_ZONE column does not establish valid configured values or timezone correctness. No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.WAREHOUSE_ALERT

Defines warehouse alert behavior and activation.

Domains: receiving_shipping.

- configuration: Alert type, active flag, priority and message shape queued request insertion. Evidence: E1, E2.

E1: [DB Architecture/objects/728389664.json](objects/728389664.json), lines 1-502; SHA-256 `bcf82b63d5487a19103faaa72a083ff3f9e173fc94ddbe6bd2e29ca624789462`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/1809753850.sql](sql/1809753850.sql), lines 37-63; SHA-256 `2e4550ba3972ac8d7cb010387214f2bdab3e30ddb1fa8d5d9f0c70a61c2f411f`. Active matching alert definition read.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.WAREHOUSE_ALERT_REQUEST

Stores requested warehouse alerts awaiting downstream processing.

Domains: performance_billing_maintenance, receiving_shipping.

- transactional_state: Store alert requests with processed/closed state, activity time and priority, summarized by the monitor. Evidence: E1, E2.
- integration_staging: Ship-confirm inserts unprocessed requests; delivery remains external. Evidence: E1, E3.

E1: [DB Architecture/objects/824390006.json](objects/824390006.json), lines 1-565; SHA-256 `a7da17860c2755f4443b6e68adb51301b1fc6b2f530a0c5b4d9787dc1aafaf17`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/1573229005.sql](sql/1573229005.sql), lines 28-40; SHA-256 `4da7e1b704475a17b4bf9eff39e69a6f738b00970155c21c5d171f73e7b7328f`. Processed/open request aggregation.

E3: [DB Architecture/sql/1809753850.sql](sql/1809753850.sql), lines 37-63; SHA-256 `2e4550ba3972ac8d7cb010387214f2bdab3e30ddb1fa8d5d9f0c70a61c2f411f`. Conditional alert request insertion.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.WEB_SCREEN_DATA_HEADER

Store web-screen type, code and data-header metadata.

Domains: administration, configuration, presentation.

- presentation_metadata: The seed duplicate guard uses SCREEN_NAME alone while COMPANY can be NULL; stored URL/code/method references are not invoked. Evidence: E1, E2, E3, E4.

E1: [DB Architecture/objects/1096390975.json](objects/1096390975.json), lines 1-544; SHA-256 `dad33910647432e7897176514409cfcd6f2b52be1a4f5839c771ee32d6e8412f`. Captured table identity and complete column metadata; reviewed for the stated role only.

E2: [DB Architecture/sql/520701253.sql](sql/520701253.sql), lines 1-85; SHA-256 `a0e96ea38cac538644dbaa9bc1200cf076c8113cb7739acbd4b1d7516611ff46`. Complete retained body reviewed; all string literals remain opaque.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 11378-11395; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes row for table 1096390975, index 1.

E4: [DB Architecture/catalog/index_columns.json](catalog/index_columns.json), lines 9702-9711; SHA-256 `2b9e2e1142c3deec0afda1f3d408ebeeabe7ad544d2fcbdd5d546ed2211116cc`. Exact index_columns row for table 1096390975, index 1.

Limits: Static evidence does not establish live caller, current values, user permission, deployment activation or runtime.


## dbo.WORK_INSTRUCTION

Stores executable instructions, quantities, grouping, assignment and sequence.

Domains: work_execution, inventory, allocation_wave_replenishment.

- transactional_state: Conditions, quantities and execution timestamps retain work progress. Evidence: E1, E2, E3.
- execution_worklist: Work unit, sequence, priority, assignment and movement locations support instruction dispatch. Evidence: E1, E2, E3.
- transactional_state: Split updates request links; cancellation deletes matching instructions. Evidence: E4, E5, E6.
- reporting_read_model: Open/detail/Header counts have distinct predicates. Evidence: E4, E5, E6.
- transactional_state: Mutable work state is selected and updated by the reviewed routines. Evidence: E4, E7.
- execution_worklist: Instruction IDs, sequence, group, condition and assignment govern work offering. Evidence: E4, E7.

E1: [DB Architecture/objects/1352391887.md](objects/1352391887.md), lines 14-56; SHA-256 `672b7e920d150c7228b500d699d6d8a5566215d7ce93c6b25280aae9ef12f372`. Reviewed columns support the stated storage responsibilities.

E2: [DB Architecture/sql/51843597.sql](sql/51843597.sql), lines 99-116; SHA-256 `337a1793a82284ecd9d2c95352ab086d5ee8dae4e6e6a8d6025a62198c6678b0`. Work-selection logic reads instruction grouping and sequencing.

E3: [DB Architecture/sql/1082799265.sql](sql/1082799265.sql), lines 35-60; SHA-256 `5a34e088b302084eeb2eae90fbfc0726d3a11cf9282f597ac5eab59d37d91e13`. Monitoring counts and groups instructions by work and condition.

E4: [DB Architecture/objects/1352391887.json](objects/1352391887.json), lines 1-2182; SHA-256 `efb37539a4cba6f2171c0879c636533500356857120d7af6b6c0989c0b958ebd`. Column types, nullability and object identity support the stated structural role.

E5: [DB Architecture/sql/1130799436.sql](sql/1130799436.sql), lines 160-190; SHA-256 `8c90a5e42ea4e71a65660da82fb8c75cd08ade333e45fc62aaa31be151ff9798`. Request relinking and retained quantity.

E6: [DB Architecture/sql/2085230829.sql](sql/2085230829.sql), lines 28-37; SHA-256 `b766d1cd02e2a90c334acf78045964aa607159aaa860ae6d6d380ae627a509b4`. Open instruction row count.

E7: [DB Architecture/sql/51843597.sql](sql/51843597.sql), lines 99-140; SHA-256 `337a1793a82284ecd9d2c95352ab086d5ee8dae4e6e6a8d6025a62198c6678b0`. Dynamic cart resequencing reads/writes this worklist.

Limits: This is a warehouse instruction worklist, not evidence that the absent generic QUEUE_PROCESS implementation is deployed. No current task, assignment or quantity was read. No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.WORK_ORDER_DETAIL

Store component allocation context projected for a selected work-order detail line.

Domains: presentation, receiving_work_orders.

- transactional_state: The wrapper returns ALLOCATED, ALLOCATION_RULE, FROM_LOCATION, item/company/warehouse, TOTAL_CONVERTED_QTY_NEEDED, CONVERTED_UM, build level/sequence and parent/detail IDs. It filters the internal detail-line key only and performs no allocation, quantity decrement, status update or user/warehouse authorization check. Evidence: E1, E2, E3, E4, E5, E6, E7.
- reporting_read_model: The cited presentation wrappers read the stated fields and preserve the stated selection/null boundaries; no mutation is performed by those uses. Evidence: E1, E2, E3, E4, E5, E6, E7.

E1: [DB Architecture/objects/1384392001.json](objects/1384392001.json), lines 1-1111; SHA-256 `b8673b4b6417b11447c591e23e9f6d9315c277edc2d0192e8c57dc57e88c0a6a`. Captured table identity and complete column definitions; this review claims only the described use roles.

E2: [DB Architecture/sql/1333228150.sql](sql/1333228150.sql), lines 16-32; SHA-256 `c2ea083020fa5398df532d83c72229dbe2ec422362ac5717d20daf4ffcd6571e`. Read-only component-allocation context selected by internal line key.

E3: [DB Architecture/sql/652581413.sql](sql/652581413.sql), lines 2-3; SHA-256 `9909b339cce32cf65f8aba5d4fd37e40153b9aef79a5a6f622f05284e8f03845`. Bound shared numeric-zero default, without new module-contract credit.

E4: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 14492-14509; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes record for this table; identity 1

E5: [DB Architecture/catalog/foreign_keys.json](catalog/foreign_keys.json), lines 1274-1285; SHA-256 `b39caa6923f29ae5b4a3e7fd4badd90eb79578b83cbcf6d62b55942295e9b14a`. Exact foreign_keys record for this table; identity 560057081

E6: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 912-918; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact default_constraints record for this table; identity 506484883

E7: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 940-946; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact default_constraints record for this table; identity 522484940

Limits: Enabled/trusted parent FK constrains work-order identity. It does not prove that allocation rule/location/stock is eligible or that movement work exists. Other allocation/movement writers and end-to-end work-order execution remain outside this table-role review. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.


## dbo.WORK_PROFILE_DETAIL

Defines per-profile sequence rules and execution options.

Domains: work_execution.

- configuration: Read by selector with both profile-wide and sequence-qualified predicates. Evidence: E1, E2.

E1: [DB Architecture/objects/1544392571.json](objects/1544392571.json), lines 1-817; SHA-256 `a0a5cfdcf11afea60e3cf9eacc87cd6d499d8b0c7b03de93a1197b5982958a3a`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/51843597.sql](sql/51843597.sql), lines 164-174; SHA-256 `337a1793a82284ecd9d2c95352ab086d5ee8dae4e6e6a8d6025a62198c6678b0`. Settings and differing selection scopes.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.WORK_PROFILE_ZONE_AUTH

Associates work profiles with authorized zones.

Domains: function_semantics, work_execution.

- configuration: Reviewed function consumes the stated fields without altering persistent rows. Evidence: E1, E2.
- configuration: Profile/zone relationships constrain selector zone predicates. Evidence: E1, E3.

E1: [DB Architecture/objects/1672393027.json](objects/1672393027.json), lines 1-334; SHA-256 `c40b961f27cfa3fdcdb420d151344e3b41ed38c597d3c85c6939158279a6717c`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/1784705756.sql](sql/1784705756.sql), lines 25-32; SHA-256 `035a9a8e5ff73606a157d9281f451844957ddf369ea10440a3f7e84534843279`. Exact bounded supporting-table use.

E3: [DB Architecture/sql/51843597.sql](sql/51843597.sql), lines 160-161; SHA-256 `337a1793a82284ecd9d2c95352ab086d5ee8dae4e6e6a8d6025a62198c6678b0`. Zone authorization comparison.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.WORK_REGROUP_ORDER

Defines expressions/directions used to construct cart regroup sorting.

Domains: work_execution.

- configuration: Sequence, ORDER_BY and TABLE_FIELD_NAME are read and concatenated into SQL syntax. Evidence: E1, E2.

E1: [DB Architecture/objects/1704393141.json](objects/1704393141.json), lines 1-334; SHA-256 `0c7972a4dbd4c74511447a879b1dae730e4e2976b5fb90623505b5757d81d274`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/51843597.sql](sql/51843597.sql), lines 115-140; SHA-256 `337a1793a82284ecd9d2c95352ab086d5ee8dae4e6e6a8d6025a62198c6678b0`. Regroup builder and execution.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.WORK_TYPE

Defines work types, description, activation, priority and labor attributes.

Domains: work_execution.

- master_reference: Reusable work type identity and descriptions. Evidence: E1, E2.
- configuration: Activation and default priority fields represent rule settings; effective values unobserved. Evidence: E1, E2.

E1: [DB Architecture/objects/1768393369.json](objects/1768393369.json), lines 1-502; SHA-256 `39f82bb46c5eb5a005961ae884c0bdd44ab3165881727b235a44e71b79c380c4`. Column types, nullability and object identity support the stated structural role.

E2: [DB Architecture/sql/1114799379.sql](sql/1114799379.sql), lines 37-43; SHA-256 `80cd2be3bcea0460ebdd96d291dca2d574aaf5b9fcb49ad74a8d0a87bd86e1d1`. Work-type description join.

Limits: No rows, effective permissions, activation or runtime were observed. Ownership is not inferred from object name.


## dbo.ZONE

Store global zone codes, types and active flags used to populate locating-zone choices.

Domains: presentation, configuration.

- master_reference: MetaTrans_GetLocatingZones selects ZONE and DESCRIPTION only where ACTIVE=Y and ZONE_TYPE=Locating, then orders by zone code. No warehouse, username, assignment, availability or physical location membership is tested by this selector. Evidence: E1, E2, E3, E4.
- reporting_read_model: The cited presentation wrappers read the stated fields and preserve the stated selection/null boundaries; no mutation is performed by those uses. Evidence: E1, E2, E3, E4.

E1: [DB Architecture/objects/1800393483.json](objects/1800393483.json), lines 1-397; SHA-256 `818eccb8a37936ae401ffe1db58ac98d99c50f19725f7401e86392e2a004cff2`. Captured table identity and complete column definitions; this review claims only the described use roles.

E2: [DB Architecture/sql/725225984.sql](sql/725225984.sql), lines 11-18; SHA-256 `a6d369eceb8f0b562d5c173b4fdd4330d2f17bc0eda63d3f7924f34fec50f278`. Active locating-zone projection ordered by zone code.

E3: [DB Architecture/catalog/indexes.json](catalog/indexes.json), lines 18146-18163; SHA-256 `043d6ba8fc7b3fc4e94272f9284214996023bb05869ab68a849f363d365bb80d`. Exact indexes record for this table; identity 1

E4: [DB Architecture/catalog/default_constraints.json](catalog/default_constraints.json), lines 1885-1891; SHA-256 `5dc6e189a71989abe287d2c36afef8b951a1f6499018b564f916fe8d88a50359`. Exact default_constraints record for this table; identity 1018486707

Limits: An eligible zone choice is not evidence that locating succeeded or that every zone has suitable available locations. No current active/type values were queried. Scope is the cited table use and captured schema, not every consumer, complete table lifecycle or live deployment. No data/configuration rows or credentials were read.


## dbo.AUDIT_LOG_VIEW

Expose audit-log metadata with decoded parameter/result fields.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/492580843.sql](sql/492580843.sql), lines 1-43; SHA-256 `1f392bdb2a1ed9c2047bb08b7065776b25dc7be6851c8865e18ce9eadfef3066`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No filter or audit write. Decoder implementation and sensitive operational log values are separate; no immutability or successful-call guarantee. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.CONTAINER_TYPE_AUTHORIZED_COMPANY_VIEW

List active container types with optional authorized-company rows.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/816057993.sql](sql/816057993.sql), lines 1-12; SHA-256 `c2f81b2054fdcb6b9eef6875ad23b4ce29205b331ca825a99a1c089bba1d0ba6`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: An absent company mapping yields NULL company. This view lists authorization metadata, not a per-user permission decision. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.DOCK_AREA_EMPTY_POSITION

Select dock positions with the captured empty-location state.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/832058050.sql](sql/832058050.sql), lines 1-15; SHA-256 `e34d8b742d87113ade3c6ac9392e4fc1e93f7302ce612da026154f854ab6bd0a`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No ACTIVE or warehouse filter, and no inventory quantity test; the name alone does not prove physical emptiness. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.DOCK_AREA_PERCENTAGE

Summarize active staging areas and their child position counts.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/848058107.sql](sql/848058107.sql), lines 1-48; SHA-256 `21186b60cac350eb4c6fa179aa21cd933302f20e5e66f3014630f9c6e6ae66b2`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: IS_AREA_EMPTY tests the area LOCATION_STS, not whether every child is empty. No division/percentage is computed despite the view name; missing children count zero. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.DOCK_AREA_POSITION

Derive a dock-position quantity-based display status.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/864058164.sql](sql/864058164.sql), lines 1-54; SHA-256 `ebaf9a6c4cb63f1654ec47b2f00833c7e712743b5925b200f99ee6a5c4ba4829`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Transit takes precedence over on-hand. No DOCK_LOCATION_TYPE=2 filter; negative/NULL/nonpositive sums fall through and no physical emptiness is proved. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.DOCK_AREA_POSITIONS_CARRIER

Associate staging positions with shipment carriers.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/880058221.sql](sql/880058221.sql), lines 1-36; SHA-256 `f53cff9f8e7fd8b23c3f743c3969c6c6b1c9cfe78119fce8b12e880bc663b301`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: The container-to-location join does not constrain warehouse; same location text across warehouses can cross-associate. No status/quantity filter. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.DOCK_AREA_POSITIONS_LOAD

Associate staging positions with shipping loads.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/896058278.sql](sql/896058278.sql), lines 1-39; SHA-256 `717b9c00f5d5cab68c19f6ea09cfafb06d34371a855e90b77669a86456ed1edf`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No container warehouse predicate on LOCATION text; an actual matching load is required. No physical load occupancy proof. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.DOCK_DOOR

List active configured dock doors and eligible attached loads.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/912058335.sql](sql/912058335.sql), lines 1-37; SHA-256 `ff4104eab0fc3a4167fa589fa83a51b0d82ccf4a3bb5b30333bf0aa383acf003`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Closed-or-higher load rows fail only the join, preserving the door. No warehouse-specific caller filter or appointment allocation is performed. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.DOCK_MGR_SHIPMENT_HEADER

Add leading/trailing status names to shipment headers.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/928058392.sql](sql/928058392.sql), lines 1-23; SHA-256 `085e8bcb585fdf153a02b7f93c501b8f12b826df5d8bbc9a2d4b85ad7f17fc68`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Inner-equivalent joins hide missing mappings and can multiply duplicate mappings; no STATUS_FLOW_NAME predicate is used. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.DOCK_MGR_SHIPPING_CONTAINER

Present root shipping containers with a derived child dock-door flag.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/944058449.sql](sql/944058449.sql), lines 1-182; SHA-256 `36b93111232f74047ce83e7c7a3b1938adcca4cced6f8861aedf4b988b6ce341`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Roots without direct children are excluded. A root whose children occupy different dock types can produce multiple rows, even identical derived flags. It does not inspect arbitrary descendants. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.DOCK_MGR_SHIPPING_LOAD

Add leading/trailing status names to shipping loads.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/960058506.sql](sql/960058506.sql), lines 1-23; SHA-256 `12c684e5fb9376a2ba43bb34583235b1676ace9996657b3ab6b1860da438a85d`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Missing mappings hide rows; duplicate mappings can fan out. No status-flow-name or closed-state filtering. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.DOCUMENT_ROUTING_VIEW

Expose document-routing configuration.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/976058563.sql](sql/976058563.sql), lines 1-40; SHA-256 `c816bf5bcaf9e038b766d83a135ed06881ef2aec8e4883c867317748a0a4b9ab`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No ordering, matching-priority resolution, printer dispatch or current route choice occurs. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.GENERIC_ADDRESS_DETAIL_VIEW

Expose generic address identity, address and activity fields.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/992058620.sql](sql/992058620.sql), lines 1-16; SHA-256 `09845f5bb0d11606a09d6ac304fb2a7b0a49a4e1a90de5cb89dab029488b6b92`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No ACTIVE predicate, authorization enforcement or address validation. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.GET_CLIENT_SSO_VIEW

Expose feature-selected client SSO configuration key/value rows.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1684513380.sql](sql/1684513380.sql), lines 1-18; SHA-256 `3b0729f3c470e6866379fe8ff417bf96e547ca1bbe2fef7a00a0bdf962f0729b`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Second branch has no RECORD_TYPE restriction. NULL/nonmatching feature result uses ELSE record type. Same key with different values survives UNION; no precedence or login/token exchange occurs. No returned values or credentials were queried. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.INTERFACE_ERROR_VIEW

Expose interface-error fields as a reporting view.

Domains: shipping, integration.

- reporting_read_model: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/1008058677.sql](sql/1008058677.sql), lines 1-55; SHA-256 `fd3d58614f44b8a4eb119d4d1a9cd658e014fdd1218e58bb57a0fd9dfacf4084`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.INVENTORY_BALANCE_VIEW

Aggregate selected nonzero inventory balances by warehouse, item, company, unit and status.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/2082314678.sql](sql/2082314678.sql), lines 1-36; SHA-256 `f67de157ef6896a3b4cda4d405bc6ad697fe29a17321bc1be89581f0a6b8876f`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Negative quantities qualify. Individual bucket SUM can remain NULL. Grouping uses raw company/unit before display fallback, so different groups can appear with the same labels. Unused location join can multiply rows if its key is ambiguous; no inventory adjustment. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.ITEM_ORDER_QUANTITY_VIEW

Aggregate ordered shipment quantity for headers below trailing status 900.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/2098314735.sql](sql/2098314735.sql), lines 1-22; SHA-256 `fba76d3cd79a30c1e21b460780ad1ac5263adfff809864bae07cc33284476765`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: NULL trailing status excludes row. TOTAL_ORDERED_QUANTITY is total detail quantity, not unallocated or remaining quantity; different units are separate groups. No order, reservation or inventory mutation. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.LABOR_MANAGEMENT_DETAIL_VIEW

Expose labor management detail with optional item description and thumbnail.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/34359437.sql](sql/34359437.sql), lines 1-71; SHA-256 `ab397c8c328c721a68f9cfcd8910e90956b15d068e15f1b0aefc136ac497af9a`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Missing item preserves labor; repeated matching item rows can multiply it. Does not calculate or enforce labor performance. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.LOCATION_INVENTORY_ATTRIBUTES_VIEW

Expose inventory attribute fields for location inventory references.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1113875135.sql](sql/1113875135.sql), lines 1-26; SHA-256 `52932dcec6e7f6f637008001b7af9d0e2a0a731874ba2ecf99814ffcf188dc66`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Shared attribute records repeat for multiple inventory rows. Unreferenced attribute records are not included. No inventory movement or attribute mutation. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.LOT_VIEW

Combine current and retained lots with descriptions and current inventory-row counts.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1056058848.sql](sql/1056058848.sql), lines 1-37; SHA-256 `7cfee44af6e873e39636e23aa49d51febb732be7bc9101a0c7e460bb974413ba`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Count is rows, not distinct locations, and includes negative quantities. Retained lots use current inventory counts. Scalar description can fail on multiple matches; the fallback branch contains an unqualified warehouse reference and does not provide an explicit item-warehouse equality. Different branch markers preserve otherwise identical lot keys. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_ARCHIVE_DATA_VIEW

Project active archive-preference metadata.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1129875192.sql](sql/1129875192.sql), lines 1-40; SHA-256 `0605696a108d44c30371803e427f2e5b961abcd0eae23ce32eef74d6c9bf0bf1`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No configured values or paths were queried. This view neither runs archive operations nor reads archived payloads; last date is stored metadata. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_CYCLE_COUNT_PLAN_VIEW

Derive cycle-count plan totals and percentages from stored counters.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1072058905.sql](sql/1072058905.sql), lines 1-45; SHA-256 `f61ca0a50ae519198e85232c3fc8bbb8b60f83e44eb8983a75da5634bd5ac01a`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: NULL arithmetic can leave total transactions NULL while percentage takes zero branch. Data types govern division and rounding. No count generation, reconciliation or validation action. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_CYCLE_COUNT_REQUEST_VIEW

Expose cycle-count requests with plan-derived action presentation flags.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1088058962.sql](sql/1088058962.sql), lines 1-57; SHA-256 `9b80a7121bdac90a8b5db67a084def5e942f4a636bd66c188d1629bbacdcee07`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Missing plan excludes request; NULL selectors do not satisfy equality branches. Fixed text codes remain opaque. Flags do not establish authorization or execute either action. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_DIF_INCOMING_MESSAGE

Enrich incoming DIF messages with endpoint and event metadata.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/292248146.sql](sql/292248146.sql), lines 1-73; SHA-256 `3202016d9607f94810058bcc64168366b413346f06a9d4398ec3b83192edad61`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Missing endpoint/event hides the message; no enabled/status filter or execution occurs. Message-to-event and message-to-endpoint are separate joins, not endpoint/event consistency validation. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_DIF_OUTGOING_MESSAGE

Enrich outgoing DIF messages through event-associated endpoints.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/308248203.sql](sql/308248203.sql), lines 1-67; SHA-256 `920f4eaf46ab7ace81868bd42a0cbcf62370ba9d345f2487e8d2e93a11ae84cf`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Multiple endpoints for one event can duplicate message rows; missing event/endpoint excludes a message. No send or retry occurs. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_DOCUMENT_MANAGEMENT_VIEW

Present managed-document metadata with a derived file name.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/2114314792.sql](sql/2114314792.sql), lines 1-27; SHA-256 `5cad362ebc8813cbb6978a7d8d1739b7df4d017b170e1fec251802a7909167f2`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No document open or retrieval occurs. A non-NULL source lacking the selected separator gives length -1 and can fail SUBSTRING; NULL source propagates NULL. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_INVENTORY_AGGREGATE_VIEW

Aggregate inventory and location insight by location, item, company, lot and permanent state.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1700513437.sql](sql/1700513437.sql), lines 1-165; SHA-256 `dfba1733225450f86aa32468c4953a56e0b6b81da5229f33bafa904c2de620e8`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: SUM and join multiplicity affect totals. COUNT DISTINCT ignores NULL, so mixed NULL/non-NULL identifiers need not trigger multiple-value sentinel. Availability uses raw nullable arithmetic, unlike displayed coalesced buckets. No mixed-unit normalization; override flag covers only max ID. Aggregate TOTAL_WEIGHT is stored weight sum, separate from catch weight. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_INVENTORY_VIEW

Expose detailed inventory/location insight with serial and catch-weight context.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1716513494.sql](sql/1716513494.sql), lines 1-153; SHA-256 `3827c98cbb279c708d87146efeb3c21bd9d12421f7b7b0ac6edf286fa063ef8f`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Serial joins repeat inventory quantities per serial. Weight unit may come from catch-weight metadata even when zero weight causes stored-weight fallback. NULL raw bucket arithmetic falls to zero availability; no unit conversion or unique inventory-row guarantee. NULL item makes ItemCompany NULL. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_LABOR_ACTIVITY_VIEW

Derive labor activity time and average rate from stored quantity/rate.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/970030787.sql](sql/970030787.sql), lines 1-70; SHA-256 `00a80a6017697d936e2957b6a7b1e6cb02ea6c278f80f29f8a0e25995f458ad3`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Stored total actual time remains distinct from derived time. Numeric rounding can affect nested division; no aggregation, completion proof or labor mutation. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_LOT_VIEW

Combine current and retained lots with current inventory-row counts.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1136059133.sql](sql/1136059133.sql), lines 1-27; SHA-256 `77ccabca0af6299da811042c6a1c848e03b380d67a28199c1e18051f5b6b3483`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Count is inventory rows rather than distinct locations, includes negative balances, and uses current inventory for retained lots. Branch markers can preserve the same lot key twice; no item-description scalar lookup here. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_MANIFEST_VIEW

Supply an empty-shaped manifest presentation row.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1152059190.sql](sql/1152059190.sql), lines 1-20; SHA-256 `82249b9a0e4040911baaa5fa5e9612f9de507b0917e3d80516a1983a6217291a`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: This is not observed manifest data, counts, transmission state or a record of shipment date. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_MOP_VIEW

Present top-level containers assigned to a multi-order pallet.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1168059247.sql](sql/1168059247.sql), lines 1-42; SHA-256 `7cdbd6b8dc6528b1c9e4e32c28330991ff54797b654db551b452cf595ea20125`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No status filter. AND non-NULL tests constrain only the self arm of the OR; missing/ambiguous child location is not a consistency check. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_PROCESS_HISTORY_VIEW

Expose process-history records through insight aliases.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1184059304.sql](sql/1184059304.sql), lines 1-31; SHA-256 `f9a6fe6bd7e9de26f57c756edc5b2cf3581f0ca154e89065161c404c1ea9961b`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Stored history messages were not queried. No process execution, retry, ordering or immutable-audit guarantee. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_PURCHASE_ORDER_DETAIL_VIEW

Enrich purchase-order detail with optional header and receipt context.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1200059361.sql](sql/1200059361.sql), lines 1-106; SHA-256 `40ab0f565a0f2aa543fcd885bc521fb217798a3634e0244f546ac306934284e9`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Missing header preserves detail. Multiple related receipts have no deterministic selection rule. Status flag is display logic; no close or receive action. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_PURCHASE_ORDER_HEADER_VIEW

Expose purchase-order headers expanded by optional detail.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1216059418.sql](sql/1216059418.sql), lines 1-106; SHA-256 `c8426978e5642bcf4dfcdbb729f3dbed8c0556de7f2d72766771802c0ea4a719`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: A header with no details remains. Flags can repeat across lines and must not be summed as unique orders. Receipt choice is unspecified among matches. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_PUTAWAYGROUP_VIEW

Expose putaway groups with assigned location and receipt containers.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1232059475.sql](sql/1232059475.sql), lines 1-35; SHA-256 `82420f049e1fc10754966f58d95d2070f1b898630b689e612adba764672ee377`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No CLOSED filter. Multiple group containers expand group rows; missing location/container preserves group. No putaway execution. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_PUTWALL_LOCATION_VIEW

Expose put-wall locations with uncleared tote and shipment context.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/356248374.sql](sql/356248374.sql), lines 1-97; SHA-256 `85bd1b150d74f7576064b4350ae440abd071899bddee200b4ffdf40d41603dcb`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No ACTIVE filter. Multiple uncleared tote details fan out; absent tote preserves location. EMPTY display is not a measured inventory-empty proof. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_QUALITY_HISTORY_VIEW

Project quality-history records for an Insight read model.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1248059532.sql](sql/1248059532.sql), lines 1-37; SHA-256 `bfe2308556405097ec490bac0327ec8450100dff65ab9de4515a4d4763c0797d`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No retention, immutability, completion or inspection accuracy follows from the projection; history rows were not queried. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_RECEIPT_CONTAINER_VIEW

Assemble receipt-container insight with header, line and group context.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1264059589.sql](sql/1264059589.sql), lines 1-222; SHA-256 `1a90b5e81947f4cdf94929c864f365684a689a165b75cc24df525063f4a451b2`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: PRE_CHECK_IN_QTY can be NULL when header is closed or SUM has no input. Scalar lookup multiplicity can error; MAX_STATUS is immediate children only. Header totals repeat per container; no receipt or group state change. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_RECEIPT_LINE_VIEW

Expose receipt lines with header, container and immediate-need indicators.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1280059646.sql](sql/1280059646.sql), lines 1-109; SHA-256 `ecb27e1ccd04eaafdce6768137bfd18ef391bbafd8ed51043f5a326b84b8fdff`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Immediate-needs join has no warehouse predicate. Multiple containers and requests multiply line rows. Indicators are not unique-line counts unless grouped intentionally; missing header preserves detail. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_RECEIPT_VIEW

Assemble receipt insight across headers, details, appointments, immediate needs and containers.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/66359551.sql](sql/66359551.sql), lines 1-188; SHA-256 `7ad94e80f06088ea709136819e9017633db4f5501ba1870a161c520e1252abf2`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Immediate needs join has no warehouse predicate. Multiple requests, appointments or containers fan out. Scalar lookups can error on multiple matches. No receipt status filter or receiving action. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_SHIPMENT_DETAIL_VIEW

Enrich shipment lines with VAS, header, wave and load context.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1312059760.sql](sql/1312059760.sql), lines 1-191; SHA-256 `a41f1950bac5681c0cf513c6f467b69af69ff608371ac58c209ed1b1b31ad391`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Missing header excludes line. Multiple VAS activities repeat quantities; no DISTINCT or aggregate. Load confirmation and release are stored/presentation values, not actions. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_SHIPMENT_POOL_VIEW

Assemble shipment-pool insight from header, lines, load and wave.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1145875249.sql](sql/1145875249.sql), lines 1-338; SHA-256 `cfecb225abe0e11513da84dc579d9f543156046cf977022a2f05b474a2e395f3`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: The 80 alternative is already below 300. Missing detail preserves a header; multiple details repeat header totals. Fixed display labels remain opaque. This is distinct from the custom TRAV pool view. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_SHIPMENT_VIEW

Assemble shipment insight for threshold-selected status combinations.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1161875306.sql](sql/1161875306.sql), lines 1-384; SHA-256 `d2266c863e92100586a58330a615a8ba35f66aec4e9b2c9b4118eedb74f9e59f`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Pool and shipment predicates use different leading/trailing fields and are not complements. Missing detail preserves header; line fanout repeats totals. Presentation flags do not confirm or release shipments. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_SHIPPED_LOT_VIEW

Enrich shipped-lot rows with item master context.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/540581014.sql](sql/540581014.sql), lines 1-107; SHA-256 `9ed4f6ec9f1b33af4fc0b8770e7a9700cda60e53d997109ebf25cd62cf83a733`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Missing item retains the lot row. Repeated matches can multiply it; nested shipped-lot union and threshold semantics remain inherited. No ACTIVE item filter. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_SHIPPING_CONTAINER_VIEW

Expose shipping-container insight with shipment, parent, item and VAS context.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1418540187.sql](sql/1418540187.sql), lines 1-278; SHA-256 `2b3a70acf60e90ae6a2fe0b274a9fa71d73ec6dc9caa4c62baf22790b771ca07`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: NOLOCK is used on container, parent, shipment and load. Global and company-specific item matches can make scalar description fail. Fixed VAS/type/display codes remain opaque. No container status, QC, manifest or shipping action is executed. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_TOTE_LINE_VIEW

Present tote lines with optional tote/container context.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1177875363.sql](sql/1177875363.sql), lines 1-58; SHA-256 `0970449a9eed6f1fc7c8f391dcd2e2d724fa46c439b1dccde2997ad87c11ee1f`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: NULL sorted quantity remains NULL. Unused work/allocation joins can still affect multiplicity; a missing container produces the NULL-parent sort branch. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_TOTE_VIEW

Present tote headers and their detailed sorting contexts.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1193875420.sql](sql/1193875420.sql), lines 1-55; SHA-256 `109b1c18ccb7c7596d3e86b112b4a62c78ba0f99b29472a290ef0e5d229fc893`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Total line count repeats across detail rows; no details gives NULL total rather than0. No filter on tote condition or completion. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_TPM_ORDER_CONTAINER_STATUS_VIEW

Expose order-linked shipping containers and carrier tracking context for TPM.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1529980727.sql](sql/1529980727.sql), lines 1-119; SHA-256 `9043a53a648ff6d6ee76fa30fadb49b46d472d0d3ceb43367b532038f40f7550`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Different header/container order references can yield different lookup context. Scalar duplicates can error; carrier matches can fan out before UNION. Child checks are immediate only, no retained-source union appears, and tracking links do not prove delivery. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_TPM_ORDER_LINE_STATUS_VIEW

Present order-line status context for trading partners.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1360059931.sql](sql/1360059931.sql), lines 1-30; SHA-256 `4f435048986b5316dc696f7dc773654e3a0a77b0c8c9103c7a8a9e785f40e484`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Missing header excludes detail; no customer/company/warehouse authorization predicate or current-state freshness check. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_TPM_ORDER_STATUS_VIEW

Expose order status with preaggregated line and root-container counts.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1545980784.sql](sql/1545980784.sql), lines 1-42; SHA-256 `77c04e6fa2fc6308556036b2d9c483a5fcb8090c44f0d174689cd4ad94780c29`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No matching aggregate leaves NULL count, not zero. Container count is roots by container INTERNAL_ORDER_NUM, not all descendants or shipment totals. NOLOCK makes counts nonauthoritative for concurrent state. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_TPM_PURCHASE_ORDER_HEADER_VIEW

Expose purchase-order header/detail context for TPM.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1392060045.sql](sql/1392060045.sql), lines 1-104; SHA-256 `2cd03728c8608fab64fa2d463feac634ba51371c78e722b4efaaefef5aa8e2c3`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Missing detail preserves header. Multiple detail rows repeat order flags. Unlike the other insight header view, POHEADERCOMPANY is populated from header COMPANY; no receipt-selection ordering. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_TPM_PURCHASE_ORDER_LINE_STATUS_VIEW

Expose purchase-order line status with required header context for TPM.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1408060102.sql](sql/1408060102.sql), lines 1-106; SHA-256 `5e22de6bd15ae873caaa213c3ef3d388ccbf0c156bdcb727c04170c63233ef6b`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Unlike METADATA_INSIGHT_PURCHASE_ORDER_DETAIL_VIEW, a missing header excludes detail. Multiple receipt matches have no deterministic preference; no order closure or status mutation. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_TPM_RECEIPT_HEADER_STATUS_VIEW

Expose receipt-header status expanded by receipt and purchase-order details for TPM.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1424060159.sql](sql/1424060159.sql), lines 1-97; SHA-256 `e74272f2f4fccb80196fbfcb316e5473f767c2d618c707d81d69953d4e506426`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Missing details preserve header. Header totals repeat per detail; no DISTINCT or aggregate protects against downstream double counting. No header status filter. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_TPM_RECEIPT_LINE_STATUS_VIEW

Expose receipt-line status with required header for TPM.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1440060216.sql](sql/1440060216.sql), lines 1-97; SHA-256 `624e536825d11358b28c84771f1c4cc2d604afcd7243c80f2738e21cd276de0a`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Missing header excludes detail. This TPM view does not join immediate needs or containers and does not derive their flags; no receiving action. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_TRAN_HIST_VIEW

Expose transaction history with per-attribute serial and catch-weight context.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1732513551.sql](sql/1732513551.sql), lines 1-82; SHA-256 `9a096d5195787df12c19962982137b7c4c68aa9c4d89b2ee1ef1ba637c74f826`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Attribute rows are not pivoted or aggregated: separate weight/unit/serial attributes stay on separate output rows and unrelated types still expand history. Invalid numeric catch weight becomes NULL; serial join implicit conversion or duplicate matches can still fail/multiply. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_USER_ACTIVITY_VIEW

Present user activity with a configured type identifier.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1456060273.sql](sql/1456060273.sql), lines 1-39; SHA-256 `3b71f52ec6bcf6571ffa0ffe36cefba63b03e893940c8f3f889ca3eef166609a`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Duplicate config matches can multiply activity rows. No active-user filter or session termination occurs; operational user data was not read. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_VAS_VIEW

Present container VAS activity with shipment and QC display context.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1472060330.sql](sql/1472060330.sql), lines 1-32; SHA-256 `247627cee3791801fe159efb69027d008e3a6c78e19c4979e44113f0f431f70a`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Missing required joins hide assignments; no work completion or QC mutation occurs and fixed display labels remain opaque. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_WAREHOUSE_MOBILE_MENU_VIEW

Present warehouse-mobile menu definitions with parent grouping.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1488060387.sql](sql/1488060387.sql), lines 1-38; SHA-256 `a84ce02cb8b6fa97555137daa388281b643fd013d90e100da81fd606e78667b8`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No ACTIVE filter or user permission enforcement; missing non-NULL parent ID gives NULL menu group, not a fallback to own name. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_WAVE_VIEW

Derive wave display state from launch-statistics fields.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1504060444.sql](sql/1504060444.sql), lines 1-57; SHA-256 `06a6941ce343421b5285fa5bbde8e44cab8dc0fc6a436b5c26fc225e112d34e1`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Individual flags and ordered WAVE_STATUS are separate expressions. NULL comparison values can suppress completed classification. Fixed labels/selectors remain opaque; no wave start, release or cancellation occurs. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_WORK_ORDER_DETAIL_VIEW

Expose work-order details with header and instruction quantity context.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1520060501.sql](sql/1520060501.sql), lines 1-114; SHA-256 `20f8d258716aef638f7815d585c62e54ee911ef737b4c95bcca4b3ea59e6c164`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Instruction join has no internal-number type, instruction type or condition predicate, and can fan out. COMPLETE is a quantity alias, not a completion Boolean. Missing header preserves detail. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_WORK_ORDER_HEADER_VIEW

Aggregate work-order header insight across component, shipment and work joins.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1536060558.sql](sql/1536060558.sql), lines 1-135; SHA-256 `5be81109a2bb645e72760df7f3889f688f94f66ec5a9297df344a96e04eb30f8`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Independent MIN fields need not describe one component row. Shipment-detail/component/instruction fanout can multiply SUM(TO_QTY); COUNT DISTINCT protects only the shipment count. COMPLETE aliases requested build quantity and NULL WHCOMPANY is a placeholder. No work-order execution. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_WORK_ORDER_LICENSE_PLATE_VIEW

Expose work-order putaway units as license-plate insight.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1552060615.sql](sql/1552060615.sql), lines 1-95; SHA-256 `31607a4a0266b8cf9d34bd5525f27976afdecd90e1c9279f47c073874f0baf97`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Missing header preserves unit. Header quantities repeat for each putaway unit; COMPLETE is not a completion flag. No license-plate generation or putaway action. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_WORK_VIEW

Derive work insight presentation quantities and status counters.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/284580102.sql](sql/284580102.sql), lines 1-135; SHA-256 `9f03287bce615ce7f25971bb6f475c9c5af1c97bf5ce2870e4374ded7fefa4cb`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Fixed text selectors remain opaque. Nested work-view semantics remain a transitive boundary; duplicate scalar location matches can error. CASE quantities are row-level expressions, not totals or executed work. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_INSIGHT_WORLD_EASE_GROUP_VIEW

Present identified containers in positive World Ease groups.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1568060672.sql](sql/1568060672.sql), lines 1-22; SHA-256 `3ae142de42bf5c89fab43d0ce05f6f6c834d7506e2640ea8b985bd07c4b61bdd`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Missing shipment/shipper yields NULL context; tied same-company matches have no tie-breaker. No carrier transmit or close operation occurs. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_RECEIPT_QUALITY_HISTORY

Enrich receipt QC history with reason description and receipt context.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1584060729.sql](sql/1584060729.sql), lines 1-12; SHA-256 `2aa6e6b3917e92236ec639a26e407c5ff329e72f49a31b0a3d13bff7234ff725`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: WHERE on GCD null-rejects unmatched reasons, making that relationship effectively inner. Identifier/description matches can multiply rows; missing receipt alone remains permitted. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_TRANS_BUILD_WAVE_VIEW

Expose active wave-master name, description and flow choices.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1600060786.sql](sql/1600060786.sql), lines 1-17; SHA-256 `752f55cf80e00419e61500a0a678b1a758596dd00d663279d04cecf036d2999f`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No warehouse authorization join, wave creation or release is performed. Effective ACTIVE values were not queried. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_TRANS_MANUAL_REPLENISHMENT_VIEW

Expose active manually selectable replenishment definitions and warehouse metadata.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1748513608.sql](sql/1748513608.sql), lines 1-20; SHA-256 `aff6798e34e7ea1f49cc897ce5872978f23e3343222eb2c353ec3475e4e4b768`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Authorization condition is in ON and does not filter out a master; NULL or excluded authorization yields NULL joined access. No requested warehouse/user predicate and no replenishment execution. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_TRANS_WAVE_FLOW_VIEW

Expose active wave-flow header choices.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1632060900.sql](sql/1632060900.sql), lines 1-14; SHA-256 `c8448c061075a8a66f43c1363238aef1980c54ed405cb1c427d0babb8bf32f36`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No step execution, ordering, user authorization or validation that a flow is usable. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METADATA_TRANS_WAVE_MASTER_VIEW

Expose active wave masters with optional warehouse authorization rows.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1648060957.sql](sql/1648060957.sql), lines 1-24; SHA-256 `15d7bd64f4094e83c0e1f216ce9b3c1f5644f5aed18b53b9b7a25f80de7b5d9f`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Missing authorization rows preserve the active master with NULL warehouse. No caller/user/selected warehouse predicate is applied; projecting authorization metadata is not access enforcement. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.METATRANS_GetBillOfMaterialDetailsView

Present bill-of-material detail with item lot-control metadata.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1664061014.sql](sql/1664061014.sql), lines 1-20; SHA-256 `080f2969597caffc1210e7b7d67be3d84ecda3243b4c289cb9930ba9ac470e7b`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Both global and company-specific item rows can match and duplicate a component. No explicit precedence, active filter or BOM execution. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.MOVEMENT_CLASS_ANALYSIS_UM_VIEW

Expose movement-class unit definitions with item or class object identity.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1680061071.sql](sql/1680061071.sql), lines 1-31; SHA-256 `751321c5400e1d8ae1cfc150c3bc79e18c574a8e34897cb4e003687987144a5e`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Fallback is per row here, unlike the global-count choice in MOVEMENT_CLASS_ANALYSIS_VIEW. Specific and global item rows can both match; missing joins preserve unit. No conversion computation or setting update. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.MOVEMENT_CLASS_ANALYSIS_VIEW

Enrich movement-class analysis with permanent-location and unit conversions.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/572581128.sql](sql/572581128.sql), lines 1-51; SHA-256 `645d00297f8eeff8f3c92b264203523c809bef4d25046669b32053ff8c2aa55b`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Object-ID choice is global, not per row. Quantity division has no explicit zero guard. APPLY functions can multiply rows; NOLOCK permits inconsistent reads and effective conversion values were not queried. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.MULTI_ORDER_PALLET_VIEW

Present multi-order-pallet containers with a status description.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1696061128.sql](sql/1696061128.sql), lines 1-35; SHA-256 `4c21521afa35830ed923121ba8542aaa8496920d34221b806031688ed0dcdb80`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No status filter or deterministic choice for TOP1. Child null-value arms differ from self due to AND/OR precedence. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.PRODUCT_RECALL_VIEW

Expose current and retained shipped container rows for recall analysis.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/508580900.sql](sql/508580900.sql), lines 1-37; SHA-256 `d5d40616670431d03c255355ae305a784bb130e0b880f8fd5c4d192e4b0dbd8b`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Overlapping current/retained identities can multiply across both unions. NULL threshold/status excludes rows. This read model neither initiates nor completes a recall. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.PURCHASE_ORDER_DETAIL_VIEW

Expose purchase-order details with optional header warehouse.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1712061185.sql](sql/1712061185.sql), lines 1-60; SHA-256 `6ac96f8dceddf8e80c3936f74b52f3995fe893a7e4946db24800c17eeeece825`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Missing header preserves detail with NULL warehouse. No status filter, calculated totals or receipt linkage. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.PURCHASE_ORDER_HEADER_VIEW

Aggregate purchase-order header totals from detail rows.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1728061242.sql](sql/1728061242.sql), lines 1-67; SHA-256 `33b346640a53c4bef519d29661b03dd82bfc1c52eaeebc015d974ee046ffdc46`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Header without details yields zero sums/count. NULL factors are ignored by SUM. Units are not converted before summing; MAX weight unit is a label choice, not validation of homogeneous units. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.RECEIPT_CONTAINER_VIEW

Combine active and deleted receipt-container projections.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1744061299.sql](sql/1744061299.sql), lines 1-153; SHA-256 `e64f7838d92fe3e657f952194714ae1eb29dc6e6d22fe63846cd83dcb0ad2c06`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Deleted branch does not look up a deleted parent. Missing parent gives NULL; repeated parent scalar matches can error. UNION removes identical full rows, not duplicate IDs; no deleted/current provenance flag or restore action. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.RECEIPT_HEADER_VIEW

Enrich receipt headers with purchase-order summary and appointments.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1760061356.sql](sql/1760061356.sql), lines 1-100; SHA-256 `f1bb1f5f29945484395931376c25f8eb53e8180e3d919447ca7834eddcdaec73`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: COUNT DISTINCT ignores NULL. No purchase order yields NULL; multiple appointments repeat header totals. Inner grouped sources use NOLOCK. Does not choose one appointment or allocate a dock. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.REPLENISHMENT_REQUEST_VIEW

Project replenishment requests with computed measurements and source/destination inventory context.

Domains: allocation_wave_replenishment.

- reporting_read_model: Returns the stated context/aggregate/output projection; not process execution. Evidence: E1.

E1: [DB Architecture/sql/588581185.sql](sql/588581185.sql), lines 1-37; SHA-256 `8a039f44aea5b60f15fdc2ebb19fa7bdd1049665213de256ae82981394469eb4`. Complete module body reviewed with original-definition fingerprint.

Limits: Full module body reviewed for this bounded role; no complete caller graph, effective configuration, operational execution or prefix-based ownership claim.


## dbo.RESOURCE_FILE_BASE_CUSTOM_VIEW

Pair base and custom localized resources without selecting an effective override.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1764513665.sql](sql/1764513665.sql), lines 1-18; SHA-256 `c9b4f27a4ec07a78ac0909f40a6054964853d9d875268eed5fbe16cec3455d2a`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No custom-wins text expression. NULL join keys do not match, and duplicate identities can multiply pairs. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.sci_receipt_container_view

Read current and retained receipt-container rows together.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1776061413.sql](sql/1776061413.sql), lines 1-6; SHA-256 `2c56403cb70ee221b96e51e1e3eee2c13519a820318e54dd9a86fb1bf4e9ed60`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No source flag, duplicate removal or current-source precedence; compatible source schemas are required. No receiving or archive movement. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.sci_receipt_detail_view

Read current and retained receipt details together.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1792061470.sql](sql/1792061470.sql), lines 1-6; SHA-256 `2b0039727afa9e8fe0da3a866a34bf4f876ca7f2fac91c3824fc4cdc3144b02e`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Duplicate identities remain. SELECT * relies on compatible source schemas and does not establish complete retained history or current receipt state. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.sci_receipt_header_view

Read current and retained receipt headers together.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1808061527.sql](sql/1808061527.sql), lines 1-6; SHA-256 `0103319ce3c16d81036483ab7472f608c94613443375a9e26e26994e99d8d7f6`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No deduplication, provenance flag or current-over-retained preference. Header presence does not prove receiving completion; source-schema compatibility is required. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SCI_SHIPMENT_DETAIL_VIEW

Combine selected current and retained shipment-detail fields for SCI.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1824061584.sql](sql/1824061584.sql), lines 1-481; SHA-256 `2f05b30d03aea99485935a017707ec929782e023a9ceef53d928501ef5457d9c`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Identical full projection rows collapse; differing rows with same ID survive. The NULL slot is not observed business data. No source provenance, status filter, unit conversion or shipment mutation. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SCI_SHIPMENT_HEADER_VIEW

Combine selected current and retained shipment-header fields for SCI.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1840061641.sql](sql/1840061641.sql), lines 1-520; SHA-256 `034f598f2975b5aa7940c54667fd26dcdb1d428309516acbfbe3edce85142b41`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No branch marker or current-source precedence. Duplicate elimination uses every selected field, not just shipment identity. Stored dates and status values do not prove current operational acceptance. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SCI_SHIPPING_CONTAINER_VIEW

Combine current and retained shipping-container projections for SCI with a positional mapping concern.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1856061698.sql](sql/1856061698.sql), lines 1-277; SHA-256 `fbae0fd5d61c72106d9b1329c2fdfc97e2f6913080b4b6852f7e132090daa1c8`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: UNION aligns by position: retained logistics-unit values populate World Ease output fields and retained World Ease values populate logistics-unit fields, subject to engine type conversion. This is a static definition concern, not a reproduced runtime incident. No provenance flag, deduplication by ID or source preference. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.sci_shipping_load_view

Read current and retained shipping loads together.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1872061755.sql](sql/1872061755.sql), lines 1-6; SHA-256 `c423392fc4790e0a9cc05ae54ba5617dc1e406adc9857312962038278896123e`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No source provenance flag, deduplication, current-over-retained precedence or movement occurs. SELECT * depends on compatible source schemas. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.sci_transaction_history_view

Read current and retained transaction history together.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1888061812.sql](sql/1888061812.sql), lines 1-6; SHA-256 `74be4a5f8eaaf961a1e141f49a65babd661be626fed36ae15ef78a56cfe27667`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No source flag or deduplication; record presence is not immutable/comprehensive history or whole-process timing. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.sci_work_instruction_view

Read active, inactive and retained instruction tables together.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1904061869.sql](sql/1904061869.sql), lines 1-10; SHA-256 `7b384a05965d8e1c59482045665e840bebf4027047e6d7d3efc85f1cc43c2ab0`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No source flag, filtering, deduplication or precedence; an instruction appearing in multiple tables appears multiple times. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SERIAL_NUMBER_VIEW

Read current and retained serial-number rows.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1920061926.sql](sql/1920061926.sql), lines 1-13; SHA-256 `f6ff6f3872ce6af53b0ca4f5f37b3e95eda229be29f2e6a6bd1d1ce699c54cac`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No explicit NOLOCK in this body; caller isolation and source schema compatibility apply. No archive movement or unique serial guarantee. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIP_CONT_DOCK_AREA_IN_TRANSIT

Associate container in-transit locations with dock areas.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/300580159.sql](sql/300580159.sql), lines 1-36; SHA-256 `9946c362f4497e70e3d98284a4265ad4bb51b4089bbd3d2ca4c9adedd26c800f`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Inner matches can hide missing status/location mappings or multiply ambiguous ones. State flags encode this branch, not a separate inventory measurement; fixed selectors remain opaque. Duplicate full projection rows collapse. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIP_CONT_DOCK_AREA_ON_HAND

Associate container on-hand locations with dock areas.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/316580216.sql](sql/316580216.sql), lines 1-35; SHA-256 `a05f337adc9cc0d7be9eacee695e2f028ed7fcd6340739d262c08b9f93e53c61`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Inner matches can hide missing status/location mappings or multiply ambiguous ones. State flags encode this branch, not a separate inventory measurement; fixed selectors remain opaque. Duplicate full projection rows collapse. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIP_CONT_DOCK_POS_IN_TRANSIT

Associate container in-transit locations with dock positions.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/332580273.sql](sql/332580273.sql), lines 1-35; SHA-256 `c7cf7771ae8e0440b3602074d54685d0873aeeebe50a43f8d62c53653a60fcce`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Inner matches can hide missing status/location mappings or multiply ambiguous ones. State flags encode this branch, not a separate inventory measurement; fixed selectors remain opaque. No DISTINCT in this position/container view. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIP_CONT_DOCK_POS_ON_HAND

Associate container on-hand locations with dock positions.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/348580330.sql](sql/348580330.sql), lines 1-35; SHA-256 `892ff47df31acf5780716ac38a2c9b96b6cca8b8123fa16ec59584effc27bf5c`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Inner matches can hide missing status/location mappings or multiply ambiguous ones. State flags encode this branch, not a separate inventory measurement; fixed selectors remain opaque. No DISTINCT in this position/container view. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIP_HEADER_DOCK_AREA_IN_TRANS

Associate shipment in-transit locations with dock areas.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/364580387.sql](sql/364580387.sql), lines 1-45; SHA-256 `04ea718a1073951290d093644f098ba5282418c75294610db16b541ac0842b52`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Inner matches can hide missing status/location mappings or multiply ambiguous ones. State flags encode this branch, not a separate inventory measurement; fixed selectors remain opaque. Duplicate full projection rows collapse. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIP_HEADER_DOCK_AREA_ON_HAND

Associate shipment on-hand locations with dock areas.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/380580444.sql](sql/380580444.sql), lines 1-44; SHA-256 `b3cc1b89fd1b1898c9bb36c6ba7b9c49217f25830ffe7811cb50939fbcd1c38c`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Inner matches can hide missing status/location mappings or multiply ambiguous ones. State flags encode this branch, not a separate inventory measurement; fixed selectors remain opaque. Duplicate full projection rows collapse. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIP_HEADER_DOCK_POS_IN_TRANS

Associate shipment in-transit locations with dock positions.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/396580501.sql](sql/396580501.sql), lines 1-45; SHA-256 `84ba60a4bbef1a65e4f1eb87fef41ccbd99c051bd34b0d841da41be4ac9c961e`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Inner matches can hide missing status/location mappings or multiply ambiguous ones. State flags encode this branch, not a separate inventory measurement; fixed selectors remain opaque. Duplicate full projection rows collapse. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIP_HEADER_DOCK_POS_ON_HAND

Associate shipment on-hand locations with dock positions.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/412580558.sql](sql/412580558.sql), lines 1-44; SHA-256 `76c143a69aa3a3dd9935f3b41c885d196e5ffaef13eed3168d392106b278369f`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Inner matches can hide missing status/location mappings or multiply ambiguous ones. State flags encode this branch, not a separate inventory measurement; fixed selectors remain opaque. Duplicate full projection rows collapse. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.Shipment_Detail_VAS_Activity_Grid_View

Present shipment-detail VAS assignments with derived confirmation.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1936061983.sql](sql/1936061983.sql), lines 1-64; SHA-256 `209fb5eae6c1bf35ac4bbe4fd0e52df18dff53f18069076e4fba363107a9f1ca`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: The nested container set is selected at shipment level, not restricted to this shipment line. Completion is a derived numeric display value, not an action; scalar detail-to-shipment lookup cardinality is required. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIPMENT_DETAIL_VIEW

Read selected current and retained shipment-line fields.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1952062040.sql](sql/1952062040.sql), lines 1-12; SHA-256 `59a01a052534b627a0f0b2db8f28a8e98645c237565755d82d193d998f8746a2`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Duplicates collapse over projected fields only; no current/retained provenance or source preference. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIPMENT_HEADER_DOCK_AREA

Combine shipment dock-area on-hand and in-transit projections.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/428580615.sql](sql/428580615.sql), lines 1-11; SHA-256 `5f452d093e0f87f45a16c2cd53af13136c3f3ae135ea1916edaba6f8220aacdb`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: UNION removes identical full rows, not rows sharing only entity identity. Different state-flag values can preserve two rows for the same entity/location. No order or physical movement is performed. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIPMENT_HEADER_DOCK_POS

Combine shipment dock-position on-hand and in-transit projections.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/444580672.sql](sql/444580672.sql), lines 1-14; SHA-256 `e42b31bb1f7e24acabd5f9ec7113a2bb319dd6604b27e9aab9ad7b369d01ee28`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: UNION removes identical full rows, not rows sharing only entity identity. Different state-flag values can preserve two rows for the same entity/location. No order or physical movement is performed. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIPMENT_HEADER_IN_TRANSIT

Derive shipment in-transit destination locations from links and work.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1968062097.sql](sql/1968062097.sql), lines 1-37; SHA-256 `d1366e29bb5958e00e493bf1341d5706aaf9a4a932ff9287d72b972aa6467bf7`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: The second branch lacks the first status threshold and does not check work TO_WHS against shipment warehouse; linked LOCATION branch also lacks warehouse equality. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIPMENT_HEADER_ON_HAND

Derive shipment on-hand locations from container locations.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1984062154.sql](sql/1984062154.sql), lines 1-17; SHA-256 `52ba63a7c93ee51057f69fc3b8c866a0c5115702747a06e46a5c0a17f0360b3e`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No positive inventory quantity, status, leaf hierarchy or container-warehouse predicate; the alias leaf is not a leaf test. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIPMENT_HEADER_ORDER_VIEW

Group shipment details by order and customer PO for reading.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/2000062211.sql](sql/2000062211.sql), lines 1-21; SHA-256 `4795f3109715b130a1d926678337483a6a4b23c7497d9b7ee01413ef06cc8407`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: MAX can conceal differing values within a group; derived state is not unanimous per-detail proof and has no application permission check. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.Shipment_Header_VAS_Activity_Grid_View

Present shipment-header VAS assignments with derived confirmation.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/2016062268.sql](sql/2016062268.sql), lines 1-41; SHA-256 `e0d39a649fb5082459649b4b803b1539e28e1743c588c111b9113baa717805df`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No matching assignment yields0; ELSE MIN can be NULL. Confirmation does not mutate assignment or prove operational completion beyond stored flags. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIPMENT_HEADER_VIEW

Calculate shipment summary totals with container/manual/detail precedence.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/2032062325.sql](sql/2032062325.sql), lines 1-227; SHA-256 `f7fa46262701aacff5832542d3c3132abdd77e2968c8eceb83a90d01f9c1b2c6`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: NOLOCK across all three sources. Root definition is only PARENT IS NULL, not an identifier/status/item filter. No conversion normalizes mixed units; computed view totals can differ from stored header columns. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIPMENT_HEADER_VIEW_SIMPLE

Read a compact current and retained shipment-header projection.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/2048062382.sql](sql/2048062382.sql), lines 1-12; SHA-256 `85546ec0da7fd81e3ff0ad6059a8eed7a665d7a3b1cfa2b5f1fb2720cb9b6b70`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Deduplicate full projected rows; no source priority or freshness/status filter. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIPPED_LOT_VIEW

Expose shipped container lots across current and retained records.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/524580957.sql](sql/524580957.sql), lines 1-37; SHA-256 `bba2aa51538f9d4f3539bc1d8a0d4572c1224b2096a7ba06cba90bcb3ed1b66f`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Empty lot text is not excluded by IS NOT NULL. Overlapping retained/current identities can multiply; missing threshold prevents matches. No physical shipment verification. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIPPING_CONTAINER_DOCK_AREA

Combine container dock-area on-hand and in-transit projections.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/460580729.sql](sql/460580729.sql), lines 1-14; SHA-256 `57490c75f81aa9373c00d60b072e0acb0758d3280d26c88a60961662e52325d6`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: UNION removes identical full rows, not rows sharing only entity identity. Different state-flag values can preserve two rows for the same entity/location. No order or physical movement is performed. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIPPING_CONTAINER_DOCK_POS

Combine container dock-position on-hand and in-transit projections.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/476580786.sql](sql/476580786.sql), lines 1-19; SHA-256 `3941312dd0b2eeabc487d32af9aa90431d6bbb2a7597c2eb7f8b6204d16fcebd`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: UNION removes identical full rows, not rows sharing only entity identity. Different state-flag values can preserve two rows for the same entity/location. No order or physical movement is performed. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIPPING_CONTAINER_IN_TRANSIT

Derive shipping-container in-transit locations.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/2064062439.sql](sql/2064062439.sql), lines 1-36; SHA-256 `f2ed5620adfc85abc109215c263d3da89a41d070a2eb5a8c4716e26b25b70796`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Status threshold applies only to first branch. NULL TREE_UNIT comparison falls to own ID. The two branches use different identity normalization and can both return rows. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIPPING_CONTAINER_ON_HAND

Derive container on-hand locations normalized to tree units.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/2080062496.sql](sql/2080062496.sql), lines 1-14; SHA-256 `4ffb1376173d07374279b17e8a1ed37c70c59d5ba2c1de2a8899028538d9a46a`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No positive quantity or status test; NULL TREE_UNIT falls to own ID. View reports stored location, not physical inventory verification. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIPPING_CONTAINER_ORDER_VIEW

Aggregate item-bearing shipping-container quantities by displayed order/container identity.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/2096062553.sql](sql/2096062553.sql), lines 1-42; SHA-256 `71c3ff0bf79be18b4cd87e2a52e6187231f950da483f13c095325430a83c30f0`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Missing parent/tree can yield NULL display identity; no unit conversion, status filter or duplicate-source correction. NULL-only quantities sum to NULL. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.Shipping_Container_VAS_Activity_Grid_View

Present container VAS assignments with numeric confirmation.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/2112062610.sql](sql/2112062610.sql), lines 1-29; SHA-256 `b8d1dd9e86096b5f5826c253a9cbfc9d1de57a290b8aee5ff366a5d2b0c83ae4`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: NULL completion takes ELSE1; this displayed confirmation does not enforce a completion operation. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIPPING_CONTAINER_VIEW

Read selected current and retained shipping-container fields.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/2128062667.sql](sql/2128062667.sql), lines 1-10; SHA-256 `9a6e0fce46525b3f2b62f8939fd4852b7a83b58a85641dc66f493e083c5559bd`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Rows identical on projected columns collapse; no source precedence, archive movement or freshness check. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIPPING_LOAD_SHIPPING_ADDRESS_VIEW

Present load summaries alongside shipping addresses.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/2144062724.sql](sql/2144062724.sql), lines 1-83; SHA-256 `138f2c4d9c6cf7c0cc90e5f5722cf748ed6cf7502abcfb957b9f9b1238f2bd09`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Multiple address rows repeat load totals. NOLOCK on load and nested summary sources; no address-record-type filter or preferred-address selection. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SHIPPING_LOAD_VIEW

Summarize shipping loads with shipment-derived totals and dock-door location.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/12579133.sql](sql/12579133.sql), lines 1-67; SHA-256 `948596099804885bbd1d8ce966adbf5de33a96a400e5cdfa1cd3d377350e9fea`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: NOLOCK reads include nested shipment totals; totals are not an atomic snapshot or physical departure proof. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.SPLIT_SHIPMENT_VIEW

Prepare line data for shipment splitting.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/28579190.sql](sql/28579190.sql), lines 1-20; SHA-256 `7f73b3ff53101008855ae9f6edc1c5e687552a996f48a3448a5a0313e2b2b0fd`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: The zero split value is presentation data, not a stored mutation or total over every status slot. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.STANDALONE_SERVICE_PROPERTIES_VIEW

Expose standalone-service configuration shape.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1780513722.sql](sql/1780513722.sql), lines 1-8; SHA-256 `70f3b1f6ed7e19c23cd04c85ce3816861b6665831ccdc2a8df77fbed353a8035`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Missing scalar config yields NULL; duplicate scalar matches can error. This definition was read only; no returned credential/config values were queried or published. Feature/caller binding and access controls remain external. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.TRANSACTION_HISTORY_INVENTORY_ATTRIBUTE_VIEW

Enrich transaction history with inventory attributes and pivoted catch-weight metadata.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1796513779.sql](sql/1796513779.sql), lines 1-65; SHA-256 `ef28f79875318288c3d93527c4069b9ab651145fb5e6cb0d7afd2a7b832f1bb8`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: MAX chooses among duplicate attribute values rather than detecting conflicts; values are text before weight conversion. Same attribute ID with differing current/retained fields survives UNION and can multiply history. Invalid weight becomes NULL; implicit ID conversion remains separate. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.TRAV_METADATA_INSIGHT_MOP_VIEW

Present multi-order-pallet Insight with pallet user-defined fields.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1881318012.sql](sql/1881318012.sql), lines 1-44; SHA-256 `0331976f5fe29b0b7e7313878d7cb3289f6a8726cdc28358d81c1fae7249e4c4`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No status filter. Same child/self OR precedence and nondeterministic TOP1 behavior as the base MOP Insight. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.TRAV_METADATA_INSIGHT_SHIPMENT_POOL_VIEW

Present the below-300 shipment pool with line and wave/load context.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1762209428.sql](sql/1762209428.sql), lines 1-56; SHA-256 `bc0e4fe4a3faca252f271a9ef891c8d5301f75ec6b7e8594dbdcfc24fbb02c40`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Customer weight is summed after line expansion and can repeat header weight per line; partition omits warehouse/company. No query result order or guaranteed one row per shipment. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.TRAV_METADATA_INSIGHT_SHIPPING_CONTAINER_VIEW

Present shipping containers with parent, header/load/wave and VAS context.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/1804793737.sql](sql/1804793737.sql), lines 1-49; SHA-256 `9056ad620f8b80d66a64af526baa6f5ef2e8a1923595b0b774ab0ef9170a3194`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: NOLOCK on core joins. Item scalar can fail when global and specific item records both match. No status filter or warehouse/company authorization predicate; joins/subqueries can alter grain. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.TRAV_MULTI_ORDER_PALLET_VIEW

Present top-level active-status containers with optional pallet and shipment context.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/60579304.sql](sql/60579304.sql), lines 1-29; SHA-256 `1e9eab07c041b7d8da36338cfc6e48cdbc0f466d95b76bea63ba9ee2f732810a`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Warehouse comes from optional pallet and can be NULL. TOP 1 has no order; child location/work-zone arms do not require non-NULL value because AND binds to the self arm. Child item aggregate uses NOLOCK. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.UPLOAD_ORDER_CONTAINER_VIEW

Combine selected current and retained UPLOAD_ORDER_CONTAINER columns for reading.

Domains: shipping, integration.

- reporting_read_model: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/76579361.sql](sql/76579361.sql), lines 1-14; SHA-256 `a1185d228ad5ac6848a4b311b6abd89098df531c9b5c1569a7a079641c4c8d1e`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.UPLOAD_ORDER_DETAIL_VIEW

Combine selected current and retained UPLOAD_ORDER_DETAIL columns for reading.

Domains: shipping, integration.

- reporting_read_model: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/92579418.sql](sql/92579418.sql), lines 1-12; SHA-256 `0c42d30f7d227cb91ce22583fb7af6006b03892ca5d4c01ba0b830470e214470`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.UPLOAD_ORDER_HEADER_VIEW

Combine selected current and retained UPLOAD_ORDER_HEADER columns for reading.

Domains: shipping, integration.

- reporting_read_model: The reviewed body returns the described values or selection shape. Evidence: E1.

E1: [DB Architecture/sql/108579475.sql](sql/108579475.sql), lines 1-14; SHA-256 `384be9c6177aaedf538839b7d6e957496d4d99a7334b94717390ddb634036f45`. Complete retained body structure reviewed; original fingerprint verified; only stated nonsensitive control conclusions are published.

Limits: Body-level review does not establish runtime, deployed UI binding, ownership or complete business-process semantics.


## dbo.VIEWER_MRO

Project retained shipment order lines for a materiel-release viewer.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/124579532.sql](sql/124579532.sql), lines 1-5; SHA-256 `81862155e05020e9c338e5772309aea5fd35aa927df59c34a32d180fad5fca53`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No filtering or deduplication. Retained table projection does not prove physical delivery or archive payload inspection. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.VIEWER_PACKAGE

Project retained shipment package tracking context.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/140579589.sql](sql/140579589.sql), lines 1-13; SHA-256 `6c63fc8826b0fc3d99eb165fd436031df5ace6b7865b2fbb5430ec58048a1c72`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: The later INNER JOIN requires a container-parent chain. Textual parent-ID join has no warehouse predicate. Duplicate parent identifiers can multiply intermediate rows; NULL carrier uses the ELSE branch. No carrier confirmation. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.VIEWER_RECEIPTS

Project retained receipt detail for a receipts viewer.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/156579646.sql](sql/156579646.sql), lines 1-4; SHA-256 `3c4fc9eb6cfeca590610538ed46eccb0c09f3a2084492979f815d87b5448902a`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: No filter, deduplication or receiving action. Stored quantities and fixed labels do not prove physical receipt. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.WORK_INSTRUCTION_VIEW

Expose active and inactive instruction rows through one read surface.

Domains: work_execution.

- reporting_read_model: Combines active and inactive instruction sources with UNION ALL. Evidence: E1.

E1: [DB Architecture/sql/172579703.sql](sql/172579703.sql), lines 1-9; SHA-256 `f8ad80899fdf8de790c7a4e5df028bf9981cc3f774a55f1a3f99538f86e109c2`. Complete module body reviewed with original-definition fingerprint.

Limits: Scope is the body and named effects, not runtime success, current data, caller authorization or complete end-to-end semantics.


## dbo.WORK_ORDER_DETAIL_VIEW

Join work-order details to header and item context.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/188579760.sql](sql/188579760.sql), lines 1-68; SHA-256 `7a7a1e067db02e18c8937b5600d621eb5b4ddda03437d956636c36c73cb151d6`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: Company-specific and global item matches can both survive and multiply a detail. Missing header/item excludes it. Header quantities repeat; no activity filter. Static read shape does not establish complete process semantics, ownership or operational acceptance.


## dbo.YARD_LOCATION_VIEW

Project configured yard locations.

Domains: reporting.

- reporting_read_model: The complete SELECT definition returns the documented per-view projection or aggregate. Evidence: E1.

E1: [DB Architecture/sql/204579817.sql](sql/204579817.sql), lines 1-16; SHA-256 `100a138cfa8c206f17416690c563401bd63a9a2eefd7bb99e6bf810b11883a90`. Complete retained body reviewed; source hash and full redaction equivalence verified privately; raw comments/literals excluded.

Limits: The fixed type label remains opaque; no active, warehouse or authorization predicate exists. Static read shape does not establish complete process semantics, ownership or operational acceptance.
