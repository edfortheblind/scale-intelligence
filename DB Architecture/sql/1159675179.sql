-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_UniqueDeadlockRecordsLast14Days
as 
begin
	select count(*), '<literal:1>'  from (
	select auv.value from audit_log au with(nolock) , audit_log_value auv with(nolock)
	where au.internal_id = auv.internal_id and auv.value like '<literal:2>'
	and au.logged_date_time > (getdate()-14) group by auv.value
	) UniqueDeadlockCount
end