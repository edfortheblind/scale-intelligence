-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE dba_AddForeignKeyConstraint(
	@tableName sysname,
	@constraintName sysname,
	@columnName sysname,
	@referencedTableName sysname)
AS

	if not exists(
		select 
			* 
		from 
			sys.foreign_keys 
		where 
			name = @constraintName 
			and 
			type = N'<literal:1>')
	begin
		exec(N'<literal:2>'+@tableName+
			N'<literal:3>'+@constraintName+
			N'<literal:4>'+@columnName+N'<literal:5>'+@referencedTableName);
	end;