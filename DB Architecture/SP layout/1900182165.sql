/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	74631       | DBCGenerator  | 9/2/2010	| Created.
	224179		| SO			| 05/11/2018| Modified to pass current utc date for datetimestamp.

	Inserts a record for dbChange scripts.
*/
CREATE PROCEDURE dbc_IDynamicActionRule(
    @actionName nvarchar(50),
    @andOr nvarchar(3),
    @columnName nvarchar(100),
    @literalValue nvarchar(200),
    @operand nvarchar(15),
    @processStamp nvarchar(100),
    @tableName nvarchar(100),
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(19,5) = NULL,
    @userDef8 numeric(19,5) = NULL)
AS
    SET NOCOUNT ON;

    declare @actionId numeric(9);

    select @actionId = OBJECT_ID from DYNAMIC_ACTION where ACTION_NAME = @actionName;

    INSERT INTO DYNAMIC_ACTION_RULE
            (ACTION_ID,
             AND_OR,
             COLUMN_NAME,
             DATE_TIME_STAMP,
             LITERAL_VALUE,
             OPERAND,
             PROCESS_STAMP,
             TABLE_NAME,
             USER_DEF1,
             USER_DEF2,
             USER_DEF3,
             USER_DEF4,
             USER_DEF5,
             USER_DEF6,
             USER_DEF7,
             USER_DEF8,
             USER_STAMP)
    SELECT @actionId,
               @andOr,
               @columnName,
               getutcdate(),
               @literalValue,
               @operand,
               @processStamp,
               @tableName,
               @userDef1,
               @userDef2,
               @userDef3,
               @userDef4,
               @userDef5,
               @userDef6,
               @userDef7,
               @userDef8,
           N'System';