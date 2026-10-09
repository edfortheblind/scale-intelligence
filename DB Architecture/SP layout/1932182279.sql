/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	12698		| TDL			| 10/16/03	| Created.
	224179		| SO			| 05/11/2018| Modified to pass current utc date for datetimestamp.

	Inserts a record for dbChange scripts.
*/
CREATE PROCEDURE dbc_IDynamicCallingHeader(
	@recordType nvarchar(10),
	@description nvarchar(50),
	@systemCreated nchar(1) = N'Y',
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
		   N'System',
		   @processStamp,
		   getutcdate(),
		   @supportedEndpointTypes
	 WHERE NOT EXISTS (SELECT * 
						 FROM DYNAMIC_CALLING_HEADER
						WHERE RECORD_TYPE = @recordType);
-- end dbc_IDynamicCallingHeader
