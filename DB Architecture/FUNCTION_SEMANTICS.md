# Function semantics

Snapshot `20260929T214106Z`. 68 fully reviewed FN/IF/TF module bodies; 82 roles including14 supporting tables; 17 help topics and37 authored boundary cases. No operational function calls, records or archive content were accessed.

[Machine-readable contracts and exact evidence](mappings/batches/function-semantics.json) · [Configuration validation boundary](CONFIGURATION_VALIDATION.md)

Scalar/returned-table output is separate from real application enforcement or physical process execution. The function bodies do not modify persistent rows. Full structural reading, original-definition hashes and guarded literal classifications support only the stated bounded contracts.

Week boundaries depend on the session setting because [DATEPART weekday uses DATEFIRST](https://learn.microsoft.com/en-us/sql/t-sql/functions/datepart-transact-sql?view=sql-server-ver17). The reviewed week functions do not set it. Dashboard work windows separately convert local midnight to UTC then add24hours, rather than independently convert the next local midnight. No DST scenario was executed.

## Security helper precedence

No. fn_GetSecurityValues chooses a whole User, Group, then System row. The per-form checkpoint function falls back only when no characters were produced and its group query omits a level filter. The all-form function makes fallback globally, so one user form can suppress defaults on other forms. SecurityPermissionEnabled instead reads Group, User, System by username and returns1 when no string exists.

**Configuration:** Form/user/group metadata and literal checkpoint Y; each function has its own lookup predicates.

**Boundary:** No actual authentication, policy enforcement or reproduced bypass is claimed. Static function semantics only; no operational rows, archive content or function execution.

**Reviewed functions:** [fn_GetSecurityValues](sql/712701937.sql), [SECfn_GetSecurityCheckPoint](sql/1537752881.sql), [SECfn_GetSecurityCheckPointByUsername](sql/1553752938.sql), [SecurityPermissionEnabled](sql/1569752995.sql)

## Work zone predicate

It only tests profile/zone association. A NULL zone returns1 even for a missing profile. It does not authenticate a user or check warehouse access, selected instruction eligibility or the operation being requested.

**Configuration:** WORK_PROFILE_ZONE_AUTH and supplied profile/zone.

**Boundary:** Caller enforcement remains external. Static function semantics only; no operational rows, archive content or function execution.

**Reviewed functions:** [IsWorkZoneAuthorized](sql/1784705756.sql)

## Status-slot helpers

These slot helpers use position order. One returns the count before the first zero; another stops at zero or994+, returning the previous slot. Equality helpers return the first matching slot or its quantity, without summing duplicate statuses. None sorts the inputs or validates a status transition.

**Configuration:** Supplied ten status/quantity slots; declared defaults require appropriate function DEFAULT syntax.

**Boundary:** Slot ordering is a caller invariant, not established by helper name. Static function semantics only; no operational rows, archive content or function execution.

**Reviewed functions:** [SDBfn_GetLeadingStsPos](sql/87319721.sql), [SDBfn_GetPosOfSts](sql/103319778.sql), [SDBfn_GetQtyAtSts](sql/119319835.sql), [SDBfn_GetLeadingStsInRange](sql/1489752710.sql)

## Status flow lookup

No. Any non-NULL flow name uses custom-flow detail and can returnNULL when no adjacent status exists. Only NULL flow name selects the default functional-area flow. Direction0 goes backward; other values includingNULL go forward. Name/number helpers simply look up mappings.

**Configuration:** Custom/default configuration versus fixed text dictionaries are distinct sources.

**Boundary:** No allowed-action validation or current deployment code meaning proved. Static function semantics only; no operational rows, archive content or function execution.

**Reviewed functions:** [STSfn_RtrvSts](sql/199320120.sql), [STSfn_RtrvAdjacentSts](sql/2097754876.sql), [STSfn_RtrvStsName](sql/2129754990.sql), [ILSStatusToText](sql/1165247206.sql), [ILSTransactionTypeToText_fn](sql/1149247149.sql)

## Timezone and week helpers

No. SCI_DST_CONVERT ignores its warehouse input and uses the email-matched user default warehouse. SCI_DST_CONVERT_WHSE treats its whse input directly as a timezone name. GetWarehouseDate returns a local date. Week helpers convert to warehouse time only when the date input isNULL, and their boundaries depend on DATEFIRST.

**Configuration:** Warehouse TIME_ZONE, user email/default warehouse, session DATEFIRST and supplied timestamp convention.

**Boundary:** No current timezone setting or DST execution observed. Static function semantics only; no operational rows, archive content or function execution.

**Reviewed functions:** [GetWarehouseDate](sql/984702906.sql), [SCI_DST_CONVERT](sql/1185751627.sql), [SCI_DST_CONVERT_WHSE](sql/1201751684.sql), [DATEFn_GetWeekEndDate](sql/1628181196.sql), [DATEFn_GetWeekStartDate](sql/1644181253.sql)

## Date-only and fractional-second transforms

It subtracts the millisecond component. Other small helpers remove time through string conversion, return a time on SQL base date, or reconstruct a compact date string from fixed positions. Their result types and parsing/range boundaries differ.

**Configuration:** SQL date parsing/session conventions; DATEONLY returns narrower SMALLDATETIME.

**Boundary:** No timezone transformation in these pure helpers. Static function semantics only; no operational rows, archive content or function execution.

**Reviewed functions:** [DHfn_TransToSQLDate](sql/7319436.sql), [DHfn_GetDateNoTime](sql/2122802970.sql), [DHfn_RoundToSec](sql/2138803027.sql), [TimeOnly](sql/621245268.sql), [DATEONLY](sql/1421248118.sql)

## Resource and description fallback

Resource lookup treats NULL/empty key as empty output, uses supplied or configured language, then custom/base/English text and finally the key. Message lookup has a different missing-language early return and missing-key marker. Generic translated description falls back to raw description only when the resource key isNULL, not whenever translation is missing.

**Configuration:** Language system config, custom/base resource records and generic SYS1VALUE.

**Boundary:** No resource message content or current language read. Static function semantics only; no operational rows, archive content or function execution.

**Reviewed functions:** [RSCMfn_RtrvMsg](sql/1089751285.sql), [RSCMfn_RtrvResource](sql/1105751342.sql), [DYNAMICCALLINGfn_RtrvDesc](sql/632701652.sql), [GENCONFIGfn_RtrvDesc](sql/728701994.sql), [GENCONFIGfn_RtrvTranslatedDesc](sql/744702051.sql), [LABORCONFIGfn_RtrvDesc](sql/2088706839.sql)

## Available-quantity branch differences

No. SUM branches assignNULL when no rows match; the attribute-specific nonaggregate branch retains initial0 on no match and can choose one of several rows. The without-in-transit function also differs in parent logistics, lot and filter behavior, so it is not simply the first function minus transit stock.

**Configuration:** showAll/includeAttributes flags, location allocate-in-transit flag, identity and optional filters.

**Boundary:** Computed availability does not reserve inventory or clamp negative results. Static function semantics only; no operational rows, archive content or function execution.

**Reviewed functions:** [INVfn_GetAvailableQuantity](sql/1672705357.sql), [INVfn_GetAvailableQuantityWithoutInTransit](sql/1688705414.sql), [INVfn_AreInvAttributeValuesSame](sql/1640705243.sql)

## Unit conversion fallback

The retrieval functions generally stop at the first stage with rows, and the stages differ by function. Location preference lists can fall back to unrestricted item/class units. Full UOM retrieval can fall through to storage template. Quantity conversion returns the original quantity when no complete factor pair exists, which does not prove equal units.

**Configuration:** Location UOM list/container tracking, item/company/class factors and storage-template details.

**Boundary:** No quantity reservation or verified current configuration; zero divisors and local-return primary keys can fail. Static function semantics only; no operational rows, archive content or function execution.

**Reviewed functions:** [INVfn_RtrvConversionInfoForItemAndLocation](sql/1704705471.sql), [ITMfn_CalcQtyForReqUm](sql/1816705870.sql), [ITMfn_RtrvUnitOfMeasure](sql/1832705927.sql)

## Item measurement defaults

INVfn_RtrvItemInfo runs UOM measurement lookup only when override isNULL. Any non-NULL value skips it, leaving zero-substituted volume/weight. Both item-info helpers return one row even when item/UOM lookup fails; zeros can be missing-data substitutions rather than measured product values.

**Configuration:** Item/company/class UOM rows; sequence1 for base helper and requested UM for general helper.

**Boundary:** Location/warehouse inputs in these bodies are unused. Static function semantics only; no operational rows, archive content or function execution.

**Reviewed functions:** [INVfn_RtrvItemInfoForBaseUM](sql/397244470.sql), [INVfn_RtrvItemInfo](sql/1720705528.sql)

## Catch-weight unit sources

No. The function first requires item catch-weight Y. It tries a supplied/resolved inventory ID, item/class base UOMs, other inventory for the item/company across warehouses, then active generic units. Source codes distinguish these stages; configured fallback weight1 is not a measurement.

**Configuration:** Item catch-weight flag, optional inventory ID, UOM/catch-weight records and generic units.

**Boundary:** Attribute lookup uses inventory internal ID=attribute object ID in source; no operational effect reproduced. Static function semantics only; no operational rows, archive content or function execution.

**Reviewed functions:** [INVfn_RtrvWeightUM](sql/1736705585.sql)

## Bounded report text

They are bounded varchar2000 projections that stop before appending more text, without an omitted-count indicator. Serial helpers use UNION ALL across current/archive-named tables and sequence0 template rules. Invoice/PO/BOL helpers instead use specific DISTINCT keys. Unicode values can lose characters in varchar output.

**Configuration:** Document/comment assignments, serial templates and routine-specific ordering/deduplication.

**Boundary:** No report values or archive data read; audit helper separately caps30000. Static function semantics only; no operational rows, archive content or function execution.

**Reviewed functions:** [RPTfn_GetCommentText](sql/961750829.sql), [RPTfn_GetInvoiceNumberText](sql/977750886.sql), [RPTfn_GetLocInvSernText](sql/993750943.sql), [RPTfn_GetMultiStopBOLNums](sql/1009751000.sql), [RPTfn_GetPurchaseOrderText](sql/1025751057.sql), [RPTfn_GetShipContSernText](sql/1041751114.sql), [RPTfn_GetUnderlyingBOLNums](sql/1057751171.sql), [fn_AuditLogValueReturnValue](sql/631165494.sql)

## BOL ordinals and lot expiration selection

BOL stop helper returns a shipment-row ordinal when found, but can return the last stored stop sequence when not found. Multi-stop formatting counts distinct stop/BOL pairs. Lot expiration chooses the greatest object ID across current/archive, not the greatest date or an explicit live-table preference.

**Configuration:** Supplied load/shipment/type or lot identity; catalog source references only.

**Boundary:** Tie order and current/archive authority remain unestablished. Static function semantics only; no operational rows, archive content or function execution.

**Reviewed functions:** [RPTfn_GetBOLStopNum](sql/945750772.sql), [RPTfn_GetMultiStopBOLNums](sql/1009751000.sql), [GetLotExpirationDateForUpload](sql/1229247434.sql)

## Identifier and sequence suggestions

No. Screen sequence returns MAX+25 and can beNULL for an empty group. Project instance suggests maximum+1 across collected tables. Work-unit helper uses lexical maximum plus a padded suffix. None reserves the result or performs an INSERT; concurrent callers can receive the same suggestion.

**Configuration:** Screen metadata, collected project/mapping tables, configured delimiter and existing work-unit names.

**Boundary:** No uniqueness or atomic allocation claim. Static function semantics only; no operational rows, archive content or function execution.

**Reviewed functions:** [METAfn_GetNextScreenControlSequence](sql/341224616.sql), [METAfn_GetScreenControl](sql/357224673.sql), [METAfn_GetScreenGroup](sql/373224730.sql), [GetNextProjectInstance](sql/936702735.sql), [WRTRV_RtrvUniqueWorkUnit](sql/1386800348.sql), [CdGetIdentityColumn](sql/1244179828.sql)

## String and XML transforms

Split IDs use ROW_NUMBER over no meaningful ordering, so original order is not guaranteed. List modifiers parse unescaped constructed XML, deduplicate additions, remove matching tokens and extract nvarchar100 values; they do not preserve original order or arbitrary XML-sensitive content. Endpoint/key-value XML helpers format data without calling an endpoint.

**Configuration:** Separators, fixed XML namespace/path/wrapper and database collation.

**Boundary:** Not general CSV, XML schema validation, URI encoding or remote execution. Static function semantics only; no operational rows, archive content or function execution.

**Reviewed functions:** [GENfn_SplitString](sql/760702108.sql), [ModifyCharacterSeparatedStringList](sql/1349228207.sql), [ModifyCommaSeparatedStringList](sql/1365228264.sql), [GetActionEndPointXMLValues](sql/824702336.sql), [ConvertKeyValueTableToXML](sql/1372180284.sql), [DBHfn_TransDOToDBFieldName](sql/536701310.sql), [SHfn_LastIndexOf](sql/167320006.sql), [TpmOrderContainerStatus_TrackingLink](sql/94271741.sql)

## Small numeric transforms

Its formula is10 minus weighted sum modulo10, so remainder0 returns10. Missing/empty concatenated input also reaches10. The decimal least/greatest helpers have another boundary: NULL first argument leavesNULL even when later values exist, and default decimal scale does not retain arbitrary fractions.

**Configuration:** Fixed source arithmetic/patterns; no external labeling-standard certification.

**Boundary:** No synthetic or operational SQL execution performed. Static function semantics only; no operational rows, archive content or function execution.

**Reviewed functions:** [LBLfn_Checkdigit_86_BarnesAndNobles](sql/101223761.sql), [fn_least](sql/1277247605.sql), [fn_greatest](sql/1293247662.sql), [fn_record_type](sql/1261247548.sql)

## Dashboard KPI semantics

No. Several IDs return fixed numbers. Other branches count joined rows, calculate stored dashboard formulas or use selected timestamp intervals. Shortest/longest/average dock intervals have different no-data behavior. Work day ends are UTC start+24h and can differ from a local DST day. Unknown type/ID returns0; missing scalar data can yieldNULL or a percentage fallback0.

**Configuration:** Supplied date pair, warehouse timezone, stored dashboard values, hard-coded IDs and status/type predicates.

**Boundary:** No complete-process timing, actual current metrics, operational execution or reproduced defect claim. Static function semantics only; no operational rows, archive content or function execution.

**Reviewed functions:** [DASHFn_GetKPIValue](sql/1612181139.sql), [DATEFn_GetWeekEndDate](sql/1628181196.sql), [DATEFn_GetWeekStartDate](sql/1644181253.sql)

## Review inventory

| Function | Bounded purpose |
|---|---|
| [dbo.DHfn_TransToSQLDate](sql/7319436.sql) | Convert a compact date-time text into a datetime. |
| [dbo.SDBfn_GetLeadingStsPos](sql/87319721.sql) | Find the occupied prefix length of ten status slots before the first zero. |
| [dbo.SDBfn_GetPosOfSts](sql/103319778.sql) | Find the first of ten status slots equal to a requested status. |
| [dbo.SDBfn_GetQtyAtSts](sql/119319835.sql) | Return quantity from the first status slot matching a requested status. |
| [dbo.SDBfn_GetLeadingStsInRange](sql/1489752710.sql) | Return the status immediately preceding the first zero or status at/above994. |
| [dbo.STSfn_RtrvSts](sql/199320120.sql) | Resolve a system status name to a numeric functional-area status. |
| [dbo.STSfn_RtrvStsName](sql/2129754990.sql) | Resolve a numeric functional-area status to its stored display name. |
| [dbo.STSfn_RtrvAdjacentSts](sql/2097754876.sql) | Find numerically adjacent status in a custom or default flow. |
| [dbo.SHfn_LastIndexOf](sql/167320006.sql) | Find the last occurrence of a pattern using repeated CHARINDEX. |
| [dbo.DHfn_GetDateNoTime](sql/2122802970.sql) | Strip datetime time through date text conversion. |
| [dbo.DHfn_RoundToSec](sql/2138803027.sql) | Remove fractional milliseconds from datetime. |
| [dbo.TimeOnly](sql/621245268.sql) | Retain datetime time on SQL base date. |
| [dbo.DATEONLY](sql/1421248118.sql) | Convert datetime to date-only smalldatetime through character text. |
| [dbo.GetWarehouseDate](sql/984702906.sql) | Return warehouse-local calendar date from an assumed UTC datetime. |
| [dbo.SCI_DST_CONVERT](sql/1185751627.sql) | Convert assumed UTC time using the email-matched user default warehouse zone. |
| [dbo.SCI_DST_CONVERT_WHSE](sql/1201751684.sql) | Convert assumed UTC time using an argument that is itself a timezone name. |
| [dbo.DATEFn_GetWeekEndDate](sql/1628181196.sql) | Compute a week-end calendar date from DATEPART weekday arithmetic. |
| [dbo.DATEFn_GetWeekStartDate](sql/1644181253.sql) | Compute a week-start calendar date from DATEPART weekday arithmetic. |
| [dbo.METAfn_GetNextScreenControlSequence](sql/341224616.sql) | Suggest the next screen-control sequence as current maximum plus25. |
| [dbo.METAfn_GetScreenControl](sql/357224673.sql) | Resolve screen-control identity within a named form group. |
| [dbo.METAfn_GetScreenGroup](sql/373224730.sql) | Resolve screen-group identity through form, screen and part metadata. |
| [dbo.DBHfn_TransDOToDBFieldName](sql/536701310.sql) | Insert underscores before ASCII uppercase characters in an object field name. |
| [dbo.fn_AuditLogValueReturnValue](sql/631165494.sql) | Concatenate audit-log values for a field and internal identity. |
| [dbo.DYNAMICCALLINGfn_RtrvDesc](sql/632701652.sql) | Retrieve stored description by record type and identifier. |
| [dbo.GENCONFIGfn_RtrvDesc](sql/728701994.sql) | Retrieve stored description by record type and identifier. |
| [dbo.GENCONFIGfn_RtrvTranslatedDesc](sql/744702051.sql) | Retrieve generic configuration description with resource-key translation when present. |
| [dbo.fn_GetSecurityValues](sql/712701937.sql) | Select a form security-value string using user/group/system precedence. |
| [dbo.SECfn_GetSecurityCheckPoint](sql/1537752881.sql) | Expand one form security string into checkpoint rows with whole-result fallback. |
| [dbo.SECfn_GetSecurityCheckPointByUsername](sql/1553752938.sql) | Expand security checkpoints across forms with one global fallback decision. |
| [dbo.SecurityPermissionEnabled](sql/1569752995.sql) | Check requested checkpoint characters using a specific fallback order and permissive missing-data result. |
| [dbo.IsWorkZoneAuthorized](sql/1784705756.sql) | Test a work-profile/zone association with NULL-zone allowance. |
| [dbo.GetActionEndPointXMLValues](sql/824702336.sql) | Flatten configured endpoint XML and assign viewer grouping counters. |
| [dbo.GetNextProjectInstance](sql/936702735.sql) | Suggest the next project instance from current and archived collected configuration. |
| [dbo.CdGetIdentityColumn](sql/1244179828.sql) | Map an original configuration identity to a collected current value. |
| [dbo.RSCMfn_RtrvMsg](sql/1089751285.sql) | Retrieve a message through configured language and custom/base fallback. |
| [dbo.RSCMfn_RtrvResource](sql/1105751342.sql) | Retrieve resource text with custom/base/language fallback. |
| [dbo.LABORCONFIGfn_RtrvDesc](sql/2088706839.sql) | Resolve a labor/work description from work type or localized identifier. |
| [dbo.INVfn_AreInvAttributeValuesSame](sql/1640705243.sql) | Compare twenty stored inventory-attribute values after NULL substitution. |
| [dbo.INVfn_GetAvailableQuantity](sql/1672705357.sql) | Calculate available inventory under optional in-transit and identity filters. |
| [dbo.INVfn_GetAvailableQuantityWithoutInTransit](sql/1688705414.sql) | Calculate available inventory without in-transit using its own identity rules. |
| [dbo.INVfn_RtrvConversionInfoForItemAndLocation](sql/1704705471.sql) | Return conversion candidates using location UOM preference then item/class fallback. |
| [dbo.INVfn_RtrvItemInfoForBaseUM](sql/397244470.sql) | Return one item/base-UOM information row with numeric zero substitutions. |
| [dbo.INVfn_RtrvItemInfo](sql/1720705528.sql) | Return one item/UOM measurement and descriptive row. |
| [dbo.INVfn_RtrvWeightUM](sql/1736705585.sql) | Retrieve catch-weight unit candidates through inventory, item/class and generic fallback. |
| [dbo.ITMfn_CalcQtyForReqUm](sql/1816705870.sql) | Convert quantity using matched original/requested UM factors with location/item/class fallback. |
| [dbo.ITMfn_RtrvUnitOfMeasure](sql/1832705927.sql) | Return the first available unit-of-measure set from location, item, class or storage template. |
| [dbo.TpmOrderContainerStatus_TrackingLink](sql/94271741.sql) | Substitute a tracking number into a fixed tracking-link placeholder. |
| [dbo.RPTfn_GetBOLStopNum](sql/945750772.sql) | Return shipment ordinal within ordered load rows for a coded master-BOL type. |
| [dbo.RPTfn_GetCommentText](sql/961750829.sql) | Build document-qualified comment text up to a bounded length. |
| [dbo.RPTfn_GetInvoiceNumberText](sql/977750886.sql) | Concatenate distinct INVOICE values for one shipment/load. |
| [dbo.RPTfn_GetPurchaseOrderText](sql/1025751057.sql) | Concatenate distinct CUSTOMER_PO values for one shipment/load. |
| [dbo.RPTfn_GetUnderlyingBOLNums](sql/1057751171.sql) | Concatenate distinct BOL_NUM_ALPHA values for one shipment/load. |
| [dbo.RPTfn_GetLocInvSernText](sql/993750943.sql) | Concatenate reportable serial numbers from current and archive-named tables. |
| [dbo.RPTfn_GetShipContSernText](sql/1041751114.sql) | Concatenate reportable serial numbers from current and archive-named tables. |
| [dbo.RPTfn_GetMultiStopBOLNums](sql/1009751000.sql) | Format numbered BOL entries for distinct load stop/BOL pairs. |
| [dbo.GetLotExpirationDateForUpload](sql/1229247434.sql) | Select lot expiration from the greatest captured lot object identity across current/archive sources. |
| [dbo.LBLfn_Checkdigit_86_BarnesAndNobles](sql/101223761.sql) | Calculate the coded alternating-weight label check value. |
| [dbo.GENfn_SplitString](sql/760702108.sql) | Split and trim nonempty tokens with generated ordinal-like IDs. |
| [dbo.ILSTransactionTypeToText_fn](sql/1149247149.sql) | Render selected numeric codes using fixed text labels with numeric-text fallback. |
| [dbo.ILSStatusToText](sql/1165247206.sql) | Render selected numeric codes using fixed text labels with numeric-text fallback. |
| [dbo.fn_record_type](sql/1261247548.sql) | Classify a fixed set of grouping-bit patterns into report record categories. |
| [dbo.fn_least](sql/1277247605.sql) | Find minimum of up to ten decimal inputs using first argument as initial value. |
| [dbo.fn_greatest](sql/1293247662.sql) | Find maximum of up to ten decimal inputs using first argument as initial value. |
| [dbo.ModifyCharacterSeparatedStringList](sql/1349228207.sql) | Merge unique string-list entries then remove selected values using XML parsing. |
| [dbo.ModifyCommaSeparatedStringList](sql/1365228264.sql) | Merge unique string-list entries then remove selected values using XML parsing. |
| [dbo.ConvertKeyValueTableToXML](sql/1372180284.sql) | Serialize a key/value table parameter to XML-shaped text and inject a coded namespace wrapper. |
| [dbo.WRTRV_RtrvUniqueWorkUnit](sql/1386800348.sql) | Suggest a work-unit name using configured delimiter and incremented suffix. |
| [dbo.DASHFn_GetKPIValue](sql/1612181139.sql) | Compute a selected dashboard count, stored-data formula, fixed baseline or timestamp interval. |

## Evidence and remaining gaps

Every module source record contains exact redacted path, full line range, redacted hash and original-definition hash. The KPI adds focused branch spans and a complete reviewed identifier/formula inventory. The three ambiguous dependency entries are XML value methods on local aliases. No function in this batch is a catalog dynamic-SQL candidate.

Four vendor-family associations remain partial. Permission helpers have different precedence and missing-data behavior; positive predicate output alone does not establish authorized application execution. Defaults, NULL, duplicate-row, conversion, ordering and output-granularity boundaries are recorded separately in each contract.

The37 help cases are authored specifications, not executed SQL or proof of runtime acceptance. Current configuration, caller enforcement, data uniqueness, whole-process timing and accessibility acceptance remain external. Private literal strings beyond approved semantic categories are intentionally unexposed.
