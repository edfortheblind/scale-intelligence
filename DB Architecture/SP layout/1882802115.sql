
/*
   Mod Number	| Programmer		| Date   	| Modification Description
   --------------------------------------------------------------------
   14473       | TDL             | 04/13/04	| Fixed Apostrophes Constants.iPARTIAL for partial pick.
   111906      | SAM		     | 07/01/13	| Added Include support while creating index
*/	
CREATE PROCEDURE dba_UpdateIndex(
   @indexName sysname,
	@tableName sysname,
	@columnList varchar(4000),
	@isUnique char(1),
	@includeColumnList varchar(4000) = null) 
AS
    declare @Statement nvarchar(500);
	declare @includeColumnPrefix nvarchar(max);
	set @includeColumnPrefix = N'';

    -- see if the index exists  NULL=Does not exist
    IF INDEXPROPERTY(OBJECT_ID(@tableName),@indexName,N'IsClustered') IS NOT NULL
       exec(N'DROP INDEX '+@tableName+N'.'+@indexName)
	   
	IF(@includeColumnList IS NOT NULL AND @includeColumnList <> N'')
		set @includeColumnPrefix = N' INCLUDE ( '+@includeColumnList+N')';

   IF (@isUnique = N'Y')
      exec(N'CREATE UNIQUE INDEX '+@indexName+N' ON '+@tableName+N'('+@columnList +N')' + @includeColumnPrefix);
   ELSE
      exec(N'CREATE INDEX '+@indexName+N' ON '+@tableName+N'('+@columnList +N')' + @includeColumnPrefix);
   
   if OBJECTPROPERTY(OBJECT_ID(N'AR_'+@tableName),N'IsTable')=1
   begin
      set @tableName = N'AR_'+@tableName      
      set @indexName = @indexName+N'_AR'
      exec dba_UpdateIndex @indexName,@tableName,@columnList,@isUnique,@includeColumnList
   end
