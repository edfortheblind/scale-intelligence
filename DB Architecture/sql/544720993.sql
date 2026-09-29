-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */







CREATE PROCEDURE [dbc_ISecurityGroup](
    @active nchar(1) = N'<literal:1>',
    @description nvarchar(50),
    @processStamp nvarchar(100),
    @securityGroup nvarchar(50))
AS
    SET NOCOUNT ON;

    INSERT INTO SECURITY_GROUP
        (ACTIVE,
         DATE_TIME_STAMP,
         DESCRIPTION,
         PROCESS_STAMP,
         SECURITY_GROUP,
         USER_STAMP)
    SELECT @active,
           getutcdate(),
           @description,
           @processStamp,
           @securityGroup,           
           N'<literal:2>'
     WHERE NOT EXISTS(SELECT *
                        FROM SECURITY_GROUP
                       WHERE SECURITY_GROUP = @securityGroup);

-- [comment omitted]


