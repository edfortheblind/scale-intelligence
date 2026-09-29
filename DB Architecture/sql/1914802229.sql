-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE dbc_IConfigForm(
	@formId numeric(5),
	@formKeyName nvarchar(50),
	@helpText nvarchar(2000),
	@parentKeyName nvarchar(50),
	@systemCreated nchar(1) = N'<literal:1>',
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
		@securityActive = N'<literal:2>',
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
		@checkPoint = 2,
		@resourceFileKey = N'<literal:6>',
		@processStamp = @processStamp;

	exec dbc_ISecurityCheckpoint
		@formId = @formId,
		@checkPoint = 3,
		@resourceFileKey = N'<literal:7>',
		@processStamp = @processStamp;

	exec dbc_ISecurityCheckpoint
		@formId = @formId,
		@checkPoint = 4,
		@resourceFileKey = N'<literal:8>',
		@processStamp = @processStamp;

	exec dbc_ISecurityCheckpoint    
		@formId = @formId,
		@checkPoint = 5,
		@resourceFileKey = N'<literal:9>',
		@processStamp = @processStamp;

	exec dbc_ISecurityCheckpoint
		@formId = @formId,
		@checkPoint = 6,
		@resourceFileKey = N'<literal:10>',
		@processStamp = @processStamp;
-- [comment omitted]
