
/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	  16652     | RLG           | 4/27/2005  | Created.
	  17605	    | SKM	    | 10/04/03	 | systemDbScreen parameter added.
	  5582		| SMF			| 07/18/07	 | Added XamlFileName
	  11561		| SMF			| 10/15/07	 | Changed XamlFileName to ObjectIdentifier

           
         Inserts records for dbChange scripts.	
*/


CREATE PROCEDURE dbc_IProcessForm(
       @formId numeric(4),
       @formKeyName nvarchar(50),
       @parentKeyName nvarchar(50) = NULL,
       @helpText nvarchar(2000),
       @text nvarchar(2000),
       @processStamp nvarchar(100),
       @systemDbScreen nvarchar(25) = N'N',
       @objectIdentifier nvarchar(50))

AS
	SET NOCOUNT ON;

     exec dbc_IForm
           @formId = @formId,
           @formKeyName = @formKeyName,
           @parentKeyName = @parentKeyName,
           @tableName = null,
           @usedByGenerator = N'N',
           @securityActive = N'Y',
           @processStamp = @processStamp,
	   @systemDbScreen = @systemDbScreen,
		   @objectIdentifier = @objectIdentifier;

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


-- end dbc_IProcessForm




