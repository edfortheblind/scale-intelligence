/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	247277		| MDL			| 03/02/20	| Created.	
*/

CREATE PROCEDURE dba_DropDefaultKeyConstraint(
	@tableName sysname,
	@columnname sysname)
AS

Begin
declare @default sysname, @sql nvarchar(max)

select @default = name 
from sys.default_constraints 
where parent_object_id = object_id(@tableName)
AND type = N'D'
AND parent_column_id = (
    select column_id 
    from sys.columns 
    where object_id = object_id(@tableName)
    and name = @columnname
    )
set @sql = N'alter table '+@tableName+N' drop constraint ' + @default
exec sp_executesql @sql;
End;