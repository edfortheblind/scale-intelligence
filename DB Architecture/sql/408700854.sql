-- DOCUMENTATION ONLY: literals/comments removed; do not execute.



/* [comment omitted] */







CREATE PROCEDURE dbc_ISecurityCheckpoint(
	@formId numeric(5),
	@checkPoint numeric(3),
	@resourceFileKey nvarchar(50),
	@systemCreated nchar(1) = N'<literal:1>',
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
		   N'<literal:2>',
		   @processStamp,
		   getutcdate()
	 WHERE NOT EXISTS (SELECT * 
						 FROM SECURITY_CHECKPOINT
						WHERE FORM_ID = @formId
						  AND CHECK_POINT = @checkPoint);
-- [comment omitted]

