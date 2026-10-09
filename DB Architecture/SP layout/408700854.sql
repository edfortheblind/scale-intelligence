


/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	12039		| RAB			| 07/01/03	| Created.
	224179		| SO			| 05/11/18  | Modified to pass current utc date for datetimestamp.

	Inserts a record for dbChange scripts.
*/
CREATE PROCEDURE dbc_ISecurityCheckpoint(
	@formId numeric(5),
	@checkPoint numeric(3),
	@resourceFileKey nvarchar(50),
	@systemCreated nchar(1) = N'Y',
	@processStamp nvarchar(100))

AS
	SET NOCOUNT ON;

	INSERT INTO SECURITY_CHECKPOINT 
		(FORM_ID, 
		 CHECK_POINT, 
		 RESOURCE_FILE_KEY, 
		 SYSTEM_CREATED, 
		 USER_STAMP, 
		 PROCESS_STAMP, 
		 DATE_TIME_STAMP) 
	SELECT @formId,
		   @checkPoint,
		   @resourceFileKey,
		   @systemCreated,
		   N'System',
		   @processStamp,
		   getutcdate()
	 WHERE NOT EXISTS (SELECT * 
						 FROM SECURITY_CHECKPOINT
						WHERE FORM_ID = @formId
						  AND CHECK_POINT = @checkPoint);
-- end dbc_ISecurityCheckpoint

