-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */



	
CREATE PROCEDURE dba_DropIndex(
   @indexName sysname,
	@tableName sysname) 
AS
    -- [comment omitted]
    IF INDEXPROPERTY(OBJECT_ID(@tableName),@indexName,N'<literal:1>') IS NOT NULL
       exec(N'<literal:2>'+@tableName+N'<literal:3>'+@indexName)

   if OBJECTPROPERTY(OBJECT_ID(N'<literal:4>'+@tableName),N'<literal:5>')=1
   begin
      set @tableName = N'<literal:6>'+@tableName      
      set @indexname = @indexname+ N'<literal:7>'
      exec dba_DropIndex @indexName, @tableName
   end