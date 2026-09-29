-- DOCUMENTATION ONLY: literals/comments removed; do not execute.


/* [comment omitted] */








CREATE PROCEDURE dba_DropColumn(
    @tableName sysname,
    @columnName sysname)
AS 

    declare @Statement nvarchar(500)
    declare @df sysname


    -- [comment omitted]
    IF COLUMNPROPERTY(OBJECT_ID(@tableName),@columnName,N'<literal:1>') IS NOT NULL
    BEGIN

        select @df=so.name 
          from sysobjects so, syscolumns sc
         where so.parent_obj = object_id(@tableName) 
           and so.id = sc.cdefault
	   and sc.name = @columnName

         if @df IS NOT NULL
            exec(N'<literal:2>'+@tableName+N'<literal:3>' + @df)
         
         SET @df=NULL

       select @df=cdefault
         from syscolumns 
        where id = object_id(@tableName) 
          and name=@columnName

         if @df IS NOT NULL AND @df > 0
             exec(N'<literal:4>'+@tableName+N'<literal:5>'+@columnName+N'<literal:6>')

         exec(N'<literal:7>'+@tableName+N'<literal:8>'+@columnName)
      
         if OBJECTPROPERTY(OBJECT_ID(N'<literal:9>'+@tableName),N'<literal:10>')=1
         BEGIN
            set @df = N'<literal:11>'+@tableName      
            exec dba_DropColumn @df,@columnName
         END

         if OBJECTPROPERTY(OBJECT_ID(N'<literal:12>'+@tableName),N'<literal:13>')=1
         BEGIN
            set @df= N'<literal:14>'+@tableName      
            exec dba_DropColumn @df,@columnName
         END

    END        
-- [comment omitted]