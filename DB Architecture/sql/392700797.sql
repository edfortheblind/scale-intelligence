-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE dbc_ISecurity(
    @formId numeric(5),
    @processStamp nvarchar(100),
    @secValues nvarchar(64),
    @securityLevel nvarchar(10),
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(19,5) = NULL,
    @userDef8 numeric(19,5) = NULL,
    @userName nvarchar(30),
    @securityGroupId numeric(9) = NULL)
AS
    SET NOCOUNT ON;
	
	declare @securityGroup  Numeric(9,0);
	
    IF(@securityGroupId IS NULL)
		BEGIN 
	  		SET @securityGroup = (SELECT OBJECT_ID FROM SECURITY_GROUP WHERE SECURITY_GROUP = @userName); 
		END
	ELSE
		BEGIN 
			SET @securityGroup = @securityGroupId;
		END 
	
	INSERT INTO SECURITY
        (DATE_TIME_STAMP,
         FORM_ID,
         PROCESS_STAMP,
         SEC_VALUES,
         SECURITY_LEVEL,
         SYSTEM_CREATED,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_NAME,
         USER_STAMP,
         SECURITY_GROUP_ID)
    SELECT getutcdate(),
           @formId,
           @processStamp,
           @secValues,
           @securityLevel,
           N'<literal:1>',
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           @userName,
           N'<literal:2>',
          @securityGroup
     WHERE NOT EXISTS(SELECT *
                        FROM SECURITY
                       WHERE FORM_ID = @formId
                         AND SECURITY_LEVEL = @securityLevel
                         AND USER_NAME = @userName);
-- [comment omitted]

