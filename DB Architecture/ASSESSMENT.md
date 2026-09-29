# Database assessment

Assessment boundary: visible database metadata, stored implementation text, static dependencies and existing aggregate runtime evidence. Snapshot `20260929T214106Z`; capture and supplement times are in [capture manifest](evidence/capture-manifest.json). Counts refer to this observed replica, not all SCALE installations.

## Platform and completeness

The database is `trav3plprodxagru`, Azure SQL Database (`EngineEdition=5`, reported product version `12.0.2000.8`), compatibility level 150, collation `Latin1_General_CI_AS`. Do not interpret Azure's product version as a boxed SQL Server release. The connected endpoint reported `READ_ONLY`; `sys.databases.is_read_only=false` is retained as a separate catalog property. Microsoft's [replica verification guidance](https://learn.microsoft.com/en-us/azure/azure-sql/database/read-scale-out?view=azuresql) uses the connected database's Updateability property.

Effective `VIEW DEFINITION`, `VIEW DATABASE STATE` and `VIEW DATABASE PERFORMANCE STATE` were all present. The login is a database owner on this connection; no permissions were changed. SQL source allowlisting and a verified read-only endpoint bounded this run. Application intent alone is not a permission boundary.

Object ID/type/name/modify-date inventories matched at the beginning and end of catalog collection. This is a drift check across sequential reads, not a transactionally frozen database snapshot. Current raw files passed SHA-256 verification before derivation. All 1,142 visible SQL modules have non-null source definitions. See [metadata visibility](https://learn.microsoft.com/en-us/sql/relational-databases/security/metadata-visibility-configuration?view=sql-server-ver17) for why permission evidence matters.

| Observed structure | Count |
| --- | ---: |
| User tables | 518 |
| Stored procedures | 921 |
| Scalar / inline table / multistatement table functions | 66 / 1 / 9 |
| Views / triggers | 135 / 6 |
| SQL modules, including four standalone defaults | 1,142 |
| Columns across visible column-bearing objects | 25,568 |
| Parameter/return catalog entries | 6,394 |
| Foreign keys | 407 |
| Primary key / unique constraints | 400 / 11 |
| Default constraints / standalone defaults / check constraints | 541 / 4 / 2 |
| Index entries, including heaps | 1,203 |
| Static dependency entries | 2,714 |
| Dependencies without resolved object ID | 169 |

All observed user objects are in `dbo`; 13 schemas are visible, including system/role schemas. The 400 PK constraints are not equivalent to 400 user tables with PKs: 120 of the 518 user tables have no primary-key index. There are 118 heap index entries. Table-type/internal catalog objects account for differences between object-class and user-table counts. These counts are architectural observations, not automatic defects; staging/interface tables may deliberately use different designs.

## Layout and database behavior

Three logical database files and two data spaces were observed. No partition functions or partition schemes were returned. All 1,194 observed partitions reported `NONE` compression; all 518 tables reported non-temporal storage. The collection contains file allocation/growth metadata but no physical file paths, row counts, histograms or data contents.

There are 352 identity-column entries, one table type, one sequence, no user CLR assemblies, no synonyms, no full-text indexes, no external tables and no user XML schema collections in the visible catalog. Sequence current values and identity last-used values were deliberately omitted. Database CDC and Service Broker are disabled in the captured database settings; no user Service Broker queues were returned. System services/contracts in the catalog do not establish active business messaging.

Six enabled triggers exist. These are important hidden steps in table writes; the [process guide](PROCESS_GUIDE.md) explains representative receiving and work-instruction triggers. No trigger was fired for this assessment.

One masked column was recorded (`SYSTEM_VALUE`, object 1643868923). No row-level security policy was returned. This is an inventory statement, not a security audit or proof of application authorization. Principal names, memberships, credentials and security-policy changes were outside collection.

## Review findings and implications

| Priority | Evidence | Implication / required treatment |
| --- | --- | --- |
| High | 22 untrusted FKs, including one disabled FK | The app must not assume every relationship is enforced for all records. Review the [FK catalog](catalog/foreign_keys.json) before asserting integrity; no repair is authorized by this assessment. |
| High | 60 modules contain monitored dynamic-execution patterns; 169 unresolved catalog dependencies | The static graph is incomplete by construction. Review dynamic strings privately and record external/caller-dependent references; do not turn absent edges into “never calls.” |
| High | Vendor queue identifiers are absent from the visible replica | `QUEUE_PROCESS_REQUEST`, `QUEUE_PROCESS`, `QUEUE_SERVICE`, and `Q_PROCESS` cannot be claimed as deployed tables here. `SCHEDULED_JOBS` and `BATCH_SUBMISSION_CONFIG` do exist, but equivalence is not established. |
| High | Application settings, metadata rows and exit-point registrations were not read | Schema and code cannot establish which features, screens, integrations or schedules are enabled. Preserve this as an explicit knowledge boundary. |
| Medium | Query Store history mainly belongs to primary role group 1 | Do not report those aggregates as local replica latency, procedure call counts or process duration. Historical coverage is irregular. |
| Medium | 131 modules contain NOLOCK/READUNCOMMITTED tokens | Some code requests weaker read consistency. This is lexical evidence, not proof of a specific anomaly or authorization to alter vendor code. |
| Medium | Nine modules contain transaction-control tokens; four contain TRY/CATCH tokens | Absence of these tokens does not establish missing transaction/error handling: callers and application services may own it. |
| Medium | Tenant-style `TRAV_` objects and vendor-example matches coexist | Prefixes suggest custom areas; origin and applicability need owner/vendor confirmation. Generic AIM/SDK behavior must not silently override deployed custom code. |

No indexes were disabled in the capture. No performance tuning or index-removal recommendation is made from structure alone. SQL Agent `msdb` access returned Azure error 40515; a traditional HADR DMV and `sys.geo_replication_links` returned error 208. These are unavailable surfaces, not empty inventories. The supported geo-replication DMV returned zero visible rows; that does not disprove read-scale replica operation. Supported Query Store replica metadata was collected separately.

## Confidence boundary

Structural catalog coverage is verified for visible objects. Automated routine cards are structural contracts, not individually approved business explanations. The selected [process dossiers](PROCESS_GUIDE.md) contain reviewed static behavior; the [plan](PLAN.md) retains the remaining per-routine semantic work. Vendor process-summary links cover the existing corpus without claiming that every described workflow is deployed. End-to-end timing, active configuration and user/SME acceptance remain unverified.
