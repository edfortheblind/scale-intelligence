/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	            | DBCGenerator  | 11/14/2003	| Created.

	Inserts a record for dbChange scripts.
*/
CREATE PROCEDURE dbc_IWarehouseAlert(
    @action nvarchar(25),
    @active nchar(1),
    @alertType nvarchar(25),
    @description nvarchar(50) = NULL,
    @emailTemplate nvarchar(500) = NULL,
    @message nvarchar(2000) = NULL,
    @priority numeric(3),
    @processStamp nvarchar(100),
    @title nvarchar(50) = NULL,
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(19,5) = NULL,
    @userDef8 numeric(19,5) = NULL,
    @webDescription nvarchar(50) = NULL)
AS
    SET NOCOUNT ON;

    INSERT INTO WAREHOUSE_ALERT
        (ACTION,
         ACTIVE,
         ALERT_TYPE,
         DATE_TIME_STAMP,
         DESCRIPTION,
         EMAIL_TEMPLATE,
         MESSAGE,
         PRIORITY,
         PROCESS_STAMP,
         SYSTEM_CREATED,
         TITLE,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP,
         WEB_DESCRIPTION)
    SELECT @action,
           @active,
           @alertType,
           GETUTCDATE(),
           @description,
           @emailTemplate,
           @message,
           @priority,
           @processStamp,
           N'Y',
           @title,
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'System',
           @webDescription
     WHERE NOT EXISTS(SELECT *
                        FROM WAREHOUSE_ALERT
                       WHERE ALERT_TYPE = @alertType
                         AND ACTION = @action
                         AND DESCRIPTION = @description);
-- end dbc_IWarehouseAlert