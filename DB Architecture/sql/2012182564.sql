-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
 


/* [comment omitted] */











CREATE PROCEDURE dbc_IForm(
	@formId numeric(5),
	@formKeyName nvarchar(50),
	@parentKeyName nvarchar(50),
	@tableName nvarchar(50),
	@usedByGenerator nchar(1),
	@securityActive nchar(1),
	@processStamp nvarchar(100),
	@systemDbScreen nvarchar(25) = N'<literal:1>',
	@objectIdentifier nvarchar(50) = NULL,
	@associatedFormKey nvarchar(50) = NULL	
)

AS
	SET NOCOUNT ON;

	INSERT INTO FORM 
		(FORM_ID, 
		 FORM_KEY_NAME, 
		 PARENT_KEY_NAME, 
		 TABLE_NAME, 
		 USED_BY_GENERATOR, 
		 SECURITY_ACTIVE, 
		 USER_STAMP, 
		 PROCESS_STAMP, 
		 DATE_TIME_STAMP,
		 SYSTEM_DB_SCREEN,
		 OBJECT_IDENTIFIER,
		 ASSOCIATED_FORM_KEY ) 
	SELECT @formId,
		   @formKeyName,
		   @parentKeyName,
		   @tableName,
		   @usedByGenerator,
		   @securityActive,
		   N'<literal:2>',
		   @processStamp,
		   getutcdate(),
		   @systemDbScreen,
		   @objectIdentifier,
		   @associatedFormKey
	 WHERE NOT EXISTS (SELECT * 
						 FROM FORM
						WHERE FORM_ID = @formId);
-- [comment omitted]




