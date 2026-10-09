/*
	Task	| By	| Date			| Modification Description
	-------------------------------------------------
	219196	| MJ	| 05/08/2018	| Created.

*/	
CREATE PROCEDURE PMN_EVENT_SESSION
(
	@condition int = 2
)
/*
	If @condition is zero then stop event session.
	If @condition is one then create and start event session.	
*/ 

AS 

SET NOCOUNT ON


/*Stop Event Session when @condition passed 0*/
IF @condition = 0
BEGIN
	IF EXISTS(SELECT * FROM sys.database_event_sessions WHERE name=N'LongRunningQueries')  
	BEGIN
		ALTER EVENT SESSION LongRunningQueries ON DATABASE STATE = STOP;			
		PRINT N'Stopping Long Running Queries event seesion'
	END

	IF EXISTS(SELECT * FROM sys.database_event_sessions WHERE name=N'BlockedProcessReport')  
	BEGIN
		ALTER EVENT SESSION BlockedProcessReport ON DATABASE STATE = STOP;	
		PRINT N'Stopping Blocked Process Report event seesion'
	END

	IF EXISTS(SELECT * FROM sys.database_event_sessions WHERE name=N'DeadlockGraph')  
	BEGIN
		ALTER EVENT SESSION DeadlockGraph ON DATABASE STATE = STOP;	
		PRINT N'Stopping Dead Lock Graph event seesion'
	END
END


IF @condition = 1
BEGIN

	/*Drop Existing session*/
	IF EXISTS(SELECT * FROM sys.database_event_sessions WHERE name=N'LongRunningQueries')  
		DROP EVENT session LongRunningQueries ON database;  
	
	IF EXISTS(SELECT * FROM sys.database_event_sessions WHERE name=N'BlockedProcessReport')  
		DROP EVENT session BlockedProcessReport ON database;  

	IF EXISTS(SELECT * FROM sys.database_event_sessions WHERE name=N'DeadlockGraph')  
		DROP EVENT session DeadlockGraph ON database;  

	/*Replace https://msdemostorage1.blob.core.windows.net/events with client specific Azure storage account URL*/

	/*Create Event Session*/
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
	ADD TARGET package0.event_file(SET filename=N'https://msdemostorage1.blob.core.windows.net/events/LongRunningQueries.xel')
	WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)



	CREATE EVENT SESSION BlockedProcessReport ON DATABASE 
	ADD EVENT sqlserver.blocked_process_report(
		ACTION(package0.event_sequence,sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.client_pid,sqlserver.compile_plan_guid,sqlserver.context_info,sqlserver.database_id,sqlserver.database_name,sqlserver.execution_plan_guid,sqlserver.plan_handle,sqlserver.query_hash,sqlserver.query_hash_signed,sqlserver.query_plan_hash,sqlserver.query_plan_hash_signed,sqlserver.request_id,sqlserver.session_id,sqlserver.sql_text,sqlserver.transaction_id,sqlserver.transaction_sequence,sqlserver.tsql_stack,sqlserver.username))
	ADD TARGET package0.event_file(SET filename=N'https://msdemostorage1.blob.core.windows.net/events/BlockedProcessReport.xel')
	WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)



	CREATE EVENT SESSION DeadlockGraph ON DATABASE 
	ADD EVENT sqlserver.database_xml_deadlock_report(
		ACTION(package0.event_sequence,sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.client_pid,sqlserver.compile_plan_guid,sqlserver.context_info,sqlserver.database_id,sqlserver.database_name,sqlserver.execution_plan_guid,sqlserver.plan_handle,sqlserver.query_hash,sqlserver.query_hash_signed,sqlserver.query_plan_hash,sqlserver.query_plan_hash_signed,sqlserver.request_id,sqlserver.session_id,sqlserver.sql_text,sqlserver.transaction_id,sqlserver.transaction_sequence,sqlserver.tsql_stack,sqlserver.username))
	ADD TARGET package0.event_file(SET filename=N'https://msdemostorage1.blob.core.windows.net/events/DeadlockGraph.xel')
	WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)


	/*Start Sessions*/
	ALTER EVENT SESSION LongRunningQueries ON DATABASE STATE = START;
	PRINT N'Starting Long Running Queries event seesion'
	ALTER EVENT SESSION BlockedProcessReport ON DATABASE STATE = START;
	PRINT N'Starting Blocked Process Report event seesion'
	ALTER EVENT SESSION DeadlockGraph ON DATABASE STATE = START;
	PRINT N'Starting Dead Lock Graph event seesion'


END



