-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */
    
    
    
CREATE PROCEDURE [dbo].[dba_UpdateColumn](    
    @tableName sysname,    
    @columnName sysname,    
    @isNullable char,    
    @datatype varchar(50),    
    @defaultValue varchar(100),    
    @isIdentity char,
    @useCheckConstraint nchar(1) = N'<literal:1>'	
    )    
AS     
    
    declare @Statement nvarchar(500)    
    declare @mode nvarchar(25)    
    declare @default nvarchar(100)    
    declare @nullClause nvarchar(25)    
    declare @df sysname    
    declare @identityClause nvarchar(25)    
    
    
    if @defaultValue IS NOT NULL    
        set @default = N'<literal:2>'+@defaultValue    
    else    
       set @default = N'<literal:3>'  
  
    if @isIdentity = N'<literal:4>'    
        set @identityClause = N'<literal:5>'    
    else    
       set @identityClause = N'<literal:6>'    
    
    -- [comment omitted]
    IF COLUMNPROPERTY(OBJECT_ID(@tableName),@columnName,N'<literal:7>') IS NULL    
    BEGIN    
        set @mode = N'<literal:8>'    
    
    END    
    ELSE -- [comment omitted]
    BEGIN    
        set @mode = N'<literal:9>'    
        set @default = N'<literal:10>' -- [comment omitted]
		set @identityClause = N'<literal:11>' -- [comment omitted]
 
		select @df=so.name  
	  from sysobjects so, syscolumns sc  
	  where   
	   sc.name = @columnName   
	   and sc.cdefault = so.id   
				and so.xtype = N'<literal:12>'  
				and so.name in (select name     
								from sysobjects     
								where parent_obj = object_id(@tableName)  
                            )  
    
        if @df IS NOT NULL    
            exec(N'<literal:13>'+@tableName+N'<literal:14>' + @df)    

    END    
     
    if @isNullable = N'<literal:15>'    
        set @nullClause = N'<literal:16>'    
    else    
        set @nullClause = N'<literal:17>'                  
       
    if(@useCheckConstraint = N'<literal:18>')
	begin  			  
		set @nullClause = N'<literal:19>';  
	end 
        
    set @Statement = N'<literal:20>'+@tableName+@mode+N'<literal:21>'+@columnName+N'<literal:22>'+@datatype+@default+@identityClause+@nullClause    

	exec sp_executesql @Statement    
    
    if(@useCheckConstraint = N'<literal:23>' And Not Exists(select * from INFORMATION_SCHEMA.CHECK_CONSTRAINTS where CONSTRAINT_NAME =  @tableName + N'<literal:24>' + @columnName + N'<literal:25>'))
		exec(N'<literal:26>'+@tableName+N'<literal:27>' +  @tableName + N'<literal:28>' + @columnName + N'<literal:29>' + N'<literal:30>' + @columnName + N'<literal:31>');
    
	if (@df is not null  and @useCheckConstraint = N'<literal:32>')
	BEGIN    
		if(@defaultValue IS NOT NUll)  
		exec(N'<literal:33>'+@tableName+N'<literal:34>'+@df+N'<literal:35>'+@defaultValue+N'<literal:36>'+@columnName)  
		else  
		exec(N'<literal:37>'+@tableName+N'<literal:38>'+@df+N'<literal:39>'+@columnName)    
	END     
    
	if OBJECTPROPERTY(OBJECT_ID(N'<literal:40>'+@tableName),N'<literal:41>')=1    
	BEGIN    
		set @df = N'<literal:42>'+@tableName          
		exec dba_UpdateColumn @df,@columnName,@isNullable,@datatype,@defaultValue,@isIdentity,@useCheckConstraint    
	END    
    
	if OBJECTPROPERTY(OBJECT_ID(N'<literal:43>'+@tableName),N'<literal:44>')=1    
	BEGIN    
		set @df = N'<literal:45>'+@tableName          
		exec dba_UpdateColumn @df,@columnName,@isNullable,@datatype,@defaultValue,@isIdentity,@useCheckConstraint    
	END    
   
	if @tableName=N'<literal:46>' AND OBJECTPROPERTY(OBJECT_ID(N'<literal:47>'),N'<literal:48>')=1   
	BEGIN    
		set @df = N'<literal:49>'          
		exec dba_UpdateColumn @df,@columnName,@isNullable,@datatype,@defaultValue,@isIdentity    
	END    
        
	-- [comment omitted]
	If (@defaultValue is not null and @useCheckConstraint = N'<literal:50>')
	begin
	exec(N'<literal:51>'+@tableName + N'<literal:52>' + @columnName + N'<literal:53>' + @defaultValue)
	end  
        
         
-- [comment omitted]
    
     
  