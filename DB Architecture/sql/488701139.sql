-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */








CREATE PROCEDURE dbc_ISystemConfigDetail(
	@sysKey nvarchar(25),
	@description nvarchar(50),
	@systemValue nvarchar(200),
	@recordType nvarchar(25),
	@lookupKey nvarchar(50) = null,
	@systemCreated nchar(1) = N'<literal:1>',
	@processStamp nvarchar(100),
	@valueRequired nchar(1))

AS
	SET NOCOUNT ON;

	INSERT INTO SYSTEM_CONFIG_DETAIL 
		(SYS_KEY, 
		 DESCRIPTION, 
		 SYSTEM_VALUE, 
		 RECORD_TYPE, 
		 LOOKUP_KEY,
		 SYSTEM_CREATED, 
		 USER_STAMP, 
		 PROCESS_STAMP, 
		 DATE_TIME_STAMP, 
		 VALUE_REQUIRED) 
	SELECT @sysKey,
		   @description,
		   @systemValue,
		   @recordType,
		   @lookupKey,
		   @systemCreated,
		   N'<literal:2>',
		   @processStamp,
		   getutcdate(),
		   @valueRequired
	 WHERE NOT EXISTS (SELECT * 
						 FROM SYSTEM_CONFIG_DETAIL
						WHERE SYS_KEY = @sysKey AND RECORD_TYPE = @recordType);
-- [comment omitted]
