-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE dbc_IWarehouseAlertType(
    @alertType nvarchar(25),
    @allowMultipleAlerts nchar(1),
    @defaultAction nvarchar(25) = NULL,
    @defaultPriority numeric(3) = NULL,
    @defaultTemplate nvarchar(500) = NULL,
    @description nvarchar(50),
    @dynamicCallingIdentifier nvarchar(25) = NULL,
    @emailNotificationTitle nvarchar(50) = NULL,
    @processStamp nvarchar(100),
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

    INSERT INTO WAREHOUSE_ALERT_TYPE
        (ALERT_TYPE,
         ALLOW_MULTIPLE_ALERTS,
         DATE_TIME_STAMP,
         DEFAULT_ACTION,
         DEFAULT_PRIORITY,
         DEFAULT_TEMPLATE,
         DESCRIPTION,
         DYNAMIC_CALLING_IDENTIFIER,
         EMAIL_NOTIFICATION_TITLE,
         PROCESS_STAMP,
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
    SELECT @alertType,
           @allowMultipleAlerts,
           GETUTCDATE(),
           @defaultAction,
           @defaultPriority,
           @defaultTemplate,
           @description,
           @dynamicCallingIdentifier,
           @emailNotificationTitle,
           @processStamp,
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'<literal:1>',
           @webDescription
     WHERE NOT EXISTS(SELECT *
                        FROM WAREHOUSE_ALERT_TYPE
                       WHERE ALERT_TYPE = @alertType);
-- [comment omitted]