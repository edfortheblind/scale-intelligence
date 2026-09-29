-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_DeadlockRecordDetailsLast14Days
as 
begin
	select au.class_name, au.method_name, auv.value, auv.date_time_stamp
	from audit_log au with(nolock) , audit_log_value auv with(nolock)
	where au.internal_id = auv.internal_id and auv.value like '<literal:1>'
	and au.logged_date_time > (getdate()-14) order by auv.date_time_stamp
end