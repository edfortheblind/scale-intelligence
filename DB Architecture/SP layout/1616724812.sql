

/*
	Mod Number  | Programmer    	| Date       	| Modification Description
	--------------------------------------------------------------------
	            | BTD		| 01/27/2004	| Created.
	14660	    | BTD		| 05/18/2004	| Added sp_unbindefault call

	Drops a column from a table
*/

CREATE PROCEDURE dba_DropColumn(
    @tableName sysname,
    @columnName sysname)
AS 

    declare @Statement nvarchar(500)
    declare @df sysname


    -- see if the column exists  NULL=Does nott exist
    IF COLUMNPROPERTY(OBJECT_ID(@tableName),@columnName,N'IsComputed') IS NOT NULL
    BEGIN

        select @df=so.name 
          from sysobjects so, syscolumns sc
         where so.parent_obj = object_id(@tableName) 
           and so.id = sc.cdefault
	   and sc.name = @columnName

         if @df IS NOT NULL
            exec(N'alter table '+@tableName+N' drop constraint ' + @df)
         
         SET @df=NULL

       select @df=cdefault
         from syscolumns 
        where id = object_id(@tableName) 
          and name=@columnName

         if @df IS NOT NULL AND @df > 0
             exec(N'sp_unbindefault '''+@tableName+N'.'+@columnName+N'''')

         exec(N'ALTER TABLE '+@tableName+N' DROP COLUMN '+@columnName)
      
         if OBJECTPROPERTY(OBJECT_ID(N'AR_'+@tableName),N'IsTable')=1
         BEGIN
            set @df = N'AR_'+@tableName      
            exec dba_DropColumn @df,@columnName
         END

         if OBJECTPROPERTY(OBJECT_ID(N'IA_'+@tableName),N'IsTable')=1
         BEGIN
            set @df= N'AR_'+@tableName      
            exec dba_DropColumn @df,@columnName
         END

    END        
-- end dba_DropColumn