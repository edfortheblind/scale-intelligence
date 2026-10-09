---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	152486	| DN	| 01/22/15	| Created
*/

CREATE PROCEDURE dbc_IMetadataTransactionForm(
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
	set @formKeyName = (N'MNU_' + @abbrevFormKeyName + N'TRANSACTION');
	
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
	set @path = (N'/scale/trans/' + lower(@abbrevFormKeyName));
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

------------------------------------------------------------------Security Check Point -----------------------------

exec dbc_ISecurityCheckpoint @formId = @formId, @checkPoint = 1, @resourceFileKey = N'RUN',@systemCreated = N'Y', @processStamp = @processStamp;
exec dbc_ISecurityCheckpoint @formId = @formId, @checkPoint = 3, @resourceFileKey = N'CHANGE',@systemCreated = N'Y', @processStamp = @processStamp;
----------------------------------------------------------------------------------------------