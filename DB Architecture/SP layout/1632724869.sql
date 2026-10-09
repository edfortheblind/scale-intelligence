/*
	Mod Number  | Programmer    	| Date       	| Modification Description
	--------------------------------------------------------------------
	            | RAB		| 12/20/2006	| Created.

	Adds a foreign key constraint to a table.
*/


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
			type = N'F')
	begin
		exec(N'ALTER TABLE '+@tableName+
			N' ADD CONSTRAINT '+@constraintName+
			N' FOREIGN KEY ('+@columnName+N') REFERENCES '+@referencedTableName);
	end;