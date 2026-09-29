-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE procedure RPT_CSO_AuditLogsLast7DaysCount
as
begin
	select count(*), '<literal:1>'
	from audit_log au with(nolock)
	where au.logged_date_time > (getdate()-7)
end