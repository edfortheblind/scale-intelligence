 /*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	            | DBCGenerator  | 10/10/2005	| Created.
	224179		| SO			| 05/11/2018    | Modified to pass current utc date for datetimestamp.

	Inserts a record for dbChange scripts.
*/


CREATE PROCEDURE dbc_ISlottingItemUpFields(
    @defaultValue nvarchar(25) = NULL,
    @fieldPosition numeric(9) = NULL,
    @ilsField nvarchar(25) = NULL,
    @processStamp nvarchar(100),
    @slottingField nvarchar(25) = NULL,
    @slottingFieldDecPos numeric(9) = NULL,
    @slottingFieldLength numeric(9) = NULL,
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

    INSERT INTO SLOTTING_ITEM_UP_FIELDS
        (DATE_TIME_STAMP,
         DEFAULT_VALUE,
         FIELD_POSITION,
         ILS_FIELD,
         PROCESS_STAMP,
         SLOTTING_FIELD,
         SLOTTING_FIELD_DEC_POS,
         SLOTTING_FIELD_LENGTH,
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
           @defaultValue,
           @fieldPosition,
           @ilsField,
           @processStamp,
           @slottingField,
           @slottingFieldDecPos,
           @slottingFieldLength,
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
                        FROM SLOTTING_ITEM_UP_FIELDS
                        WHERE SLOTTING_FIELD = @slottingField);
-- end dbc_ISlottingItemUpFields
