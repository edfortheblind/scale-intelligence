CREATE procedure RPT_CSO_AuditLogsLast7DaysCount
as
begin
	select count(*), 'Audit Logs Last 7 Days'
	from audit_log au with(nolock)
	where au.logged_date_time > (getdate()-7)
end