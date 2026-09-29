"""Read fixed SQL Server metadata queries; never read application rows or run routines."""
from __future__ import annotations
import argparse
import datetime as dt
import hashlib
import json
import os
from pathlib import Path
import re
import sys
import time

ROOT = Path(__file__).resolve().parents[1]
PRIVATE = Path(os.environ.get("LOCALAPPDATA", str(Path.home()))) / "TAB/SCALE-Intelligence/private/db-assessment"

def parse_connection(text):
    """Parse ADO.NET quoted connection values without emitting their contents."""
    result = {}
    pattern = re.compile(r'''\s*([^=;]+)\s*=\s*(?:"((?:[^"]|"")*)"|'((?:[^']|'')*)'|([^;]*))\s*(?:;|$)''')
    pos = 0
    while pos < len(text):
        if not text[pos:].strip():
            break
        match = pattern.match(text, pos)
        if not match:
            raise ValueError("Invalid connection input; content withheld")
        key = match[1].strip().lower()
        if key in result:
            raise ValueError("Duplicate connection setting")
        result[key] = (match[2].replace('""', '"') if match[2] is not None else
                       match[3].replace("''", "'") if match[3] is not None else match[4].strip())
        pos = match.end()
    return result

def odbc_string(settings):
    def q(value):
        return "{" + str(value).replace("}", "}}") + "}"
    if settings.get("authentication", "SqlPassword").lower() != "sqlpassword":
        raise ValueError("Authentication type requires explicit implementation")
    values = {"DRIVER": "ODBC Driver 18 for SQL Server", "SERVER": settings["data source"],
              "DATABASE": settings["initial catalog"], "UID": settings["user id"],
              "PWD": settings["password"], "Encrypt": "yes", "TrustServerCertificate": "no",
              "ApplicationIntent": "ReadOnly", "APP": "SCALE Intelligence metadata assessment"}
    return ";".join(k + "=" + q(v) for k, v in values.items())

QUERIES = {
"database": """SELECT DB_NAME() AS database_name, CAST(SERVERPROPERTY('ProductVersion') AS nvarchar(128)) AS product_version,
 CAST(SERVERPROPERTY('Edition') AS nvarchar(128)) AS edition, CAST(SERVERPROPERTY('EngineEdition') AS int) AS engine_edition,
 d.compatibility_level,d.collation_name,d.state_desc,d.user_access_desc,d.is_read_only,d.recovery_model_desc,
 d.snapshot_isolation_state_desc,d.is_read_committed_snapshot_on,d.is_broker_enabled,d.is_cdc_enabled,
 d.is_published,d.is_subscribed,d.is_merge_published,d.is_distributor,d.is_auto_close_on,d.is_auto_shrink_on,
 CAST(DATABASEPROPERTYEX(DB_NAME(),'Updateability') AS nvarchar(128)) AS updateability, SYSUTCDATETIME() AS observed_at
 FROM sys.databases d WHERE d.name=DB_NAME()""",
"identity": """SELECT DB_NAME() AS database_name, DB_ID() AS context_database_id,
 CAST(SERVERPROPERTY('ProductVersion') AS nvarchar(128)) AS product_version,
 CAST(SERVERPROPERTY('Edition') AS nvarchar(128)) AS edition,CAST(SERVERPROPERTY('EngineEdition') AS int) AS engine_edition,
 CAST(DATABASEPROPERTYEX(DB_NAME(),'Updateability') AS nvarchar(128)) AS updateability,
 CAST(DATABASEPROPERTYEX(DB_NAME(),'Collation') AS nvarchar(128)) AS collation_name,
 CAST(DATABASEPROPERTYEX(DB_NAME(),'Status') AS nvarchar(128)) AS status""",
"permissions": """SELECT HAS_PERMS_BY_NAME(DB_NAME(),'DATABASE','VIEW DEFINITION') AS view_definition,
 HAS_PERMS_BY_NAME(DB_NAME(),'DATABASE','VIEW DATABASE STATE') AS view_database_state,
 HAS_PERMS_BY_NAME(DB_NAME(),'DATABASE','VIEW DATABASE PERFORMANCE STATE') AS view_database_performance_state,
 HAS_PERMS_BY_NAME(NULL,'SERVER','VIEW SERVER STATE') AS view_server_state,
 HAS_PERMS_BY_NAME(NULL,'SERVER','VIEW SERVER PERFORMANCE STATE') AS view_server_performance_state,
 IS_MEMBER('db_owner') AS is_db_owner""",
"schemas": "SELECT schema_id,name FROM sys.schemas ORDER BY schema_id",
"objects": """SELECT o.object_id,o.schema_id,SCHEMA_NAME(o.schema_id) AS schema_name,o.name,o.type,o.type_desc,
 o.parent_object_id,o.create_date,o.modify_date,CAST(OBJECTPROPERTYEX(o.object_id,'IsEncrypted') AS int) AS is_encrypted
 FROM sys.objects o WHERE o.is_ms_shipped=0 ORDER BY o.object_id""",
"tables": """SELECT object_id,lob_data_space_id,filestream_data_space_id,is_memory_optimized,durability_desc,
 temporal_type_desc,history_table_id,is_filetable,is_tracked_by_cdc,lock_escalation_desc
 FROM sys.tables WHERE is_ms_shipped=0 ORDER BY object_id""",
"columns": """SELECT c.object_id,c.column_id,c.name,SCHEMA_NAME(t.schema_id) AS type_schema,t.name AS type_name,
 c.max_length,c.precision,c.scale,c.collation_name,c.is_nullable,c.is_identity,c.is_computed,c.is_rowguidcol,
 c.is_sparse,c.is_column_set,c.default_object_id,c.rule_object_id,c.generated_always_type_desc,
 c.encryption_type_desc FROM sys.columns c JOIN sys.types t ON c.user_type_id=t.user_type_id
 JOIN sys.objects o ON o.object_id=c.object_id WHERE o.is_ms_shipped=0 ORDER BY c.object_id,c.column_id""",
"parameters": """SELECT p.object_id,p.parameter_id,p.name,SCHEMA_NAME(t.schema_id) AS type_schema,t.name AS type_name,
 p.max_length,p.precision,p.scale,p.is_output,p.is_readonly,p.has_default_value
 FROM sys.parameters p JOIN sys.types t ON p.user_type_id=t.user_type_id
 JOIN sys.objects o ON o.object_id=p.object_id WHERE o.is_ms_shipped=0 ORDER BY p.object_id,p.parameter_id""",
"modules": """SELECT m.object_id,m.definition,m.uses_ansi_nulls,m.uses_quoted_identifier,m.is_schema_bound,
 m.uses_database_collation,m.is_recompiled,m.null_on_null_input,m.execute_as_principal_id
 FROM sys.sql_modules m JOIN sys.objects o ON o.object_id=m.object_id WHERE o.is_ms_shipped=0 ORDER BY m.object_id""",
"indexes": """SELECT i.object_id,i.index_id,i.name,i.type_desc,i.is_unique,i.data_space_id,i.ignore_dup_key,
 i.is_primary_key,i.is_unique_constraint,i.fill_factor,i.is_disabled,i.is_hypothetical,
 i.allow_row_locks,i.allow_page_locks,i.has_filter,i.filter_definition
 FROM sys.indexes i JOIN sys.objects o ON o.object_id=i.object_id WHERE o.is_ms_shipped=0 ORDER BY i.object_id,i.index_id""",
"index_columns": """SELECT i.object_id,i.index_id,i.index_column_id,i.column_id,i.key_ordinal,i.partition_ordinal,
 i.is_descending_key,i.is_included_column FROM sys.index_columns i JOIN sys.objects o ON o.object_id=i.object_id
 WHERE o.is_ms_shipped=0 ORDER BY i.object_id,i.index_id,i.index_column_id""",
"foreign_keys": """SELECT object_id,name,parent_object_id,referenced_object_id,key_index_id,is_disabled,
 is_not_trusted,is_not_for_replication,delete_referential_action_desc,update_referential_action_desc
 FROM sys.foreign_keys WHERE is_ms_shipped=0 ORDER BY object_id""",
"foreign_key_columns": "SELECT constraint_object_id,constraint_column_id,parent_object_id,parent_column_id,referenced_object_id,referenced_column_id FROM sys.foreign_key_columns ORDER BY constraint_object_id,constraint_column_id",
"key_constraints": "SELECT object_id,name,parent_object_id,type_desc,unique_index_id FROM sys.key_constraints WHERE is_ms_shipped=0 ORDER BY object_id",
"check_constraints": "SELECT object_id,name,parent_object_id,parent_column_id,definition,is_disabled,is_not_trusted,is_not_for_replication FROM sys.check_constraints WHERE is_ms_shipped=0 ORDER BY object_id",
"default_constraints": "SELECT object_id,name,parent_object_id,parent_column_id,definition FROM sys.default_constraints WHERE is_ms_shipped=0 ORDER BY object_id",
"computed_columns": "SELECT object_id,column_id,definition,is_persisted FROM sys.computed_columns ORDER BY object_id,column_id",
"identity_columns": "SELECT object_id,column_id,CONVERT(nvarchar(100),seed_value) AS seed_value,CONVERT(nvarchar(100),increment_value) AS increment_value,is_not_for_replication FROM sys.identity_columns ORDER BY object_id,column_id",
"dependencies": """SELECT referencing_id,referencing_minor_id,referencing_class_desc,is_schema_bound_reference,
 referenced_class_desc,referenced_server_name,referenced_database_name,referenced_schema_name,referenced_entity_name,
 referenced_id,referenced_minor_id,is_caller_dependent,is_ambiguous FROM sys.sql_expression_dependencies
 ORDER BY referencing_id,referenced_id,referenced_minor_id""",
"triggers": "SELECT object_id,name,parent_class_desc,parent_id,type_desc,is_disabled,is_instead_of_trigger,is_not_for_replication FROM sys.triggers WHERE is_ms_shipped=0 ORDER BY object_id",
"trigger_events": "SELECT object_id,type,type_desc,is_first,is_last FROM sys.trigger_events ORDER BY object_id,type",
"synonyms": "SELECT object_id,schema_id,name,base_object_name FROM sys.synonyms ORDER BY object_id",
"types": "SELECT user_type_id,schema_id,name,system_type_id,max_length,precision,scale,is_nullable,is_user_defined,is_assembly_type,is_table_type,default_object_id,rule_object_id FROM sys.types ORDER BY user_type_id",
"table_types": "SELECT user_type_id,type_table_object_id,is_memory_optimized FROM sys.table_types ORDER BY user_type_id",
"sequences": "SELECT object_id,schema_id,name,CONVERT(nvarchar(100),start_value) AS start_value,CONVERT(nvarchar(100),increment) AS increment,CONVERT(nvarchar(100),minimum_value) AS minimum_value,CONVERT(nvarchar(100),maximum_value) AS maximum_value,is_cycling,is_cached,cache_size FROM sys.sequences ORDER BY object_id",
"partitions": """SELECT p.object_id,p.index_id,p.partition_number,p.data_compression_desc
 FROM sys.partitions p JOIN sys.objects o ON o.object_id=p.object_id WHERE o.is_ms_shipped=0
 ORDER BY p.object_id,p.index_id,p.partition_number""",
"data_spaces": "SELECT data_space_id,name,type_desc,is_default,is_system FROM sys.data_spaces ORDER BY data_space_id",
"partition_functions": "SELECT function_id,name,type_desc,fanout,boundary_value_on_right FROM sys.partition_functions ORDER BY function_id",
"partition_schemes": "SELECT data_space_id,name,function_id FROM sys.partition_schemes ORDER BY data_space_id",
"files": "SELECT file_id,type_desc,name,data_space_id,size,max_size,growth,is_percent_growth,state_desc FROM sys.database_files ORDER BY file_id",
"statistics": """SELECT s.object_id,s.stats_id,s.name,s.auto_created,s.user_created,s.no_recompute,s.has_filter,
 s.filter_definition,s.is_temporary,s.is_incremental FROM sys.stats s JOIN sys.objects o ON o.object_id=s.object_id
 WHERE o.is_ms_shipped=0 ORDER BY s.object_id,s.stats_id""",
"stat_columns": "SELECT s.object_id,s.stats_id,s.stats_column_id,s.column_id FROM sys.stats_columns s JOIN sys.objects o ON o.object_id=s.object_id WHERE o.is_ms_shipped=0 ORDER BY s.object_id,s.stats_id,s.stats_column_id",
"assemblies": "SELECT assembly_id,name,permission_set_desc,is_user_defined FROM sys.assemblies WHERE is_user_defined=1 ORDER BY assembly_id",
"assembly_modules": "SELECT object_id,assembly_id,assembly_class,assembly_method,null_on_null_input,execute_as_principal_id FROM sys.assembly_modules ORDER BY object_id",
"service_queues": "SELECT object_id,schema_id,name,is_activation_enabled,activation_procedure,max_readers,is_receive_enabled,is_enqueue_enabled,is_retention_enabled FROM sys.service_queues WHERE is_ms_shipped=0 ORDER BY object_id",
"services": "SELECT service_id,name,service_queue_id FROM sys.services ORDER BY service_id",
"service_contracts": "SELECT service_contract_id,name FROM sys.service_contracts ORDER BY service_contract_id",
"security_policy_counts": "SELECT type_desc,COUNT_BIG(*) AS object_count FROM sys.objects WHERE type IN ('SP','SQ') AND is_ms_shipped=0 GROUP BY type_desc",
"query_store_options": "SELECT actual_state_desc,desired_state_desc,readonly_reason,current_storage_size_mb,max_storage_size_mb,interval_length_minutes,query_capture_mode_desc FROM sys.database_query_store_options",
"procedure_runtime": """SELECT object_id,cached_time,last_execution_time,execution_count,total_worker_time,
 total_elapsed_time,last_elapsed_time,min_elapsed_time,max_elapsed_time,total_logical_reads,total_logical_writes,
 total_physical_reads FROM sys.dm_exec_procedure_stats WHERE database_id=DB_ID() ORDER BY object_id,cached_time""",
"function_runtime": """SELECT object_id,cached_time,last_execution_time,execution_count,total_worker_time,
 total_elapsed_time,last_elapsed_time,min_elapsed_time,max_elapsed_time,total_logical_reads,total_logical_writes,
 total_physical_reads FROM sys.dm_exec_function_stats WHERE database_id=DB_ID() ORDER BY object_id,cached_time""",
"trigger_runtime": """SELECT object_id,cached_time,last_execution_time,execution_count,total_worker_time,
 total_elapsed_time,last_elapsed_time,min_elapsed_time,max_elapsed_time,total_logical_reads,total_logical_writes,
 total_physical_reads FROM sys.dm_exec_trigger_stats WHERE database_id=DB_ID() ORDER BY object_id,cached_time""",
"query_store_runtime": """SELECT q.object_id,r.replica_group_id,r.runtime_stats_interval_id,r.execution_type_desc,
 CONVERT(nvarchar(50),MIN(i.start_time),127) AS interval_start,CONVERT(nvarchar(50),MAX(i.end_time),127) AS interval_end,SUM(r.count_executions) AS statement_executions,
 SUM(CONVERT(float,r.count_executions)*r.avg_duration) AS weighted_total_duration_us,
 MIN(r.min_duration) AS min_statement_duration_us,MAX(r.max_duration) AS max_statement_duration_us,
 SUM(CONVERT(float,r.count_executions)*r.avg_cpu_time) AS weighted_total_cpu_us
 FROM sys.query_store_query q JOIN sys.query_store_plan p ON p.query_id=q.query_id
 JOIN sys.query_store_runtime_stats r ON r.plan_id=p.plan_id
 JOIN sys.query_store_runtime_stats_interval i ON i.runtime_stats_interval_id=r.runtime_stats_interval_id
 WHERE q.object_id<>0 GROUP BY q.object_id,r.replica_group_id,r.runtime_stats_interval_id,r.execution_type_desc
 ORDER BY q.object_id,r.replica_group_id,r.runtime_stats_interval_id,r.execution_type_desc""",
"job_step_metadata": """SELECT j.job_id,j.name,j.enabled,s.step_id,s.step_name,s.subsystem,s.database_name,
 s.on_success_action,s.on_success_step_id,s.on_fail_action,s.on_fail_step_id,s.retry_attempts,s.retry_interval
 FROM msdb.dbo.sysjobs j JOIN msdb.dbo.sysjobsteps s ON s.job_id=j.job_id
 WHERE s.database_name=DB_NAME() ORDER BY j.job_id,s.step_id""",
"availability": "SELECT database_id,is_primary_replica,synchronization_state_desc,synchronization_health_desc,database_state_desc,is_suspended FROM sys.dm_hadr_database_replica_states WHERE database_id=DB_ID() AND is_local=1",
"replication_status": """SELECT link_guid,partner_server,partner_database,replication_state_desc,role_desc,secondary_allow_connections_desc FROM sys.geo_replication_links""",
"database_scoped_configurations": "SELECT name,CONVERT(nvarchar(100),value) AS value,CONVERT(nvarchar(100),value_for_secondary) AS value_for_secondary,is_value_default FROM sys.database_scoped_configurations ORDER BY name",
"fulltext_indexes": "SELECT object_id,unique_index_id,fulltext_catalog_id,is_enabled,change_tracking_state_desc,has_crawl_completed FROM sys.fulltext_indexes ORDER BY object_id",
"fulltext_columns": "SELECT object_id,column_id,type_column_id,language_id,statistical_semantics FROM sys.fulltext_index_columns ORDER BY object_id,column_id",
"xml_schema_collections": "SELECT xml_collection_id,schema_id,name FROM sys.xml_schema_collections WHERE xml_collection_id>1 ORDER BY xml_collection_id",
"external_tables": "SELECT object_id,data_source_id,file_format_id FROM sys.external_tables ORDER BY object_id",
"security_policies": "SELECT object_id,schema_id,name,is_enabled,is_schema_bound FROM sys.security_policies ORDER BY object_id",
"security_predicates": "SELECT object_id,security_predicate_id,target_object_id,predicate_definition,predicate_type_desc,operation_desc FROM sys.security_predicates ORDER BY object_id,security_predicate_id",
"masked_columns": "SELECT object_id,column_id,name,is_masked,masking_function FROM sys.masked_columns WHERE is_masked=1 ORDER BY object_id,column_id",
"extended_property_inventory": "SELECT class_desc,major_id,minor_id,name FROM sys.extended_properties ORDER BY class,major_id,minor_id,name",
"object_counts": "SELECT type,type_desc,COUNT_BIG(*) AS object_count FROM sys.objects WHERE is_ms_shipped=0 GROUP BY type,type_desc ORDER BY type",
"schema_permissions": "SELECT class_desc,major_id,minor_id,type,permission_name,state_desc,COUNT_BIG(*) AS grant_count FROM sys.database_permissions GROUP BY class_desc,major_id,minor_id,type,permission_name,state_desc ORDER BY class_desc,major_id,minor_id,type,state_desc",
"runtime_catalog_columns": """SELECT OBJECT_NAME(object_id) AS view_name,name AS column_name FROM sys.all_columns
 WHERE object_id IN (OBJECT_ID('sys.query_store_replicas'),OBJECT_ID('sys.query_store_runtime_stats'),
 OBJECT_ID('sys.query_store_plan'),OBJECT_ID('sys.dm_geo_replication_link_status')) ORDER BY object_id,column_id""",
"geo_replication": "SELECT replication_state_desc,role_desc,secondary_allow_connections_desc,last_replication,last_commit,replication_lag_sec FROM sys.dm_geo_replication_link_status",
"query_store_replicas": "SELECT replica_group_id,role_type FROM sys.query_store_replicas ORDER BY replica_group_id",
}
QUERIES['objects_at_end'] = QUERIES['objects']

def utc():
    return dt.datetime.now(dt.timezone.utc).isoformat()

def atomic_json(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    content = json.dumps(value, indent=2, ensure_ascii=False, default=str) + "\n"
    if path.exists() and path.read_text(encoding="utf-8") == content:
        return
    tmp = path.with_suffix(path.suffix + ".pending")
    tmp.write_text(content, encoding="utf-8")
    tmp.replace(path)

def collect(connection_path, destination, only=None):
    import pyodbc
    destination.mkdir(parents=True, exist_ok=True)
    settings = parse_connection(connection_path.read_text(encoding="utf-8-sig").strip())
    manifest = {"schema_version": 1, "started_at": utc(), "scope": "catalog_and_aggregate_runtime_only",
                "application_rows_read": False, "routines_executed": False, "connection_secret_persisted": False,
                "read_only_intent_is_not_access_control": True, "queries": {}, "pyodbc_version": pyodbc.version}
    if only and (destination / "manifest.json").exists():
        manifest = json.loads((destination / "manifest.json").read_text(encoding="utf-8"))
        manifest.setdefault("supplement_started_at", []).append(utc())
    try:
        connection = pyodbc.connect(odbc_string(settings), timeout=20, autocommit=True)
    except pyodbc.Error as error:
        manifest.update(status="CONNECTION_BLOCKED", sqlstate=str(error.args[0])[:8], finished_at=utc())
        atomic_json(destination / "manifest.json", manifest)
        print(json.dumps({"status": manifest["status"], "sqlstate": manifest["sqlstate"]}))
        return 2
    connection.timeout = 45
    try:
        # Session options only; no DDL, DML, procedure invocation, transaction or instrumentation changes.
        connection.execute("SET LOCK_TIMEOUT 5000; SET DEADLOCK_PRIORITY LOW;")
        for name, query in QUERIES.items():
            if only and name not in only:
                continue
            started = time.monotonic()
            entry = {"query_sha256": hashlib.sha256(query.encode()).hexdigest(), "started_at": utc()}
            cursor = connection.cursor()
            try:
                cursor.execute(query)
                columns = [x[0] for x in cursor.description]
                rows = [dict(zip(columns, row)) for row in cursor]
                atomic_json(destination / f"{name}.json", rows)
                entry.update(status="CAPTURED", rows=len(rows), file=f"{name}.json",
                             sha256=hashlib.sha256((destination / f"{name}.json").read_bytes()).hexdigest())
            except pyodbc.Error as error:
                entry.update(status="UNAVAILABLE", sqlstate=str(error.args[0])[:8])
                # Categorize without persisting messages that can contain endpoint/account details.
                msg = str(error)
                entry["reason"] = ("PERMISSION_DENIED" if any(x in msg.lower() for x in ["permission", "denied", "not able to access"])
                                   else "TIMEOUT" if "timeout" in msg.lower() else "UNSUPPORTED_OR_QUERY_ERROR")
                entry["native_error_numbers"] = re.findall(r"\((\d{2,6})\)", msg)
                entry["odbc_type_unsupported"] = "not yet supported" in msg.lower()
            finally:
                cursor.close()
            entry["elapsed_seconds"] = round(time.monotonic() - started, 3)
            entry["finished_at"] = utc()
            manifest["queries"][name] = entry
            atomic_json(destination / "manifest.json", manifest)
            print(json.dumps({"query": name, "status": entry["status"], "rows": entry.get("rows"), "reason": entry.get("reason")}), flush=True)
    finally:
        connection.close()
    manifest.update(status="CAPTURE_FINISHED", finished_at=utc())
    atomic_json(destination / "manifest.json", manifest)
    return 0

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--connection-file", type=Path, default=PRIVATE.parent / "credentials/replica.connection.txt")
    parser.add_argument("--private-output", type=Path, default=PRIVATE / dt.datetime.now(dt.timezone.utc).strftime("%Y%m%dT%H%M%SZ"))
    parser.add_argument("--only", nargs="+", choices=sorted(QUERIES))
    args = parser.parse_args()
    destination = args.private_output.resolve()
    if not destination.is_relative_to(PRIVATE.resolve()):
        parser.error("Raw metadata must stay inside the private LOCALAPPDATA assessment directory")
    PRIVATE.mkdir(parents=True, exist_ok=True)
    lock = PRIVATE / "collector.lock"
    try:
        lock_fd = os.open(lock, os.O_CREAT | os.O_EXCL | os.O_WRONLY)
    except FileExistsError:
        parser.error("Collector lock exists; verify its PID before manual stale-lock recovery")
    try:
        os.write(lock_fd, str(os.getpid()).encode())
        return collect(args.connection_file, destination, args.only)
    finally:
        os.close(lock_fd)
        lock.unlink()

if __name__ == "__main__":
    sys.exit(main())
