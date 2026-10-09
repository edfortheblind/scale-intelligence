/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	131874	| RJR	| 10/18/13	| Created

*/

CREATE PROCEDURE dbc_IMetadataInsightForm(
	@formId numeric(5),
	@formKeyName nvarchar(50),
	@helpText nvarchar(2000),
	@tableName nvarchar(50) = NULL,
	@text nvarchar(2000),
	@processStamp nvarchar(100),
	@functionalArea nvarchar(50),
	@menuResourceKey nvarchar(50),
	@menuResourceKeyText nvarchar(2000),
	@objectIdentifier nvarchar(50) = NULL,
	@showInAppMenu nchar(1) = N'Y')

AS
	SET NOCOUNT ON;
	
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
	set @path = (N'/scale/insights/' + cast(@formId as nvarchar));
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
		@showInAppMenu = @showInAppMenu;

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

-- end dbc_IMetadataInsightForm