/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	17026		| SP		| 09/21/05	| Created.

	Inserts records needed for a new Generic Config Detail screen
*/





CREATE PROCEDURE dbc_IGenericConfigForm(
	@formId numeric(5),
	@formKeyName nvarchar(50),
	@helpResourceKey nvarchar(50),
	@helpText nvarchar(2000),
	@parentKeyName nvarchar(50),
	@systemCreated nchar(1) = N'Y',
	@tableName nvarchar(50) = NULL,
	@text nvarchar(2000),
	@usedByGenerator nchar(1),
	@processStamp nvarchar(100))

AS
	SET NOCOUNT ON;
	
	exec dbc_IForm
		@formId = @formId,
		@formKeyName = @formKeyName,
		@parentKeyName = @parentKeyName,
		@tableName = @tableName,
		@usedByGenerator = @usedByGenerator,
		@securityActive = N'Y',
		@processStamp = @processStamp;

	exec dbc_IResourceFileBase
		@resourceGroup = N'Text',
		@resourceKey = @formKeyName,
		@text = @text,
		@processStamp = @processStamp;

	exec dbc_IResourceFileBase
		@resourceGroup = N'Help',
		@resourceKey = @helpResourceKey,
		@text = @helpText,
		@processStamp = @processStamp;

	exec dbc_ISecurityCheckpoint
		@formId = @formId,
		@checkPoint = 1,
		@resourceFileKey = N'RUN',
		@processStamp = @processStamp;

	exec dbc_ISecurityCheckpoint
		@formId = @formId,
		@checkPoint = 2,
		@resourceFileKey = N'NEW',
		@processStamp = @processStamp;

	exec dbc_ISecurityCheckpoint
		@formId = @formId,
		@checkPoint = 3,
		@resourceFileKey = N'CHANGE',
		@processStamp = @processStamp;

	exec dbc_ISecurityCheckpoint
		@formId = @formId,
		@checkPoint = 4,
		@resourceFileKey = N'COPY',
		@processStamp = @processStamp;

	exec dbc_ISecurityCheckpoint    
		@formId = @formId,
		@checkPoint = 5,
		@resourceFileKey = N'DELETE',
		@processStamp = @processStamp;

	exec dbc_ISecurityCheckpoint
		@formId = @formId,
		@checkPoint = 6,
		@resourceFileKey = N'DISPLAY',
		@processStamp = @processStamp;

-- end dbc_IGenericConfigForm