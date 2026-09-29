-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_TopFiveTablesByRecordCount
as
begin
	select top 5 object_name(id) as TableName, rowcnt as Records 
	from sysindexes with(nolock) 
	where indid in (0,1) 
	and object_name(id) not like '<literal:1>' 
	and object_name(id) not like '<literal:2>' 
	and object_name(id) not like '<literal:3>' 
	order by 2 desc
end