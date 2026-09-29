-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE dba_DropForeignKeyConstraint(
	@tableName sysname,
	@constraintName sysname)
AS

	if exists(
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
			N'<literal:3>'+@constraintName);
	end;