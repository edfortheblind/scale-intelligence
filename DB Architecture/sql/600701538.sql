-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
-- [comment omitted]
CREATE PROCEDURE DM_InsightDetailPaneData(@ObjectId numeric(9), @culture nvarchar(10))  
AS 
BEGIN

	-- [comment omitted]
	declare @lang nvarchar(25);

	-- [comment omitted]
		SELECT @lang = SYSTEM_VALUE
		  FROM SYSTEM_CONFIG_DETAIL
		 WHERE SYS_KEY = N'<literal:1>' AND RECORD_TYPE = N'<literal:2>';


	-- [comment omitted]
	if (@lang is null)
		set @lang=N'<literal:3>'; 


select top 1 N'<literal:4>' AS SCALAR,
(select TOP 1 Text from RESOURCE_FILE_BASE where RESOURCE_LANGUAGE=@lang and RESOURCE_GROUP=N'<literal:5>' and RESOURCE_KEY=REFERENCE_TYPE) as ReferenceType,
(select TOP 1 Text from RESOURCE_FILE_BASE where RESOURCE_LANGUAGE=@lang and RESOURCE_GROUP=N'<literal:6>' and RESOURCE_KEY=REFERENCE_CATEGORY) as ReferenceCategory,
REFERENCE_ID as ReferenceId
FROM DOCUMENT_MANAGEMENT
WHERE [OBJECT_ID] = @ObjectId

END





