-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










CREATE PROCEDURE dbc_IAdjustmentType(
    @active nchar(1),
    @adjustmentClass nvarchar(25),
    @adjustmentType nvarchar(50),
    @allowFrozen nchar(1),
    @createWork nchar(1),
    @description nvarchar(50),
    @includeInInterfaceUpload nchar(1),
    @maximumQty numeric(19,5) = NULL,
    @minimumQty numeric(19,5) = NULL,
    @processStamp nvarchar(100),
    @userDef1 nvarchar(50) = NULL,
    @userDef2 nvarchar(50) = NULL,
    @userDef3 nvarchar(50) = NULL,
    @userDef4 nvarchar(50) = NULL, 
    @userDef5 nvarchar(50) = NULL,
    @userDef6 nvarchar(50) = NULL,
    @userDef7 numeric(19,5) = NULL,
    @userDef8 numeric(19,5) = NULL,
    @workCreationMaster nvarchar(25) = NULL,
	@rfInitiationMethod nvarchar(25) = NULL)
AS
    SET NOCOUNT ON;

    INSERT INTO ADJUSTMENT_TYPE
        (ACTIVE,
         ADJUSTMENT_CLASS,
         ADJUSTMENT_TYPE,
         ALLOW_FROZEN,
         CREATE_WORK,
         DATE_TIME_STAMP,
         DESCRIPTION,
         INCLUDE_IN_INTERFACE_UPLOAD,
         MAXIMUM_QTY,
         MINIMUM_QTY,
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
         WORK_CREATION_MASTER,
		 RF_INITIATION_METHOD)
    SELECT @active,
           @adjustmentClass,
           @adjustmentType,
           @allowFrozen,
           @createWork,
           getutcdate(),
           @description,
           @includeInInterfaceUpload,
           @maximumQty,
           @minimumQty,
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
           @workCreationMaster,
		   @rfInitiationMethod
     WHERE NOT EXISTS(SELECT *
                        FROM ADJUSTMENT_TYPE
                       WHERE ADJUSTMENT_TYPE = @adjustmentType);
-- [comment omitted]




