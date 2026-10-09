/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	12039		| RAB			| 07/01/03	| Created.

	Inserts a record for dbChange scripts.
*/
CREATE PROCEDURE dbc_ISystemConfigHeader(
	@recordType nvarchar(25),
	@description nvarchar(50),
	@systemCreated nchar(1) = N'Y',
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
		   N'System',
		   @processStamp,
		   GETUTCDATE()
	 WHERE NOT EXISTS (SELECT * 
						 FROM SYSTEM_CONFIG_HEADER
						WHERE RECORD_TYPE = @recordType);
-- end dbc_ISystemConfigHeader
