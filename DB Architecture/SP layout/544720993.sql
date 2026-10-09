
/*
Mod Number  | Programmer    | Date             | Modification Description
----------------------------------------------------------------------------------------------
54323	       | PP                      | 7/10/2009 | Created.
224179		   | SO			             | 5/11/2018| Modified to pass current utc date for datetimestamp.

Inserts a record for dbChange scripts.
*/
CREATE PROCEDURE [dbc_ISecurityGroup](
    @active nchar(1) = N'Y',
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
           N'System'
     WHERE NOT EXISTS(SELECT *
                        FROM SECURITY_GROUP
                       WHERE SECURITY_GROUP = @securityGroup);

-- end dbc_ISecurityGroup


