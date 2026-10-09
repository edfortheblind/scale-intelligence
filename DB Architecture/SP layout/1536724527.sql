
/****** Object:  StoredProcedure [dbo].[dba_UpdateColumn]    Script Date: 05/10/2013 10:27:01 ******/
    
    
    
CREATE PROCEDURE [dbo].[dba_UpdateColumn](    
    @tableName sysname,    
    @columnName sysname,    
    @isNullable char,    
    @datatype varchar(50),    
    @defaultValue varchar(100),    
    @isIdentity char,
    @useCheckConstraint nchar(1) = N'N'	
    )    
AS     
    
    declare @Statement nvarchar(500)    
    declare @mode nvarchar(25)    
    declare @default nvarchar(100)    
    declare @nullClause nvarchar(25)    
    declare @df sysname    
    declare @identityClause nvarchar(25)    
    
    
    if @defaultValue IS NOT NULL    
        set @default = N' DEFAULT '+@defaultValue    
    else    
       set @default = N''  
  
    if @isIdentity = N'Y'    
        set @identityClause = N' IDENTITY(1,1)'    
    else    
       set @identityClause = N''    
    
    -- see if the column exists  NULL=Does not exist    
    IF COLUMNPROPERTY(OBJECT_ID(@tableName),@columnName,N'IsComputed') IS NULL    
    BEGIN    
        set @mode = N' ADD'    
    
    END    
    ELSE -- Column already exists, so alter it to match parameters    
    BEGIN    
        set @mode = N' ALTER COLUMN'    
        set @default = N'' -- Cannot alter default values    
		set @identityClause = N'' -- Cannot alter identity    
 
		select @df=so.name  
	  from sysobjects so, syscolumns sc  
	  where   
	   sc.name = @columnName   
	   and sc.cdefault = so.id   
				and so.xtype = N'D '  
				and so.name in (select name     
								from sysobjects     
								where parent_obj = object_id(@tableName)  
                            )  
    
        if @df IS NOT NULL    
            exec(N'alter table '+@tableName+N' drop constraint ' + @df)    

    END    
     
    if @isNullable = N'Y'    
        set @nullClause = N' NULL'    
    else    
        set @nullClause = N' NOT NULL'                  
       
    if(@useCheckConstraint = N'Y')
	begin  			  
		set @nullClause = N' NULL';  
	end 
        
    set @Statement = N'ALTER TABLE '+@tableName+@mode+N' '+@columnName+N' '+@datatype+@default+@identityClause+@nullClause    

	exec sp_executesql @Statement    
    
    if(@useCheckConstraint = N'Y' And Not Exists(select * from INFORMATION_SCHEMA.CHECK_CONSTRAINTS where CONSTRAINT_NAME =  @tableName + N'_' + @columnName + N'_constraint'))
		exec(N'ALTER TABLE '+@tableName+N' WITH NOCHECK ADD CONSTRAINT ' +  @tableName + N'_' + @columnName + N'_constraint' + N' CHECK(' + @columnName + N' IS NOT NULL) ');
    
	if (@df is not null  and @useCheckConstraint = N'N')
	BEGIN    
		if(@defaultValue IS NOT NUll)  
		exec(N'ALTER TABLE '+@tableName+N' ADD CONSTRAINT '+@df+N' DEFAULT '+@defaultValue+N' FOR '+@columnName)  
		else  
		exec(N'ALTER TABLE '+@tableName+N' ADD CONSTRAINT '+@df+N' DEFAULT  NULL FOR '+@columnName)    
	END     
    
	if OBJECTPROPERTY(OBJECT_ID(N'AR_'+@tableName),N'IsTable')=1    
	BEGIN    
		set @df = N'AR_'+@tableName          
		exec dba_UpdateColumn @df,@columnName,@isNullable,@datatype,@defaultValue,@isIdentity,@useCheckConstraint    
	END    
    
	if OBJECTPROPERTY(OBJECT_ID(N'IA_'+@tableName),N'IsTable')=1    
	BEGIN    
		set @df = N'IA_'+@tableName          
		exec dba_UpdateColumn @df,@columnName,@isNullable,@datatype,@defaultValue,@isIdentity,@useCheckConstraint    
	END    
   
	if @tableName=N'RECEIPT_CONTAINER' AND OBJECTPROPERTY(OBJECT_ID(N'DELETED_RECEIPT_CONTAINER'),N'IsTable')=1   
	BEGIN    
		set @df = N'DELETED_RECEIPT_CONTAINER'          
		exec dba_UpdateColumn @df,@columnName,@isNullable,@datatype,@defaultValue,@isIdentity    
	END    
        
	-- Update the values
	If (@defaultValue is not null and @useCheckConstraint = N'Y')
	begin
	exec(N'Update '+@tableName + N' set ' + @columnName + N' = ' + @defaultValue)
	end  
        
         
-- end dba_UpdateColumn    
    
     
  