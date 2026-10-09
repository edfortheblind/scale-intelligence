/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	145236	| RJR	| 08/07/14	| Created
    145972  | SHS   | 09/24/14  | Modified to handle restrictions
	151124	| MMM	| 01/05/14	| Added "Defaults Id"
*/

CREATE PROCEDURE dbc_IMetadataDetailsForm(
	@formId numeric(5),
	@abbrevFormKeyName nvarchar(50),
	@helpText nvarchar(2000),
	@tableName nvarchar(50) = NULL,
	@text nvarchar(2000),
	@processStamp nvarchar(100),
	@functionalArea nvarchar(50),
	@menuResourceKey nvarchar(50),
	@menuResourceKeyText nvarchar(2000),
	@objectIdentifier nvarchar(50) = NULL,
	@showInAppMenu nchar(1) = N'N',
    @restrictionsId nvarchar(100) = NULL, 
	@defaultsId nvarchar(100) = NULL)

AS
	SET NOCOUNT ON;

	declare @formKeyName nvarchar(50);
	set @formKeyName = (N'MNU_' + @abbrevFormKeyName + N'DETAILS');
	
	exec dbc_IForm
		@formId = @formId,
		@formKeyName = @formKeyName,
		@parentKeyName = NULL,
		@tableName = @tableName,
		@usedByGenerator = N'N',
		@securityActive = N'Y',
		@processStamp = @processStamp;
		
	exec dbc_IResourceFileBase
		@resourceGroup = N'Text',
		@resourceKey = @formKeyName,
		@text = @text,
		@processStamp = @processStamp;

	exec dbc_IResourceFileBase
		@resourceGroup = N'Help',
		@resourceKey = @formKeyName,
		@text = @helpText,
		@processStamp = @processStamp;

	exec dbc_ISecurityCheckpoint
		@formId = @formId,
		@checkPoint = 1,
		@resourceFileKey = N'RUN',
		@processStamp = @processStamp;

	declare @path nvarchar(250);
	set @path = (N'/scale/details/' + lower(@abbrevFormKeyName));
	exec dbc_IMainUiScreen
		@active = N'Y',
		@path = @path,
		@pathType = 6, 
		@assemblyName = NULL, 
		@className = NULL, 
		@namespace = NULL, 
		@formId = @formId,
		@functionalArea = @functionalArea,
		@menuResourceKey = @menuResourceKey,
		@processStamp = @processStamp,
		@objectIdentifier = @objectIdentifier, 
		@showInAppMenu = @showInAppMenu,
        @restrictionsId = @restrictionsId, 
		@defaultsId = @defaultsId;

	exec dbc_IResourceFileBase
		@resourceGroup = N'Text',
		@resourceKey = @menuResourceKey,
		@text = @menuResourceKeyText,
		@processStamp = @processStamp;

	exec dbc_IResourceFileBase
		@resourceGroup = N'Text',
		@resourceKey = @menuResourceKey,
		@text = @menuResourceKeyText,
		@processStamp = @processStamp;

-- end dbc_IMetadataDetailsForm