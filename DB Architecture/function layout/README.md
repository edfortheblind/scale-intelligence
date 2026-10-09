# SCALE function layout

76 complete routine definitions from snapshot `20260929T214106Z` (2026-09-29).

This is the retained 2026-09-29 replica capture, not a new database inspection. The .sql file is the complete captured sys.sql_modules.definition encoded as UTF-8, including original comments, literals and line endings; nothing is prepended or reformatted. Captured definition text is not a complete deployment script: permissions, SET options, session context and dependencies are separate. No routine was executed. Static references do not establish branch execution, current use or runtime table scans. Vendor-base versus customer customization ownership is not established by names or comments.

On 2026-10-08 the owner explicitly authorized these complete source exports in this repository, Git and GitHub, including public source publication. The captured originals remain unchanged. These files document source; no database execution occurred.

Every original definition was checked against the retained module catalog fingerprint before export. Each routine has a byte-preserving .sql file, a programming reference .md file, and a .json record containing complete retained metadata and reviewed contract fields.

[Capture and hash manifest](manifest.json) · [Table layouts](../table%20layout/README.md)

| Routine | Type | As-is SQL | Structured record | UTF-8 bytes |
| --- | --- | --- | --- | --- |
| [dbo.CdGetIdentityColumn](1244179828.md) | Scalar function | [SQL](1244179828.sql) | [JSON](1244179828.json) | 864 |
| [dbo.ConvertKeyValueTableToXML](1372180284.md) | Scalar function | [SQL](1372180284.sql) | [JSON](1372180284.json) | 757 |
| [dbo.DASHFn_GetKPIValue](1612181139.md) | Scalar function | [SQL](1612181139.sql) | [JSON](1612181139.json) | 32170 |
| [dbo.DATEFn_GetWeekEndDate](1628181196.md) | Scalar function | [SQL](1628181196.sql) | [JSON](1628181196.json) | 970 |
| [dbo.DATEFn_GetWeekStartDate](1644181253.md) | Scalar function | [SQL](1644181253.sql) | [JSON](1644181253.json) | 942 |
| [dbo.DATEONLY](1421248118.md) | Scalar function | [SQL](1421248118.sql) | [JSON](1421248118.json) | 385 |
| [dbo.DBHfn_TransDOToDBFieldName](536701310.md) | Scalar function | [SQL](536701310.sql) | [JSON](536701310.json) | 1545 |
| [dbo.DHfn_GetDateNoTime](2122802970.md) | Scalar function | [SQL](2122802970.sql) | [JSON](2122802970.json) | 663 |
| [dbo.DHfn_RoundToSec](2138803027.md) | Scalar function | [SQL](2138803027.sql) | [JSON](2138803027.json) | 563 |
| [dbo.DHfn_TransToSQLDate](7319436.md) | Scalar function | [SQL](7319436.sql) | [JSON](7319436.json) | 1062 |
| [dbo.DYNAMICCALLINGfn_RtrvDesc](632701652.md) | Scalar function | [SQL](632701652.sql) | [JSON](632701652.json) | 672 |
| [dbo.fn_AuditLogValueReturnValue](631165494.md) | Scalar function | [SQL](631165494.sql) | [JSON](631165494.json) | 811 |
| [dbo.fn_GetCriticalLevel](664701766.md) | Scalar function | [SQL](664701766.sql) | [JSON](664701766.json) | 1328 |
| [dbo.fn_GetFeatureEnabled](680701823.md) | Scalar function | [SQL](680701823.sql) | [JSON](680701823.json) | 484 |
| [dbo.fn_GetMonitorFilterParameters](696701880.md) | Table-valued function | [SQL](696701880.sql) | [JSON](696701880.json) | 4316 |
| [dbo.fn_GetSecurityValues](712701937.md) | Scalar function | [SQL](712701937.sql) | [JSON](712701937.json) | 686 |
| [dbo.fn_greatest](1293247662.md) | Scalar function | [SQL](1293247662.sql) | [JSON](1293247662.json) | 962 |
| [dbo.fn_least](1277247605.md) | Scalar function | [SQL](1277247605.sql) | [JSON](1277247605.json) | 933 |
| [dbo.fn_record_type](1261247548.md) | Scalar function | [SQL](1261247548.sql) | [JSON](1261247548.json) | 2023 |
| [dbo.GENCONFIGfn_RtrvDesc](728701994.md) | Scalar function | [SQL](728701994.sql) | [JSON](728701994.json) | 663 |
| [dbo.GENCONFIGfn_RtrvTranslatedDesc](744702051.md) | Scalar function | [SQL](744702051.sql) | [JSON](744702051.json) | 1061 |
| [dbo.GENfn_SplitString](760702108.md) | Inline table-valued function | [SQL](760702108.sql) | [JSON](760702108.json) | 557 |
| [dbo.GetActionEndPointXMLValues](824702336.md) | Table-valued function | [SQL](824702336.sql) | [JSON](824702336.json) | 1935 |
| [dbo.GetLotExpirationDateForUpload](1229247434.md) | Scalar function | [SQL](1229247434.sql) | [JSON](1229247434.json) | 897 |
| [dbo.GetNextProjectInstance](936702735.md) | Scalar function | [SQL](936702735.sql) | [JSON](936702735.json) | 794 |
| [dbo.GetWarehouseDate](984702906.md) | Scalar function | [SQL](984702906.sql) | [JSON](984702906.json) | 526 |
| [dbo.GetWarehouseTimezoneValue](1000702963.md) | Scalar function | [SQL](1000702963.sql) | [JSON](1000702963.json) | 859 |
| [dbo.ILSStatusToText](1165247206.md) | Scalar function | [SQL](1165247206.sql) | [JSON](1165247206.json) | 1045 |
| [dbo.ILSTransactionTypeToText_fn](1149247149.md) | Scalar function | [SQL](1149247149.sql) | [JSON](1149247149.json) | 2606 |
| [dbo.INVfn_AreInvAttributeValuesSame](1640705243.md) | Scalar function | [SQL](1640705243.sql) | [JSON](1640705243.json) | 3010 |
| [dbo.INVfn_DoOpenRplnExist](1656705300.md) | Scalar function | [SQL](1656705300.sql) | [JSON](1656705300.json) | 3309 |
| [dbo.INVfn_GetAvailableQuantity](1672705357.md) | Scalar function | [SQL](1672705357.sql) | [JSON](1672705357.json) | 4777 |
| [dbo.INVfn_GetAvailableQuantityWithoutInTransit](1688705414.md) | Scalar function | [SQL](1688705414.sql) | [JSON](1688705414.json) | 2914 |
| [dbo.INVfn_RtrvConversionInfoForItemAndLocation](1704705471.md) | Table-valued function | [SQL](1704705471.sql) | [JSON](1704705471.json) | 4348 |
| [dbo.INVfn_RtrvItemInfo](1720705528.md) | Table-valued function | [SQL](1720705528.sql) | [JSON](1720705528.json) | 4646 |
| [dbo.INVfn_RtrvItemInfoForBaseUM](397244470.md) | Table-valued function | [SQL](397244470.sql) | [JSON](397244470.json) | 4014 |
| [dbo.INVfn_RtrvWeightUM](1736705585.md) | Table-valued function | [SQL](1736705585.sql) | [JSON](1736705585.json) | 7218 |
| [dbo.IsWorkZoneAuthorized](1784705756.md) | Scalar function | [SQL](1784705756.sql) | [JSON](1784705756.json) | 1008 |
| [dbo.ITMfn_CalcQtyForReqUm](1816705870.md) | Scalar function | [SQL](1816705870.sql) | [JSON](1816705870.json) | 4440 |
| [dbo.ITMfn_RtrvUnitOfMeasure](1832705927.md) | Table-valued function | [SQL](1832705927.sql) | [JSON](1832705927.json) | 9837 |
| [dbo.LABORCONFIGfn_RtrvDesc](2088706839.md) | Scalar function | [SQL](2088706839.sql) | [JSON](2088706839.json) | 732 |
| [dbo.LBLfn_Checkdigit_86_BarnesAndNobles](101223761.md) | Scalar function | [SQL](101223761.sql) | [JSON](101223761.json) | 1546 |
| [dbo.METAfn_GetNextScreenControlSequence](341224616.md) | Scalar function | [SQL](341224616.sql) | [JSON](341224616.json) | 764 |
| [dbo.METAfn_GetScreenControl](357224673.md) | Scalar function | [SQL](357224673.sql) | [JSON](357224673.json) | 841 |
| [dbo.METAfn_GetScreenGroup](373224730.md) | Scalar function | [SQL](373224730.sql) | [JSON](373224730.json) | 737 |
| [dbo.ModifyCharacterSeparatedStringList](1349228207.md) | Scalar function | [SQL](1349228207.sql) | [JSON](1349228207.json) | 2375 |
| [dbo.ModifyCommaSeparatedStringList](1365228264.md) | Scalar function | [SQL](1365228264.sql) | [JSON](1365228264.json) | 2524 |
| [dbo.RPTfn_GetBOLStopNum](945750772.md) | Scalar function | [SQL](945750772.sql) | [JSON](945750772.json) | 1973 |
| [dbo.RPTfn_GetCommentText](961750829.md) | Scalar function | [SQL](961750829.sql) | [JSON](961750829.json) | 1564 |
| [dbo.RPTfn_GetInvoiceNumberText](977750886.md) | Scalar function | [SQL](977750886.sql) | [JSON](977750886.json) | 1097 |
| [dbo.RPTfn_GetLocInvSernText](993750943.md) | Scalar function | [SQL](993750943.sql) | [JSON](993750943.json) | 2291 |
| [dbo.RPTfn_GetMultiStopBOLNums](1009751000.md) | Scalar function | [SQL](1009751000.sql) | [JSON](1009751000.json) | 1498 |
| [dbo.RPTfn_GetPurchaseOrderText](1025751057.md) | Scalar function | [SQL](1025751057.sql) | [JSON](1025751057.json) | 1134 |
| [dbo.RPTfn_GetShipContSernText](1041751114.md) | Scalar function | [SQL](1041751114.sql) | [JSON](1041751114.json) | 1896 |
| [dbo.RPTfn_GetUnderlyingBOLNums](1057751171.md) | Scalar function | [SQL](1057751171.sql) | [JSON](1057751171.json) | 1144 |
| [dbo.RSCMfn_RtrvMsg](1089751285.md) | Scalar function | [SQL](1089751285.sql) | [JSON](1089751285.json) | 1673 |
| [dbo.RSCMfn_RtrvResource](1105751342.md) | Scalar function | [SQL](1105751342.sql) | [JSON](1105751342.json) | 2405 |
| [dbo.SCI_DST_CONVERT](1185751627.md) | Scalar function | [SQL](1185751627.sql) | [JSON](1185751627.json) | 1007 |
| [dbo.SCI_DST_CONVERT_WHSE](1201751684.md) | Scalar function | [SQL](1201751684.sql) | [JSON](1201751684.json) | 514 |
| [dbo.SDBfn_GetLeadingStsInRange](1489752710.md) | Scalar function | [SQL](1489752710.sql) | [JSON](1489752710.json) | 2006 |
| [dbo.SDBfn_GetLeadingStsPos](87319721.md) | Scalar function | [SQL](87319721.sql) | [JSON](87319721.json) | 1217 |
| [dbo.SDBfn_GetPosOfSts](103319778.md) | Scalar function | [SQL](103319778.sql) | [JSON](103319778.json) | 1272 |
| [dbo.SDBfn_GetQtyAtSts](119319835.md) | Scalar function | [SQL](119319835.sql) | [JSON](119319835.json) | 1832 |
| [dbo.SECfn_GetSecurityCheckPoint](1537752881.md) | Table-valued function | [SQL](1537752881.sql) | [JSON](1537752881.json) | 2710 |
| [dbo.SECfn_GetSecurityCheckPointByUsername](1553752938.md) | Table-valued function | [SQL](1553752938.sql) | [JSON](1553752938.json) | 2537 |
| [dbo.SecurityPermissionEnabled](1569752995.md) | Scalar function | [SQL](1569752995.sql) | [JSON](1569752995.json) | 2056 |
| [dbo.SHfn_LastIndexOf](167320006.md) | Scalar function | [SQL](167320006.sql) | [JSON](167320006.json) | 1064 |
| [dbo.SHIPCONTfn_RtrvCurrentLocation](1585753052.md) | Scalar function | [SQL](1585753052.sql) | [JSON](1585753052.json) | 1636 |
| [dbo.SHIPCONTfn_RtrvItemContentsCount](183320063.md) | Scalar function | [SQL](183320063.sql) | [JSON](183320063.json) | 547 |
| [dbo.STSfn_RtrvAdjacentSts](2097754876.md) | Scalar function | [SQL](2097754876.sql) | [JSON](2097754876.json) | 2322 |
| [dbo.STSfn_RtrvSts](199320120.md) | Scalar function | [SQL](199320120.sql) | [JSON](199320120.json) | 883 |
| [dbo.STSfn_RtrvStsForAction](2113754933.md) | Scalar function | [SQL](2113754933.sql) | [JSON](2113754933.json) | 1297 |
| [dbo.STSfn_RtrvStsName](2129754990.md) | Scalar function | [SQL](2129754990.sql) | [JSON](2129754990.json) | 641 |
| [dbo.TimeOnly](621245268.md) | Scalar function | [SQL](621245268.sql) | [JSON](621245268.json) | 249 |
| [dbo.TpmOrderContainerStatus_TrackingLink](94271741.md) | Scalar function | [SQL](94271741.sql) | [JSON](94271741.json) | 401 |
| [dbo.WRTRV_RtrvUniqueWorkUnit](1386800348.md) | Scalar function | [SQL](1386800348.sql) | [JSON](1386800348.json) | 2036 |

## Interpretation limits

- A captured source reference establishes a static relationship, not that a module ran, a branch was reached, or a table is currently active\.
- NO\_CAPTURED\_REFERENCE means none of the credited channels in this exact retained corpus identified the table\. It does not establish that the table is unused, obsolete, a backup, safe to delete, or absent from external application SQL\.
- Dynamic SQL, runtime\-selected identifiers, external callers, client\-generated SQL, uncaptured jobs and historical/other database code can use tables without a resolvable reference here\.
- The bounded lexer recognizes named SQL relation/DML positions and local aliases/CTEs; it is not the SQL Server binder\. Unqualified names assume a unique captured name, not verified caller/default\-schema resolution\. Unsupported or ambiguous syntax remains explicit\.
- DDL, DBCC, permission statements and metadata\-function arguments are not comprehensively classified by the parser\. Their table relationships depend on captured catalog dependencies or reviewed effects; unmatched identifiers/string arguments remain non\-credit observations\.
- Identifier tokens and string\-contained names are separate non\-credit observations\. Column names and configuration text can match table names; neither proves an executed table access\.
- Foreign keys are structural relationships and never count as procedure/function usage\. View paths are catalog/source paths; attached trigger paths are possibilities, not proof the event fired\.
- Owner backup/leftover and item\-master\-failure suggestions are hypotheses\. Name patterns and missing references do not validate them\. No deletion recommendation is made\.
- Current replica status is owner\-attested\. This task documents the captured source as\-is and requires no application version/build or extension development\.
