-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE dbc_ISystemConfigHeader(
	@recordType nvarchar(25),
	@description nvarchar(50),
	@systemCreated nchar(1) = N'<literal:1>',
	@processStamp nvarchar(100))

AS
	SET NOCOUNT ON;

	INSERT INTO SYSTEM_CONFIG_HEADER 
		(RECORD_TYPE, 
		 DESCRIPTION, 
		 SYSTEM_CREATED, 
		 USER_STAMP, 
		 PROCESS_STAMP, 
		 DATE_TIME_STAMP) 
	SELECT @recordType,
		   @description,
		   @systemCreated,
		   N'<literal:2>',
		   @processStamp,
		   GETUTCDATE()
	 WHERE NOT EXISTS (SELECT * 
						 FROM SYSTEM_CONFIG_HEADER
						WHERE RECORD_TYPE = @recordType);
-- [comment omitted]
