/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	16708		| MAG		| 06/09/05	| Created.
	19176		| BTA		| 2/13/08	| Fixed Oracle portion to include dbc_IViewerTemplate 
			|		|		| and MAIN_UI_SCREEN to have objectIdentifier parameter.
	55745		| TDA		| 08/10/09	| Removed Image Resource Key			
	108685		| JY		| 03/06/13	| Added detailField and headerField fields for IViewerTemplate

	Inserts records for dbChange scripts.
*/

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
		@usedByGenerator = N'N',
		@securityActive = N'Y',
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

	exec dbc_ISecurityCheckpoint
		@formId = @formId,
		@checkPoint = 21,
		@resourceFileKey = N'CUSTOMIZE',
		@processStamp = @processStamp;

	exec dbc_ISecurityCheckpoint
		@formId = @formId,
		@checkPoint = 22,
		@resourceFileKey = N'RESTORETODEFAULT',
		@processStamp = @processStamp;

	exec dbc_IMainUiScreen
		@active = N'Y',
		@assemblyName = N'WMW.General.UI',
		@className = N'ViewerBuilder',
		@formId = @formId,
		@functionalArea = @functionalArea,
		@menuResourceKey = @menuResourceKeyMneumonic,
		@namespace = N'Manh.WMFW.General.UI',
		@processStamp = @processStamp,
		@objectIdentifier = @objectIdentifier;

	exec dbc_IResourceFileBase
		@resourceGroup = N'Text',
		@resourceKey = @menuResourceKey,
		@text = @menuResourceKeyText,
		@processStamp = @processStamp;

	exec dbc_IResourceFileBase
		@resourceGroup = N'Text',
		@resourceKey = @menuResourceKeyMneumonic,
		@text = @menuResourceKeyMneumonicText,
		@processStamp = @processStamp;

-- end dbc_IViewerForm