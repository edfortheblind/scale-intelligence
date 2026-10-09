/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	            | DBCGenerator  | 11/8/2004	| Created.
	224179		| SO			| 05/11/2018 | Modified to pass current utc date for datetimestamp.

	Inserts a record for dbChange scripts.
*/

CREATE PROCEDURE dbc_IInterfaceDataMapDetail(
    @fieldLength numeric(9),
    @fieldName nvarchar(35),
    @mapName nvarchar(25),
    @position numeric(5),
    @processStamp nvarchar(100),
    @userDef1 nvarchar(25),
    @userDef2 nvarchar(25),
    @userDef3 nvarchar(25),
    @userDef4 nvarchar(25),
    @userDef5 nvarchar(25),
    @userDef6 nvarchar(25),
    @userDef7 numeric(19,5),
    @userDef8 numeric(19,5))
AS
    SET NOCOUNT ON;

    INSERT INTO INTERFACE_DATA_MAP_DETAIL
        (DATE_TIME_STAMP,
         FIELD_LENGTH,
         FIELD_NAME,
         MAP_NAME,
         POSITION,
         PROCESS_STAMP,
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
           @fieldLength,
           @fieldName,
           @mapName,
           @position,
           @processStamp,
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
                        FROM INTERFACE_DATA_MAP_DETAIL
                       WHERE MAP_NAME = @mapName
                         AND POSITION = @position);
-- end dbc_IInterfaceDataMapDetail