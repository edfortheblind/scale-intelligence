-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */




	
CREATE PROCEDURE dba_UpdateIndex(
   @indexName sysname,
	@tableName sysname,
	@columnList varchar(4000),
	@isUnique char(1),
	@includeColumnList varchar(4000) = null) 
AS
    declare @Statement nvarchar(500);
	declare @includeColumnPrefix nvarchar(max);
	set @includeColumnPrefix = N'<literal:1>';

    -- [comment omitted]
    IF INDEXPROPERTY(OBJECT_ID(@tableName),@indexName,N'<literal:2>') IS NOT NULL
       exec(N'<literal:3>'+@tableName+N'<literal:4>'+@indexName)
	   
	IF(@includeColumnList IS NOT NULL AND @includeColumnList <> N'<literal:5>')
		set @includeColumnPrefix = N'<literal:6>'+@includeColumnList+N'<literal:7>';

   IF (@isUnique = N'<literal:8>')
      exec(N'<literal:9>'+@indexName+N'<literal:10>'+@tableName+N'<literal:11>'+@columnList +N'<literal:12>' + @includeColumnPrefix);
   ELSE
      exec(N'<literal:13>'+@indexName+N'<literal:14>'+@tableName+N'<literal:15>'+@columnList +N'<literal:16>' + @includeColumnPrefix);
   
   if OBJECTPROPERTY(OBJECT_ID(N'<literal:17>'+@tableName),N'<literal:18>')=1
   begin
      set @tableName = N'<literal:19>'+@tableName      
      set @indexName = @indexName+N'<literal:20>'
      exec dba_UpdateIndex @indexName,@tableName,@columnList,@isUnique,@includeColumnList
   end
