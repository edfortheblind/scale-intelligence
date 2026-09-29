-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE dba_DropDefaultKeyConstraint(
	@tableName sysname,
	@columnname sysname)
AS

Begin
declare @default sysname, @sql nvarchar(max)

select @default = name 
from sys.default_constraints 
where parent_object_id = object_id(@tableName)
AND type = N'<literal:1>'
AND parent_column_id = (
    select column_id 
    from sys.columns 
    where object_id = object_id(@tableName)
    and name = @columnname
    )
set @sql = N'<literal:2>'+@tableName+N'<literal:3>' + @default
exec sp_executesql @sql;
End;