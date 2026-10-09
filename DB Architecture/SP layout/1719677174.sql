create procedure RPT_CSO_AuditLogsLast7DaysDetails
as
begin
	select count(*) as Num, au.class_name, au.method_name, auv.value, min(au.date_time_stamp) as FirstOccurrence, max(au.date_time_stamp) as LastOccurrence
	from audit_log au with(nolock) , audit_log_value auv with(nolock)
	where au.internal_id = auv.internal_id
	and au.logged_date_time > (getdate()-7)and method_name not in ('GetStringResource')
	group by au.class_name, au.method_name, auv.value
	order by au.class_name, au.method_name, auv.value, Num desc
end