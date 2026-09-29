-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_TotalDeadlockRecordsLast14Days
as 
begin
	-- [comment omitted]
	select count(*), '<literal:1>' 
	from audit_log au with(nolock) , audit_log_value auv with(nolock)
	where au.internal_id = auv.internal_id and auv.value like '<literal:2>'
	and au.logged_date_time > (getdate()-14)
end