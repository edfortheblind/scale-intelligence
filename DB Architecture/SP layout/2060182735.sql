/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	            | DBCGenerator  | 7/2/2004	| Created.
	224179		| SO			| 05/11/2018 | Modified to pass current utc date for datetimestamp.

	Inserts a record for dbChange scripts.
*/


CREATE PROCEDURE dbc_IInterfaceDatamapReqFields(
    @actionCode nvarchar(25),
    @fieldName nvarchar(30),
    @processStamp nvarchar(100),
    @recordType nvarchar(50),
    @userDef1 nvarchar(25),
    @userDef2 nvarchar(25),
    @userDef3 nvarchar(25),
    @userDef4 nvarchar(25),
    @userDef5 nvarchar(25),
    @userDef6 nvarchar(25),
    @userDef7 numeric(19,5),
    @userDef8 numeric(19,5))
AS
    -- position only matters when talking about the datamapN's name
    -- which has a fieldName of null.
    declare @position numeric(5);
    set @position = 0;
    if (@fieldName is null)
    begin
        set @position = 1;
    end;

    INSERT INTO INTERFACE_DATAMAP_REQ_FIELDS
        (ACTION_CODE,
         DATE_TIME_STAMP,
         FIELD_NAME,
         POSITION,
         PROCESS_STAMP,
         RECORD_TYPE,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP)
    SELECT @actionCode,
           getutcdate(),
           @fieldName,
           @position,
           @processStamp,
           @recordType,
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'SystemN'
     WHERE NOT EXISTS(SELECT *
                        FROM INTERFACE_DATAMAP_REQ_FIELDS
                       WHERE RECORD_TYPE = @recordType
                         AND ACTION_CODE = @actionCode
                         AND ISNULL(FIELD_NAME,N'!N') = ISNULL(@fieldName,N'!'))
-- end dbc_IInterfaceDatamapReqFields