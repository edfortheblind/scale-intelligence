-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;
CREATE PROCEDURE DM_InsightDetailPaneData(@ObjectId numeric(9), @culture nvarchar(10))  
AS 
BEGIN

	-- local variables.
	declare @lang nvarchar(25);

	-- retrieve the default system language.
		SELECT @lang = SYSTEM_VALUE
		  FROM SYSTEM_CONFIG_DETAIL
		 WHERE SYS_KEY = N'80' AND RECORD_TYPE = N'Technical';


	-- set default lang if no default language specified.
	if (@lang is null)
		set @lang=N'en-US'; 


select top 1 N'SCALAR' AS SCALAR,
(select TOP 1 Text from RESOURCE_FILE_BASE where RESOURCE_LANGUAGE=@lang and RESOURCE_GROUP=N'Text' and RESOURCE_KEY=REFERENCE_TYPE) as ReferenceType,
(select TOP 1 Text from RESOURCE_FILE_BASE where RESOURCE_LANGUAGE=@lang and RESOURCE_GROUP=N'Text' and RESOURCE_KEY=REFERENCE_CATEGORY) as ReferenceCategory,
REFERENCE_ID as ReferenceId
FROM DOCUMENT_MANAGEMENT
WHERE [OBJECT_ID] = @ObjectId

END





