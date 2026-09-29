-- DOCUMENTATION ONLY: literals/comments removed; do not execute.


	-- [comment omitted]

	
CREATE FUNCTION RSCMfn_RtrvMsg(
	@stKey nvarchar(50))
	
RETURNS nvarchar(2000)
BEGIN
	
	-- [comment omitted]
	declare @stMSG nvarchar(4);
	set @stMSG = N'<literal:1>';

	-- [comment omitted]
	declare @stDftLang nvarchar(25);
	declare @stRetMsg nvarchar(2000);

	-- [comment omitted]
	SELECT @stDftLang = SYSTEM_VALUE
	  FROM SYSTEM_CONFIG_DETAIL
	 WHERE SYS_KEY = N'<literal:2>' AND RECORD_TYPE = N'<literal:3>';
	 
	-- [comment omitted]
	if (@stDftLang is null)
		return null; 
	 
	-- [comment omitted]
	SELECT @stRetMsg = TEXT
	  FROM RESOURCE_FILE_CUSTOM
	 WHERE RESOURCE_LANGUAGE = @stDftLang
	   AND RESOURCE_GROUP = @stMSG
	   AND RESOURCE_KEY = @stKey;
	   
	-- [comment omitted]
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
				 WHERE RESOURCE_LANGUAGE = N'<literal:4>'
			   AND RESOURCE_GROUP = @stMSG
			   AND RESOURCE_KEY = @stKey;
			end
		 
		-- [comment omitted]
		-- [comment omitted]
		if (@stRetMsg is null)
			-- [comment omitted]
			-- [comment omitted]
			set @stRetMsg = @stKey + N'<literal:5>';
	end; -- [comment omitted]
		
	return @stRetMsg;
END -- [comment omitted]




