-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */









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
    -- [comment omitted]
    -- [comment omitted]
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
           N'<literal:1>'
     WHERE NOT EXISTS(SELECT *
                        FROM INTERFACE_DATAMAP_REQ_FIELDS
                       WHERE RECORD_TYPE = @recordType
                         AND ACTION_CODE = @actionCode
                         AND ISNULL(FIELD_NAME,N'<literal:2>') = ISNULL(@fieldName,N'<literal:3>'))
-- [comment omitted]