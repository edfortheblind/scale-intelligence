/*
	Mod Number  | Programmer    	| Date       	| Modification Description
	--------------------------------------------------------------------
	            | RAB		| 12/20/2006	| Created.

	Drops a foreign key constraint.
*/


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
			type = N'F')
	begin
		exec(N'ALTER TABLE '+@tableName+
			N' DROP CONSTRAINT '+@constraintName);
	end;