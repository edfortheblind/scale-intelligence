-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */



















	-- [comment omitted]
	
CREATE FUNCTION RSCMfn_RtrvResource(
	@resKey nvarchar(50),
	@resGroup nvarchar(4),
	@resLang nvarchar(25))
	
RETURNS nvarchar(2000)
BEGIN
	
	-- [comment omitted]
	declare @lang nvarchar(25);
	declare @retMsg nvarchar(2000);
	
	-- [comment omitted]
	set @lang = @resLang;
	
	if (@resKey is null or @resKey = N'<literal:1>')
		return N'<literal:2>';

	if (@lang  is null or @lang = N'<literal:3>')
	Begin
		-- [comment omitted]
		SELECT @lang = SYSTEM_VALUE
		  FROM SYSTEM_CONFIG_DETAIL
		 WHERE SYS_KEY = N'<literal:4>' AND RECORD_TYPE = N'<literal:5>';
	End	

	-- [comment omitted]
	if (@lang is null)
		return null; 
	 
	-- [comment omitted]
	SELECT @retMsg  = TEXT
	  FROM RESOURCE_FILE_CUSTOM
	 WHERE RESOURCE_LANGUAGE = @lang
	   AND RESOURCE_GROUP = @resGroup
	   AND RESOURCE_KEY = @resKey;
	   
	-- [comment omitted]
	if (@retMsg  is null)
	begin
		SELECT @retMsg  = TEXT
		  FROM RESOURCE_FILE_BASE
		 WHERE RESOURCE_LANGUAGE = @lang
		   AND RESOURCE_GROUP = @resGroup
		   AND RESOURCE_KEY = @resKey;
		   
		-- [comment omitted]
		if(@retMsg  is null)
		begin 
			SELECT @retMsg  = TEXT
			  FROM RESOURCE_FILE_BASE
			 WHERE RESOURCE_LANGUAGE = N'<literal:6>'
		   AND RESOURCE_GROUP = @resGroup
		   AND RESOURCE_KEY = @resKey;
		end

		if (@retMsg  is null)
			set @retMsg  = @resKey;
	end; -- [comment omitted]
		
	return @retMsg ;
END -- [comment omitted]



