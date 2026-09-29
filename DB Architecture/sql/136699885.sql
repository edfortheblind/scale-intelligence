-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */












CREATE PROCEDURE dbc_IProcessForm(
       @formId numeric(4),
       @formKeyName nvarchar(50),
       @parentKeyName nvarchar(50) = NULL,
       @helpText nvarchar(2000),
       @text nvarchar(2000),
       @processStamp nvarchar(100),
       @systemDbScreen nvarchar(25) = N'<literal:1>',
       @objectIdentifier nvarchar(50))

AS
	SET NOCOUNT ON;

     exec dbc_IForm
           @formId = @formId,
           @formKeyName = @formKeyName,
           @parentKeyName = @parentKeyName,
           @tableName = null,
           @usedByGenerator = N'<literal:2>',
           @securityActive = N'<literal:3>',
           @processStamp = @processStamp,
	   @systemDbScreen = @systemDbScreen,
		   @objectIdentifier = @objectIdentifier;

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


-- [comment omitted]




