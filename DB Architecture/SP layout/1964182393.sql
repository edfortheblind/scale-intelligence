/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	101019      | DBCGenerator  | 7/4/2012	| Created.
	224179		| SO			| 05/11/2018| Modified to pass current utc date for datetimestamp.

	Inserts a record for dbChange scripts.
*/
CREATE PROCEDURE dbc_IExitPointDetail(
    @dbType nvarchar(25),
    @exitPoint nvarchar(500),
    @isOutput nchar(1),
    @parameter nvarchar(50),
    @processStamp nvarchar(200),
    @sequence numeric(3),
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(14,5) = NULL,
    @userDef8 numeric(14,5) = NULL)
AS
    SET NOCOUNT ON;

    INSERT INTO EXIT_POINT_DETAIL
        (DATE_TIME_STAMP,
         DB_TYPE,
         EXIT_POINT,
         IS_OUTPUT,
         PARAMETER,
         PROCESS_STAMP,
         SEQUENCE,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP)
    SELECT getutcdate(),
           @dbType,
           @exitPoint,
           @isOutput,
           @parameter,
           @processStamp,
           @sequence,
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'System'
     WHERE NOT EXISTS(SELECT *
                        FROM EXIT_POINT_DETAIL
                       WHERE EXIT_POINT = @exitPoint and SEQUENCE = @sequence);
-- end dbc_IExitPointDetail