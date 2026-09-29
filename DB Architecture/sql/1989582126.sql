-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
-- [comment omitted]
/* [comment omitted] */





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
	@showInAppMenu nchar(1) = N'<literal:1>',
    @restrictionsId nvarchar(100) = NULL, 
	@defaultsId nvarchar(100) = NULL)

AS
	SET NOCOUNT ON;

	declare @formKeyName nvarchar(50);
	set @formKeyName = (N'<literal:2>' + @abbrevFormKeyName + N'<literal:3>');
	
	exec dbc_IForm
		@formId = @formId,
		@formKeyName = @formKeyName,
		@parentKeyName = NULL,
		@tableName = @tableName,
		@usedByGenerator = N'<literal:4>',
		@securityActive = N'<literal:5>',
		@processStamp = @processStamp;
		
	exec dbc_IResourceFileBase
		@resourceGroup = N'<literal:6>',
		@resourceKey = @formKeyName,
		@text = @text,
		@processStamp = @processStamp;

	exec dbc_IResourceFileBase
		@resourceGroup = N'<literal:7>',
		@resourceKey = @formKeyName,
		@text = @helpText,
		@processStamp = @processStamp;

	exec dbc_ISecurityCheckpoint
		@formId = @formId,
		@checkPoint = 1,
		@resourceFileKey = N'<literal:8>',
		@processStamp = @processStamp;

	declare @path nvarchar(250);
	set @path = (N'<literal:9>' + lower(@abbrevFormKeyName));
	exec dbc_IMainUiScreen
		@active = N'<literal:10>',
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
		@resourceGroup = N'<literal:11>',
		@resourceKey = @menuResourceKey,
		@text = @menuResourceKeyText,
		@processStamp = @processStamp;

	exec dbc_IResourceFileBase
		@resourceGroup = N'<literal:12>',
		@resourceKey = @menuResourceKey,
		@text = @menuResourceKeyText,
		@processStamp = @processStamp;

-- [comment omitted]

exec dbc_ISecurityCheckpoint @formId = @formId, @checkPoint = 1, @resourceFileKey = N'<literal:13>',@systemCreated = N'<literal:14>', @processStamp = @processStamp;
exec dbc_ISecurityCheckpoint @formId = @formId, @checkPoint = 3, @resourceFileKey = N'<literal:15>',@systemCreated = N'<literal:16>', @processStamp = @processStamp;
-- [comment omitted]