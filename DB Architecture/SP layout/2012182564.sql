 


/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	12039		| RAB			| 07/01/03	| Created.
	17605		| SKM			| 10/04/03	| systemDbScreen parameter added.
	5582		| SMF			| 07/18/07	| Added XamlFileName
	11561		| SMF			| 10/15/07	| Changed XamlFileName to ObjectIdentifier
	163515		| MJ			| 08/07/15	| Added ASSOCIATED_FORM_KEY
	224179		| SO			| 05/11/2018 | Modified to pass current utc date for datetimestamp.

	Inserts a record for dbChange scripts.
*/
CREATE PROCEDURE dbc_IForm(
	@formId numeric(5),
	@formKeyName nvarchar(50),
	@parentKeyName nvarchar(50),
	@tableName nvarchar(50),
	@usedByGenerator nchar(1),
	@securityActive nchar(1),
	@processStamp nvarchar(100),
	@systemDbScreen nvarchar(25) = N'N',
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
		   N'System',
		   @processStamp,
		   getutcdate(),
		   @systemDbScreen,
		   @objectIdentifier,
		   @associatedFormKey
	 WHERE NOT EXISTS (SELECT * 
						 FROM FORM
						WHERE FORM_ID = @formId);
-- end dbc_IForm




