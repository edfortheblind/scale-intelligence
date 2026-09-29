-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */











CREATE PROCEDURE dbc_IViewerForm(
	@formId numeric(5),
	@formKeyName nvarchar(50),
	@helpText nvarchar(2000),
	@tableName nvarchar(50) = NULL,
	@text nvarchar(2000),
	@processStamp nvarchar(100),
	@functionalArea nvarchar(50),
	@menuResourceKey nvarchar(50),
	@menuResourceKeyText nvarchar(2000),
	@menuResourceKeyMneumonic nvarchar(50),
	@menuResourceKeyMneumonicText nvarchar(2000),
	@objectIdentifier nvarchar(50) = NULL,
	@detailDataSource nvarchar(50) = NULL,
	@detailField nvarchar(50) = NULL,
	@headerField nvarchar(50) = NULL)

AS
	SET NOCOUNT ON;
	
	exec dbc_IForm
		@formId = @formId,
		@formKeyName = @formKeyName,
		@parentKeyName = NULL,
		@tableName = @tableName,
		@usedByGenerator = N'<literal:1>',
		@securityActive = N'<literal:2>',
		@processStamp = @processStamp;

	exec dbc_IViewerTemplate
		@headerDataSource = @tableName,
		@detailDataSource = @detailDataSource,
		@engineType = 0,
		@detailField = @detailField,
		@headerField = @headerField,
		@formId = @formId,
		@processStamp = @processStamp;
		
	exec dbc_IResourceFileBase
		@resourceGroup = N'<literal:3>',
		@resourceKey = @formKeyName,
		@text = @text,
		@processStamp = @processStamp;

	exec dbc_IResourceFileBase
		@resourceGroup = N'<literal:4>',
		@resourceKey = @formKeyName,
		@text = @helpText,
		@processStamp = @processStamp;

	exec dbc_ISecurityCheckpoint
		@formId = @formId,
		@checkPoint = 1,
		@resourceFileKey = N'<literal:5>',
		@processStamp = @processStamp;

	exec dbc_ISecurityCheckpoint
		@formId = @formId,
		@checkPoint = 21,
		@resourceFileKey = N'<literal:6>',
		@processStamp = @processStamp;

	exec dbc_ISecurityCheckpoint
		@formId = @formId,
		@checkPoint = 22,
		@resourceFileKey = N'<literal:7>',
		@processStamp = @processStamp;

	exec dbc_IMainUiScreen
		@active = N'<literal:8>',
		@assemblyName = N'<literal:9>',
		@className = N'<literal:10>',
		@formId = @formId,
		@functionalArea = @functionalArea,
		@menuResourceKey = @menuResourceKeyMneumonic,
		@namespace = N'<literal:11>',
		@processStamp = @processStamp,
		@objectIdentifier = @objectIdentifier;

	exec dbc_IResourceFileBase
		@resourceGroup = N'<literal:12>',
		@resourceKey = @menuResourceKey,
		@text = @menuResourceKeyText,
		@processStamp = @processStamp;

	exec dbc_IResourceFileBase
		@resourceGroup = N'<literal:13>',
		@resourceKey = @menuResourceKeyMneumonic,
		@text = @menuResourceKeyMneumonicText,
		@processStamp = @processStamp;

-- [comment omitted]