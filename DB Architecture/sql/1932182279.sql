-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE dbc_IDynamicCallingHeader(
	@recordType nvarchar(10),
	@description nvarchar(50),
	@systemCreated nchar(1) = N'<literal:1>',
	@processStamp nvarchar(100),
	@supportedEndpointTypes numeric(3) )

AS
	SET NOCOUNT ON;

	INSERT INTO DYNAMIC_CALLING_HEADER
		(RECORD_TYPE,
		 DESCRIPTION,
		 SYSTEM_CREATED,
		 USER_STAMP,
		 PROCESS_STAMP,
		 DATE_TIME_STAMP,
		 SUPPORTED_ENDPOINT_TYPES)		 
	SELECT @recordType,
		   @description,
		   @systemCreated,
		   N'<literal:2>',
		   @processStamp,
		   getutcdate(),
		   @supportedEndpointTypes
	 WHERE NOT EXISTS (SELECT * 
						 FROM DYNAMIC_CALLING_HEADER
						WHERE RECORD_TYPE = @recordType);
-- [comment omitted]
