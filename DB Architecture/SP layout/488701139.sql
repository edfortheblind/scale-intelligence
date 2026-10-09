
/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	            | DBCGenerator  | 9/2/2005	| Created.
	224179		| SO			| 05/11/2018 | Modified to pass current utc date for datetimestamp.

	Inserts a record for dbChange scripts.
*/

CREATE PROCEDURE dbc_ISystemConfigDetail(
	@sysKey nvarchar(25),
	@description nvarchar(50),
	@systemValue nvarchar(200),
	@recordType nvarchar(25),
	@lookupKey nvarchar(50) = null,
	@systemCreated nchar(1) = N'Y',
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
		   N'System',
		   @processStamp,
		   getutcdate(),
		   @valueRequired
	 WHERE NOT EXISTS (SELECT * 
						 FROM SYSTEM_CONFIG_DETAIL
						WHERE SYS_KEY = @sysKey AND RECORD_TYPE = @recordType);
-- end dbc_ISystemConfigDetail
