# Performance, billing configuration and maintenance semantics

This bounded source review adds **65 full procedure contracts**, **71 object roles**, **18 plain-language help topics** and **36 authored evaluation cases** from snapshot `20260929T214106Z`. No SQL was executed. Billing coverage here concerns weight-break configuration inserts; invoice and charge correctness remain separate.

The machine-readable contracts are in [performance-billing-maintenance.json](mappings/batches/performance-billing-maintenance.json). Exact reading-copy paths, full-body line ranges and original-definition hashes accompany every module.

Key distinctions are preserved: the three area-specific dashboard getters read cached values; the general getter refreshes and updates expiration metadata across warehouses. Cache completeness is based on distinct identifiers, with no warehouse/identifier unique key. Missing expiration configuration can produce an explicit NULL insert that does not receive default5. PIVOT MAX uses stored text ordering, not a latest-row numeric comparison.

The dashboard updater accepts application-lock return0 only. Return1 means granted after waiting, but skips its refresh/release branch. Its default transaction-owned lock requires a caller transaction, which this procedure does not start. This is static control-flow evidence, not a reproduced incident. [SQL Server application-lock contract](https://learn.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-getapplock-transact-sql?view=sql-server-ver17).

The physical-statistics helper does not guard an unresolved database ID and resolves names in current database context. NULL is a wildcard for the underlying DMF; actual availability and permission behavior remain deployment-dependent. [SQL Server physical-statistics contract](https://learn.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-functions/sys-dm-db-index-physical-stats-transact-sql).

Maintenance helpers can perform DDL and recurse into related table names. DropColumn recursion remains inside its base-column existence guard, but its second tested prefix differs from the prefix actually passed recursively; DropIndex recursion is outside its base-index guard. Drop/create index replacement has no local transaction. These definitions were reviewed without invoking them.

Reporting counts retain their exact denominators: audit headers, joined values, grouped text, distinct users, and inventory/work groups are not interchangeable. PMN activity buckets start with the30 seconds before the supplied start; active-wave samples count overlaps repeatedly. Source concerns do not establish a bad operational row, safe remediation, end-to-end duration or effective authorization.

## Reviewed questions

### Cached dashboard reads and refreshes

The receiving, shipping and work getters read stored cache values. The general KPI getter calls an area refresher first and also updates expiration metadata across warehouses. Reading a saved value does not prove that it is current.

Boundaries: No current values or refresh schedule were observed. PIVOT MAX over text is not a latest-row or numeric-maximum selection.

### Dashboard cache completeness and expiration

The area refresher tests whether every required identifier exists. An incomplete set is deleted and rebuilt through separate inserts. A complete set is refreshed in groups when any member is stale. The body does not make the whole rebuild atomic.

Boundaries: Explicit NULL expiration from missing configuration does not use the column default5. No caller transaction, live configuration or successful rebuild was observed.

### Dashboard snapshot history

The points are the latest stored planned/actual snapshots selected within time windows. A capture routine inserts snapshot pairs and removes rows older than14 hours. The current point can come from an older retained row, and a missing window becomes zero.

Boundaries: Snapshot values are not interval event counts or measured process duration. Receipt appointment joins can multiply header counts; no DISTINCT. Receiving oldest window is[-13,-12] hours; shipping is[-14,-12].

### Dashboard update locking

It requests an Exclusive application lock and refreshes only when the return code is0. A granted-after-wait code1 skips that branch. The body starts no transaction and relies on the caller for the default transaction-owned lock.

Boundaries: This is a static control-flow concern, not a reproduced locking incident. Caller transaction and operational lock lifecycle remain unknown.

### Performance monitor warehouse filtering

Most selected counters use the supplied username to filter profile and warehouse-access tables. Their membership query is a cross join, so even the All branch depends on at least one access-table row existing. It is a report filter and does not authenticate the supplied name.

Boundaries: The supplied username is not evidence of authenticated identity. No current permission/profile rows were read.

### Performance monitor daily boundaries

These monitor bodies use UTC midnight through the following UTC midnight with inclusive BETWEEN. They do not convert to the warehouse timezone. The receipt counter uses the container timestamp; the shipped-line sum uses the shipment view's actual ship time.

Boundaries: These are not warehouse-local-day totals. Inclusive next midnight can overlap adjacent daily reports.

### Open processed alert summary

It groups processed-Y alert requests that still have no closed timestamp and whose alert action matches one of two coded categories. It joins alert/type records, groups by description and priority, and reports count and latest activity time.

Boundaries: No username or warehouse-access check is in this body. Different types with the same description/priority can merge; duplicate joins can multiply counts.

### Activity summary result sets

It returns six result sets using different events and counting keys. Wave totals require a launch fully inside the interval; received lines use a concatenated key; work groups use end times; shipping and creation totals use their own timestamp fields.

Boundaries: No single end-to-end process duration or universal warehouse filter is supplied. Concatenated receipt-line keys can collide; view duplicate rows can affect sums.

### Thirty-second activity series

The first sample always equals the supplied start, but its activity bucket covers the preceding30 seconds. Later samples are generated only while they remain before end. A final partial bucket to end is not added.

Boundaries: NULL, reversed or equal bounds still leave the anchor row. Large ranges are not bounded by a recursion cap; no execution or measured cost is established.

### Active wave samples

They are totals from launches whose start and end bracket each sample timestamp. The same wave can contribute repeatedly. A launch with a NULL end time does not satisfy this overlap predicate.

Boundaries: This is not newly started waves per bucket or elapsed wave duration. NULL launch end is excluded.

### Inventory diagnostic predicates

It identifies rows that satisfy that query's comparison. The queries use different keys, warehouse sides and exclusions. Some compare aggregates, some omit logistics units, and several use NOLOCK. A finding needs context before it becomes a confirmed defect.

Boundaries: No bad operational row, root cause or remediation was verified. NOLOCK findings can reflect inconsistent reads. Unit-of-measure comparison joins item without company.

### Inventory status exception scope

NULL status qualifies only under the written permanent/location-class/quantity conditions. The separate missing-identifier check uses NOT IN the configured status identifiers. An empty value is selected only if it is absent from that configuration set.

Boundaries: The name does not imply every NULL/empty row is selected. NULL in the configured NOT IN set can suppress unmatched-value findings.

### Audit and deadlock diagnostic counts

The seven-day count counts headers. Its detail report joins values, excludes a coded method and groups class/method/text. The deadlock reports separately count joined rows or distinct value texts. These denominators are intentionally documented separately.

Boundaries: Distinct text is not proven unique deadlock incident identity. Detail groups need not equal header or joined-row counts.

### Sampled concurrent-user peak

The routine checks distinct users once per hour, starting at the earliest retained logon timestamp. Short sessions between samples can be missed. It reports a maximum over those samples and retained records.

Boundaries: This is neither continuous peak detection nor proof covering all historical activity. NULL session ends can exclude sessions; empty history returns initialized0/current time.

### Weight-break configuration inserts

They only insert missing configuration rows. The header helper skips an existing name. The detail helper inserts an exact minimum/maximum range under an existing header and skips an identical range. Neither helper calculates charges or updates existing configuration.

Boundaries: No overlap, minimum<=maximum, active eligibility or invoice calculation validation. No captured unique name/range key or local concurrency guard; duplicate header names can make the detail scalar lookup fail.

### Maintenance helper side effects

These helpers can rename objects, drop columns or constraints, and drop/recreate indexes. Several build executable DDL from caller-supplied identifiers or syntax. The review read their definitions and did not execute them.

Boundaries: Runtime targets, permissions, DDL triggers and caller transactions remain unresolved. No operational DDL or repair was run.

### Index diagnostic context

One routine reads physical statistics for a supplied database ID; the other joins usage counters to current-database metadata. Name resolution and database filtering have important limits. Neither routine rebuilds an index or establishes a maintenance decision.

Boundaries: No measured fragmentation, duration or safe-drop recommendation. Counters are not procedure-call totals and catalog row counts are not COUNT(*) of data.

### Database and table size result sets

It first delegates to sp_spaceused for database output, then collects a table-specific sp_spaceused command through sp_msForEachTable into a local table and returns it by name. It does not establish that every table was enumerated successfully.

Boundaries: System-helper support, permissions and enumeration completeness are deployment-dependent. INSERT EXEC shape or nesting restrictions can fail; no failure handler exists.

## Exact module inventory

| Object ID | Procedure | Complete reading lines | Original definition SHA-256 |
|---|---|---|---|
| 152699942 | [dbo.dbc_IRateWeightBreakDtl](sql/152699942.sql) | 1-66 | `71a634c562d704441b5fe63408325d456228c171e0f748e8aee6dac38077a8b9` |
| 168699999 | [dbo.dbc_IRateWeightBreakHdr](sql/168699999.sql) | 1-63 | `4766988fe55d970bff20e7d8729be924812f61048b1eda2ec10596d8d0cbef96` |
| 1159675179 | [dbo.RPT_CSO_UniqueDeadlockRecordsLast14Days](sql/1159675179.sql) | 1-10 | `64b3febc3e533554399b8b8c1d926f7b11c4c7933025a0f2ab92528b932da0f8` |
| 1175675236 | [dbo.RPT_CSO_TotalDeadlockRecordsLast14Days](sql/1175675236.sql) | 1-10 | `e4aae3ddb431c61e504429733c09bada74c226bdfad10842aab93ff2e1d08149` |
| 1191675293 | [dbo.RPT_CSO_TopFiveTablesByRecordCount](sql/1191675293.sql) | 1-12 | `9da6ea127d8788d112c324fc1709db7b9ddceacc5baa2fd4ff5e8427893eac6f` |
| 1271675578 | [dbo.RPT_CSO_NoInventoryRecordButWorkExistsForToLocationDetails](sql/1271675578.sql) | 1-17 | `1062fee630b557bf670b079c84a65fa0228399e050f80b6b944686b488b68e65` |
| 1287675635 | [dbo.RPT_CSO_NoInventoryRecordButWorkExistsForToLocationCount](sql/1287675635.sql) | 1-17 | `e60bce50ae42002a1d1517e17c0d663dbedb7d3a27c964778738669671861973` |
| 1303675692 | [dbo.RPT_CSO_NoInventoryRecordButWorkExistsForFromLocationDetails](sql/1303675692.sql) | 1-15 | `a2227e6b433d4351046731a722da9d025f7b3db6877ec8577f2da044b77dedb7` |
| 1319675749 | [dbo.RPT_CSO_NoInventoryRecordButWorkExistsForFromLocationCount](sql/1319675749.sql) | 1-15 | `70ee501988e238617a9388f9a7e45a003065a340c816500a62a6f3aa4c2ec1c1` |
| 1335675806 | [dbo.RPT_CSO_NegativeLicensePlateValuesDetails](sql/1335675806.sql) | 1-6 | `0ebb4e13af15e740ba982e2819485931e548b6086be4a023498ec0ff8562bbc0` |
| 1351675863 | [dbo.RPT_CSO_NegativeLicensePlateValuesCount](sql/1351675863.sql) | 1-9 | `6c22fdc1444aaef0ba7c8753ac6e75351ecb1e962628100fe5444f0b8b058a67` |
| 1367675920 | [dbo.RPT_CSO_LocationsWithNonbaseUMDetails](sql/1367675920.sql) | 1-8 | `218ca49a4badd54ca5268b8cda6561efdc3cc3ede6cbe3ed368058c516fcaa30` |
| 1383675977 | [dbo.RPT_CSO_LocationsWithNonbaseUMCount](sql/1383675977.sql) | 1-8 | `10b1fa7bae44285e5bd4dc8650e3701aa58bf4b7dd4942f7dfd54c99508bd64c` |
| 1399676034 | [dbo.RPT_CSO_LocationsWithNegativeInventoryValueDetails](sql/1399676034.sql) | 1-12 | `3a8e22a12f92727f95627815b3619e70f9ad9741e542aa7398331b856e66613b` |
| 1415676091 | [dbo.RPT_CSO_LocationsWithNegativeInventoryValueCount](sql/1415676091.sql) | 1-11 | `9df7c417cbe803e9ab0e730021f2f2b9984f4adcbc78d66e65ce2f3f9db64872` |
| 1431676148 | [dbo.RPT_CSO_LocationsWithInTransitQtyEqualZeroButWorkExistsDetails](sql/1431676148.sql) | 1-19 | `93c8e160343c372be3bb03fe41f18622ba628f65784c7008d601f7dab658f1b4` |
| 1436180512 | [dbo.DASH_CaptureDashboardData](sql/1436180512.sql) | 1-97 | `3fbd5de9cd2ae17b1c3563b8ba98d28ec7ee1bf170cd7a9ddbf0cd4625debf8d` |
| 1447676205 | [dbo.RPT_CSO_LocationsWithInTransitQtyEqualZeroButWorkExistsCount](sql/1447676205.sql) | 1-20 | `da612fed74d16bde0a7b747109bdcf859eff92bdd96fa178a386beb5cb50be11` |
| 1452180569 | [dbo.DASH_GetKPIData](sql/1452180569.sql) | 1-243 | `965bf404d737c9b4a1aa1804a048548ad2d223e39dfa20abb999d7027ef1754b` |
| 1463676262 | [dbo.RPT_CSO_LocationsWithInTransitQtyButNoWorkExistsDetails](sql/1463676262.sql) | 1-17 | `386011c55e03ad577efc80d88d3171effbf07bde806d0f8a7c1170ca07fd8baa` |
| 1477228663 | [dbo.PM_ReceiptContainer01](sql/1477228663.sql) | 1-57 | `d544662235615fbf2c77dc035ad60d6e42aa728010aa46513514beebf2da65ed` |
| 1479676319 | [dbo.RPT_CSO_LocationsWithInTransitQtyButNoWorkExistsCount](sql/1479676319.sql) | 1-17 | `32a8af6d7b63e7fbc34c253feab6b1bddf97912bd13278509849e8a70a2b6292` |
| 1484180683 | [dbo.DASH_GetReceivingKPIData](sql/1484180683.sql) | 1-88 | `cce27b1ea6d3e8276a62488c41310bdd0ac121bd33e941d12227a62cddb01d5b` |
| 1495676376 | [dbo.RPT_CSO_LocationsWithAllocatedQtyEqualZeroButWorkExistsDetails](sql/1495676376.sql) | 1-20 | `fd5bf4a2adcafd093a7c51b6bbb3b90d293f6bb7399a14c08c0803141da66e3b` |
| 1500180740 | [dbo.DASH_GetShippingKPIData](sql/1500180740.sql) | 1-103 | `a5aa5295d1a59bda015da72dc07327e3236ad39f348be50ecb6f2d48fdfa9d83` |
| 1511676433 | [dbo.RPT_CSO_LocationsWithAllocatedQtyEqualZeroButWorkExistsCount](sql/1511676433.sql) | 1-21 | `06112041eed33191904fe4522b5198d51652abd003a1543fabdd0b31dba2504a` |
| 1516180797 | [dbo.DASH_GetWorkKPIData](sql/1516180797.sql) | 1-43 | `e4ae4b3e8a048446ffe3b8c778f53e94d10fa96b9557128f44eae029357a9cd3` |
| 1525228834 | [dbo.PM_ShipmentHeader02](sql/1525228834.sql) | 1-50 | `4eaa018d766e5fa6c62fc833982f0318e29caf2439778291ab72f6c4d0985867` |
| 1527676490 | [dbo.RPT_CSO_LocationsWithAllocatedQtyButNoWorkExistsDetails](sql/1527676490.sql) | 1-18 | `4fcbe4d36b101dc8670c9a5ef0bc6cd981ee24ffd89cdd18c0758e061821dd53` |
| 1532180854 | [dbo.DASH_RefreshInboundData](sql/1532180854.sql) | 1-111 | `36d3632ebc6a2fca5334509e082e36f96b9f92d8314e8ad96daa9bca4b51eb7c` |
| 1541228891 | [dbo.PM_ShipmentHeader03](sql/1541228891.sql) | 1-59 | `07e8ffb260b7a2f3428f28a1b7ed721c5842442cc35ff34518819bec3cf5b48e` |
| 1543676547 | [dbo.RPT_CSO_LocationsWithAllocatedQtyButNoWorkExistsCount](sql/1543676547.sql) | 1-18 | `e31364e7c97af9bdd7f8b1f873640d8f74b6d0b588683889688187b5e48d8362` |
| 1557228948 | [dbo.PM_ShipmentHeader04](sql/1557228948.sql) | 1-52 | `9d8b2c10979b9e6bb896602c2f4a9d34fb002730bac912246a7ca7b6d467c112` |
| 1559676604 | [dbo.RPT_CSO_LocationsWhereInTransitQtyNotEqualWorkQtyDetails](sql/1559676604.sql) | 1-26 | `cff0fc9af13d96cc5f941dfc87a2fce6bc48708669bff72526b9492b2e9fe987` |
| 1564180968 | [dbo.DASH_RefreshOutboundData](sql/1564180968.sql) | 1-109 | `8a771c5ab2b07268d2af4418cf49865773de9f976133456e05fe8b3192abbbcf` |
| 1573229005 | [dbo.PM_WarehouseAlert](sql/1573229005.sql) | 1-44 | `cd6ec46a6e3466a2141d86390e4ad6103efb0e5adb1e4eb085cd313e1b2347b3` |
| 1575676661 | [dbo.RPT_CSO_LocationsWhereInTransitQtyNotEqualWorkQtyCount](sql/1575676661.sql) | 1-28 | `76c355aab6a378a0f5eac2ab902c2f2631811097cf2ae58bc73ea575f5da92cf` |
| 1580181025 | [dbo.DASH_RefreshWorkData](sql/1580181025.sql) | 1-142 | `6fd060dedf623795e82a35d27ad03da554f0e9c6c0a2420e10e723f348724c4b` |
| 1584724698 | [dbo.dba_DropForeignKeyConstraint](sql/1584724698.sql) | 1-28 | `1930a6ae3f683734f3021eecbac3b4a2a41b49180b0f935a354e74307a4415c6` |
| 1591676718 | [dbo.RPT_CSO_LocationsWhereAllocatedQtyNotEqualWorkQtyDetails](sql/1591676718.sql) | 1-21 | `a5b78f6d6588173c7adc7953cf8b82719eaf2c852c342d5894b7b060e5652d1d` |
| 1596181082 | [dbo.DASH_UpdateKPIData](sql/1596181082.sql) | 1-87 | `4d2fad95cccde0c5510066f86ee392e025c79ff0fdebd4e4378b79d24b16d3d3` |
| 1600724755 | [dbo.dba_DropDefaultKeyConstraint](sql/1600724755.sql) | 1-28 | `b5a8d7178c2a2ca344830a97a296e919bd0f7c33fa7473938de0f36ca3b4db71` |
| 1605229119 | [dbo.PM_WorkInstruction02](sql/1605229119.sql) | 1-54 | `bb6c6f49ca043e2a88f6871dfd8c07503735bddcb5a4de573a01802349b2322d` |
| 1607676775 | [dbo.RPT_CSO_LocationsWhereAllocatedQtyNotEqualWorkQtyCount](sql/1607676775.sql) | 1-22 | `95ceba27a91691dc6178a39cc1ffd28681bf23ad8480d074b4e52bc50523bd12` |
| 1616724812 | [dbo.dba_DropColumn](sql/1616724812.sql) | 1-60 | `ae5163703c756a410f37e3ddb7a09672d4c2fecb8e9a76a133d61b997a617c77` |
| 1621229176 | [dbo.PMN_ActivitySummary](sql/1621229176.sql) | 1-59 | `f4852429a4b20cc005f97a8e6ef679613e8599777eb82c3053fac26f35365470` |
| 1623676832 | [dbo.RPT_CSO_ItemsWhereAllocatedQtyNotEqualInTransitQtyDetails](sql/1623676832.sql) | 1-14 | `02b7d37d12f74b97f799d91dbc94608f991cb202f55f3789a54bce2b715e8133` |
| 1632724869 | [dbo.dba_AddForeignKeyConstraint](sql/1632724869.sql) | 1-31 | `160faed899264cab635b19544bf60bf834ac700a2b6e7ce6d50103f664c69fb1` |
| 1639676889 | [dbo.RPT_CSO_ItemsWhereAllocatedQtyNotEqualInTransitQtyCount](sql/1639676889.sql) | 1-15 | `08d001fab3e9b747d17ffa1b9126c37281dc06b05ac8ad897723af1096700ad6` |
| 1655676946 | [dbo.RPT_CSO_InventoryRecordsWithEmptyOrNullInventoryStatusDetails](sql/1655676946.sql) | 1-13 | `2e018357062554f4200ade6df9418c0989eb0abc0eb8a850ecb05ddef7d9da6d` |
| 1660181310 | [dbo.dba_RenameTable](sql/1660181310.sql) | 1-23 | `e74a4b4337c9960248c9e4649b56e5b22725712b204e3525fe631ca0eb6e8a42` |
| 1669229347 | [dbo.PMN_IndexFragmentation](sql/1669229347.sql) | 1-23 | `d070200a576d9f841401a025faa5e619992d400fe4eae585ec404ef12e433181` |
| 1671677003 | [dbo.RPT_CSO_InventoryRecordsWithEmptyOrNullInventoryStatusCount](sql/1671677003.sql) | 1-12 | `3a74655dba3b2ddd7222692d575633455eac724eb38fca338e61587607e444b2` |
| 1685229404 | [dbo.PMN_IndexUsage](sql/1685229404.sql) | 1-22 | `9d8ce763d76597bc6d5685dec972422854f0797fa0db6d89c3a72d61536b89c0` |
| 1687677060 | [dbo.RPT_CSO_HighestNbrConcurrentUsrsEver](sql/1687677060.sql) | 1-40 | `ab938ec1c83b0d89d882e7ee2b435743c2e568904a1c3a7e0378df4aa503c544` |
| 1701229461 | [dbo.PMN_LoadConfirmActivity](sql/1701229461.sql) | 1-39 | `070d5cfb8bfd820d40591669e2a33a604e071e0b5289a92c817706f5864ebbdf` |
| 1703677117 | [dbo.RPT_CSO_DeadlockRecordDetailsLast14Days](sql/1703677117.sql) | 1-9 | `79d8106385d1c9c0154223324dcc9c1b505c8b72eb12148168149f99615463bf` |
| 1717229518 | [dbo.PMN_ReceiptsCreatedActivity](sql/1717229518.sql) | 1-36 | `b419a06f9745afd894e4ac25162df9dd35b3cae06869069b305e5f0895f25f71` |
| 1719677174 | [dbo.RPT_CSO_AuditLogsLast7DaysDetails](sql/1719677174.sql) | 1-11 | `06bef7f449c29a15e1b3d6d7921c45d72dcade716c92b05432766e767dc2e7d2` |
| 1733229575 | [dbo.PMN_ShipmentsCreatedActivity](sql/1733229575.sql) | 1-37 | `c598c6f19358359009d9114d7fcada65d114933c645e44373543ab01a7254d51` |
| 1735677231 | [dbo.RPT_CSO_AuditLogsLast7DaysCount](sql/1735677231.sql) | 1-8 | `e20b74be30c9321bfc34b757ab988d4d487aac4246373abffa165c82235f6888` |
| 1749229632 | [dbo.PMN_TableSizes](sql/1749229632.sql) | 1-27 | `fe7f2c8786f650bed9f59e9f92e4123168993c0c0228d764b5be90cdf4b66582` |
| 1797229803 | [dbo.PMN_WaveActivity](sql/1797229803.sql) | 1-36 | `a9e074e69c0c57aeeaf09dd1eef3707c8eccb33229dbe229748a5b03984615e3` |
| 1866802058 | [dbo.dba_DropIndex](sql/1866802058.sql) | 1-20 | `48bfe4d4c57b57339823c12d1a7e8ba18f309f09d4c6c081c4842b1241fdbec5` |
| 1882802115 | [dbo.dba_UpdateIndex](sql/1882802115.sql) | 1-37 | `11d7917f4b43883359045cf89a1c6e921bdcded6067699b42c4cabd43bc67eb6` |

## Verification boundary

The author verifier checks reserved IDs, full reading/original hashes, object/evidence bindings, contract dimensions, metadata/default/FK associations, authored-case counts and reused governance hashes. Cases are authored, not executed by this worker. Independent peer review and shared-ledger integration belong to the coordinator. No complete process family, current configuration, live SQL behavior, application acceptance or deployment is claimed.
