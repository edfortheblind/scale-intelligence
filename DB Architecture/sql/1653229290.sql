-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




	
CREATE PROCEDURE PMN_EVENT_SESSION
(
	@condition int = 2
)
/* [comment omitted] */


 

AS 

SET NOCOUNT ON


/* [comment omitted] */
IF @condition = 0
BEGIN
	IF EXISTS(SELECT * FROM sys.database_event_sessions WHERE name=N'<literal:1>')  
	BEGIN
		ALTER EVENT SESSION LongRunningQueries ON DATABASE STATE = STOP;			
		PRINT N'<literal:2>'
	END

	IF EXISTS(SELECT * FROM sys.database_event_sessions WHERE name=N'<literal:3>')  
	BEGIN
		ALTER EVENT SESSION BlockedProcessReport ON DATABASE STATE = STOP;	
		PRINT N'<literal:4>'
	END

	IF EXISTS(SELECT * FROM sys.database_event_sessions WHERE name=N'<literal:5>')  
	BEGIN
		ALTER EVENT SESSION DeadlockGraph ON DATABASE STATE = STOP;	
		PRINT N'<literal:6>'
	END
END


IF @condition = 1
BEGIN

	/* [comment omitted] */
	IF EXISTS(SELECT * FROM sys.database_event_sessions WHERE name=N'<literal:7>')  
		DROP EVENT session LongRunningQueries ON database;  
	
	IF EXISTS(SELECT * FROM sys.database_event_sessions WHERE name=N'<literal:8>')  
		DROP EVENT session BlockedProcessReport ON database;  

	IF EXISTS(SELECT * FROM sys.database_event_sessions WHERE name=N'<literal:9>')  
		DROP EVENT session DeadlockGraph ON database;  

	/* [comment omitted] */

	/* [comment omitted] */
	CREATE EVENT SESSION LongRunningQueries ON DATABASE 
	ADD EVENT sqlserver.rpc_completed(
		ACTION(package0.event_sequence,sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.client_pid,sqlserver.compile_plan_guid,sqlserver.context_info,sqlserver.database_id,sqlserver.database_name,sqlserver.execution_plan_guid,sqlserver.plan_handle,sqlserver.query_hash,sqlserver.query_hash_signed,sqlserver.query_plan_hash,sqlserver.query_plan_hash_signed,sqlserver.request_id,sqlserver.session_id,sqlserver.sql_text,sqlserver.transaction_id,sqlserver.transaction_sequence,sqlserver.tsql_stack,sqlserver.username)
		WHERE (sqlserver.rpc_completed.duration>=2000000)),
	ADD EVENT sqlserver.sp_statement_completed(
		ACTION(package0.event_sequence,sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.client_pid,sqlserver.compile_plan_guid,sqlserver.context_info,sqlserver.database_id,sqlserver.database_name,sqlserver.execution_plan_guid,sqlserver.plan_handle,sqlserver.query_hash,sqlserver.query_hash_signed,sqlserver.query_plan_hash,sqlserver.query_plan_hash_signed,sqlserver.request_id,sqlserver.session_id,sqlserver.sql_text,sqlserver.transaction_id,sqlserver.transaction_sequence,sqlserver.tsql_stack,sqlserver.username)
		WHERE (sqlserver.sp_statement_completed.duration>=2000000)),
	ADD EVENT sqlserver.sql_batch_completed(
		ACTION(package0.event_sequence,sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.client_pid,sqlserver.compile_plan_guid,sqlserver.context_info,sqlserver.database_id,sqlserver.database_name,sqlserver.execution_plan_guid,sqlserver.plan_handle,sqlserver.query_hash,sqlserver.query_hash_signed,sqlserver.query_plan_hash,sqlserver.query_plan_hash_signed,sqlserver.request_id,sqlserver.session_id,sqlserver.sql_text,sqlserver.transaction_id,sqlserver.transaction_sequence,sqlserver.tsql_stack,sqlserver.username)
		WHERE (sqlserver.sql_batch_completed.duration>=2000000)),
	ADD EVENT sqlserver.sql_statement_completed(
		ACTION(package0.event_sequence,sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.client_pid,sqlserver.compile_plan_guid,sqlserver.context_info,sqlserver.database_id,sqlserver.database_name,sqlserver.execution_plan_guid,sqlserver.plan_handle,sqlserver.query_hash,sqlserver.query_hash_signed,sqlserver.query_plan_hash,sqlserver.query_plan_hash_signed,sqlserver.request_id,sqlserver.session_id,sqlserver.sql_text,sqlserver.transaction_id,sqlserver.transaction_sequence,sqlserver.tsql_stack,sqlserver.username)
		WHERE (sqlserver.sql_statement_completed.duration>=2000000))
	ADD TARGET package0.event_file(SET filename=N'<literal:10>')
	WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)



	CREATE EVENT SESSION BlockedProcessReport ON DATABASE 
	ADD EVENT sqlserver.blocked_process_report(
		ACTION(package0.event_sequence,sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.client_pid,sqlserver.compile_plan_guid,sqlserver.context_info,sqlserver.database_id,sqlserver.database_name,sqlserver.execution_plan_guid,sqlserver.plan_handle,sqlserver.query_hash,sqlserver.query_hash_signed,sqlserver.query_plan_hash,sqlserver.query_plan_hash_signed,sqlserver.request_id,sqlserver.session_id,sqlserver.sql_text,sqlserver.transaction_id,sqlserver.transaction_sequence,sqlserver.tsql_stack,sqlserver.username))
	ADD TARGET package0.event_file(SET filename=N'<literal:11>')
	WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)



	CREATE EVENT SESSION DeadlockGraph ON DATABASE 
	ADD EVENT sqlserver.database_xml_deadlock_report(
		ACTION(package0.event_sequence,sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.client_pid,sqlserver.compile_plan_guid,sqlserver.context_info,sqlserver.database_id,sqlserver.database_name,sqlserver.execution_plan_guid,sqlserver.plan_handle,sqlserver.query_hash,sqlserver.query_hash_signed,sqlserver.query_plan_hash,sqlserver.query_plan_hash_signed,sqlserver.request_id,sqlserver.session_id,sqlserver.sql_text,sqlserver.transaction_id,sqlserver.transaction_sequence,sqlserver.tsql_stack,sqlserver.username))
	ADD TARGET package0.event_file(SET filename=N'<literal:12>')
	WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)


	/* [comment omitted] */
	ALTER EVENT SESSION LongRunningQueries ON DATABASE STATE = START;
	PRINT N'<literal:13>'
	ALTER EVENT SESSION BlockedProcessReport ON DATABASE STATE = START;
	PRINT N'<literal:14>'
	ALTER EVENT SESSION DeadlockGraph ON DATABASE STATE = START;
	PRINT N'<literal:15>'


END



