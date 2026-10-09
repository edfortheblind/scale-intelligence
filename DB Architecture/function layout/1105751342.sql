/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	19790		| SMS			| 09/27/06	| Created.
	19555		| AKN			| 11/07/06	| Added a parameter for getting the Resource Language
	20741		| SMF			| 02/21/07	| Corrected oracle cursor errors
	223979      | SHS			| 05/25/18  | Return English resource if specific language resource is not found

	Returns the message for the specified resource key and resource group.  Note that the
	default system language is always used inside non-user specific
	database source. 
	
	Parameters
		String		resKey		The resource key.
		String 		resGroup	The resource group
		String 		resLang		The resource language.
		
	Return Value
		String		retMsg	The translated message.
*/
	-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;
	
CREATE FUNCTION RSCMfn_RtrvResource(
	@resKey nvarchar(50),
	@resGroup nvarchar(4),
	@resLang nvarchar(25))
	
RETURNS nvarchar(2000)
BEGIN
	
	-- local variables.
	declare @lang nvarchar(25);
	declare @retMsg nvarchar(2000);
	
	-- set the resLang value to local variable lang.
	set @lang = @resLang;
	
	if (@resKey is null or @resKey = N'')
		return N'';

	if (@lang  is null or @lang = N'')
	Begin
		-- retrieve the default system language.
		SELECT @lang = SYSTEM_VALUE
		  FROM SYSTEM_CONFIG_DETAIL
		 WHERE SYS_KEY = N'80' AND RECORD_TYPE = N'Technical';
	End	

	-- return null if no default language specified.
	if (@lang is null)
		return null; 
	 
	-- check ResourceFileCustom first.
	SELECT @retMsg  = TEXT
	  FROM RESOURCE_FILE_CUSTOM
	 WHERE RESOURCE_LANGUAGE = @lang
	   AND RESOURCE_GROUP = @resGroup
	   AND RESOURCE_KEY = @resKey;
	   
	-- if none found, check ResourceFileBase.
	if (@retMsg  is null)
	begin
		SELECT @retMsg  = TEXT
		  FROM RESOURCE_FILE_BASE
		 WHERE RESOURCE_LANGUAGE = @lang
		   AND RESOURCE_GROUP = @resGroup
		   AND RESOURCE_KEY = @resKey;
		   
		-- if the message was still not found,
		if(@retMsg  is null)
		begin 
			SELECT @retMsg  = TEXT
			  FROM RESOURCE_FILE_BASE
			 WHERE RESOURCE_LANGUAGE = N'en-US'
		   AND RESOURCE_GROUP = @resGroup
		   AND RESOURCE_KEY = @resKey;
		end

		if (@retMsg  is null)
			set @retMsg  = @resKey;
	end; -- end if no custom message.
		
	return @retMsg ;
END -- end RSCMfn_RtrvMsg



