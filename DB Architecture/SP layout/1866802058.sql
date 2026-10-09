/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	14473		| TDL			| 04/13/04	| Fixed Apostrophes								Constants.iPARTIAL for partial pick.
*/	
CREATE PROCEDURE dba_DropIndex(
   @indexName sysname,
	@tableName sysname) 
AS
    -- see if the index exists  NULL=Does not exist
    IF INDEXPROPERTY(OBJECT_ID(@tableName),@indexName,N'IsClustered') IS NOT NULL
       exec(N'DROP INDEX '+@tableName+N'.'+@indexName)

   if OBJECTPROPERTY(OBJECT_ID(N'AR_'+@tableName),N'IsTable')=1
   begin
      set @tableName = N'AR_'+@tableName      
      set @indexname = @indexname+ N'_AR'
      exec dba_DropIndex @indexName, @tableName
   end