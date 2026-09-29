-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






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
	@showInAppMenu nchar(1) = N'<literal:1>')

AS
	SET NOCOUNT ON;
	
	exec dbc_IForm
		@formId = @formId,
		@formKeyName = @formKeyName,
		@parentKeyName = NULL,
		@tableName = @tableName,
		@usedByGenerator = N'<literal:2>',
		@securityActive = N'<literal:3>',
		@processStamp = @processStamp;
		
	exec dbc_IResourceFileBase
		@resourceGroup = N'<literal:4>',
		@resourceKey = @formKeyName,
		@text = @text,
		@processStamp = @processStamp;

	exec dbc_IResourceFileBase
		@resourceGroup = N'<literal:5>',
		@resourceKey = @formKeyName,
		@text = @helpText,
		@processStamp = @processStamp;

	exec dbc_ISecurityCheckpoint
		@formId = @formId,
		@checkPoint = 1,
		@resourceFileKey = N'<literal:6>',
		@processStamp = @processStamp;

	declare @path nvarchar(250);
	set @path = (N'<literal:7>' + cast(@formId as nvarchar));
	exec dbc_IMainUiScreen
		@active = N'<literal:8>',
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
		@resourceGroup = N'<literal:9>',
		@resourceKey = @menuResourceKey,
		@text = @menuResourceKeyText,
		@processStamp = @processStamp;

	exec dbc_IResourceFileBase
		@resourceGroup = N'<literal:10>',
		@resourceKey = @menuResourceKey,
		@text = @menuResourceKeyText,
		@processStamp = @processStamp;

-- [comment omitted]