-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




  
  
CREATE PROCEDURE dba_RenameTable (
@oldTableName sysname,  
@newTableName sysname)

AS

declare @tableCount NUMERIC(9,0);

SELECT @tableCount= COUNT(*) FROM SYSOBJECTS WHERE name = @oldTableName;

if @tableCount > 0
	exec sp_rename @oldTableName, @newTableName;



