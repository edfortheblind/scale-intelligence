-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE dbc_IGenericConfigDetail(
	@recordType nvarchar(50),
	@identifier nvarchar(50),
	@description nvarchar(500),
	@systemCreated nchar(1) = N'<literal:1>',
	@sys1Value nvarchar(250) = null,
	@sys2Value nvarchar(250) = null,
	@sys3Value nvarchar(250) = null,
	@sys4Value nvarchar(250) = null,
	@sys5Value nvarchar(250) = null,
	@user1Value nvarchar(250) = null,
	@user2Value nvarchar(250) = null,
	@user3Value nvarchar(250) = null,
	@user4Value nvarchar(250) = null,
	@user5Value nvarchar(250) = null,
	@user6Value nvarchar(250) = null,
	@user7Value nvarchar(250) = null,
	@user8Value nvarchar(250) = null,
	@active nchar(1),
	@processStamp nvarchar(100))
AS
BEGIN  
 SET NOCOUNT ON;  
  
  IF EXISTS (SELECT 1  
               FROM GENERIC_CONFIG_DETAIL  
               WHERE RECORD_TYPE = @recordType  
                 AND IDENTIFIER  = @identifier)
    BEGIN
        UPDATE GENERIC_CONFIG_DETAIL
        SET DESCRIPTION      = @description,
            SYSTEM_CREATED   = @systemCreated,
            SYS1VALUE        = @sys1Value,
            SYS2VALUE        = @sys2Value,
            SYS3VALUE        = @sys3Value,
            SYS4VALUE        = @sys4Value,
            SYS5VALUE        = @sys5Value,
            USER1VALUE       = @user1Value,
            USER2VALUE       = @user2Value,
            USER3VALUE       = @user3Value,
            USER4VALUE       = @user4Value,
            USER5VALUE       = @user5Value,
            USER6VALUE       = @user6Value,
            USER7VALUE       = @user7Value,
            USER8VALUE       = @user8Value,
            ACTIVE           = @active,
            USER_STAMP       = N'<literal:2>',
            PROCESS_STAMP    = @processStamp,
            DATE_TIME_STAMP  = GETUTCDATE()
        WHERE RECORD_TYPE = @recordType
          AND IDENTIFIER  = @identifier;
    END
    ELSE
    BEGIN
	INSERT INTO GENERIC_CONFIG_DETAIL
		(RECORD_TYPE,
		 IDENTIFIER,
		 DESCRIPTION,
		 SYSTEM_CREATED,
		 SYS1VALUE,
		 SYS2VALUE,
		 SYS3VALUE,
		 SYS4VALUE,
		 SYS5VALUE,
		 USER1VALUE,
		 USER2VALUE,
		 USER3VALUE,
		 USER4VALUE,
		 USER5VALUE,
		 USER6VALUE,
		 USER7VALUE,
		 USER8VALUE,
		 ACTIVE,
		 USER_STAMP,
		 PROCESS_STAMP,
		 DATE_TIME_STAMP)
	VALUES( @recordType,
		   @identifier,
		   @description,
		   @systemCreated,
		   @sys1Value,
		   @sys2Value,
		   @sys3Value,
		   @sys4Value,
		   @sys5Value,
		   @user1Value,
		   @user2Value,
		   @user3Value,
		   @user4Value,
		   @user5Value,
		   @user6Value,
		   @user7Value,
		   @user8Value,
		   @active,
		   N'<literal:3>',
		   @processStamp,
		   GETUTCDATE())
	  END
	 END
-- [comment omitted]
