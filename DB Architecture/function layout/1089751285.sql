

	-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;

	
CREATE FUNCTION RSCMfn_RtrvMsg(
	@stKey nvarchar(50))
	
RETURNS nvarchar(2000)
BEGIN
	
	-- local constants.
	declare @stMSG nvarchar(4);
	set @stMSG = N'Msg';

	-- local variables.
	declare @stDftLang nvarchar(25);
	declare @stRetMsg nvarchar(2000);

	-- retrieve the default system language.
	SELECT @stDftLang = SYSTEM_VALUE
	  FROM SYSTEM_CONFIG_DETAIL
	 WHERE SYS_KEY = N'80' AND RECORD_TYPE = N'Technical';
	 
	-- return null if no default language specified.
	if (@stDftLang is null)
		return null; 
	 
	-- check ResourceFileCustom first.
	SELECT @stRetMsg = TEXT
	  FROM RESOURCE_FILE_CUSTOM
	 WHERE RESOURCE_LANGUAGE = @stDftLang
	   AND RESOURCE_GROUP = @stMSG
	   AND RESOURCE_KEY = @stKey;
	   
	-- if none found, check ResourceFileBase.
	if (@stRetMsg is null)
	begin
		SELECT @stRetMsg = TEXT
		  FROM RESOURCE_FILE_BASE
		 WHERE RESOURCE_LANGUAGE = @stDftLang
		   AND RESOURCE_GROUP = @stMSG
		   AND RESOURCE_KEY = @stKey;
		  
		  if(@stRetMsg  is null)
			begin 
				SELECT @stRetMsg  = TEXT
				  FROM RESOURCE_FILE_BASE
				 WHERE RESOURCE_LANGUAGE = N'en-US'
			   AND RESOURCE_GROUP = @stMSG
			   AND RESOURCE_KEY = @stKey;
			end
		 
		-- if the message was still not found,
		-- return '<stKey> (Unknown Resource)'.
		if (@stRetMsg is null)
			-- TODO: if ever a RSCMfn_RtrvText is written, 
			-- pass the key UNKNOWNRESOURCE to it instead of hardcoding the value.
			set @stRetMsg = @stKey + N' (Unknown Resource)';
	end; -- end if no custom message.
		
	return @stRetMsg;
END -- end RSCMfn_RtrvMsg




