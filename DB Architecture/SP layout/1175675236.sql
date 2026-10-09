create procedure RPT_CSO_TotalDeadlockRecordsLast14Days
as 
begin
	--Deadlocks Last 14 Days
	select count(*), 'Total Deadlock Records' 
	from audit_log au with(nolock) , audit_log_value auv with(nolock)
	where au.internal_id = auv.internal_id and auv.value like '%deadlock%'
	and au.logged_date_time > (getdate()-14)
end