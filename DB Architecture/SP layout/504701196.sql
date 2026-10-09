/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	            | DBCGenerator  | 7/30/2009	| Created.
	224179		| SO			| 05/11/2018 | Modified to pass current utc date for datetimestamp.

	Inserts a record for dbChange scripts.
*/
CREATE PROCEDURE dbc_IViewerTemplate(
    @detailDataSource nvarchar(50) = NULL,
    @detailField nvarchar(50) = NULL,
    @engineType numeric(9),
    @formId numeric(5),
    @headerDataSource nvarchar(50),
    @headerField nvarchar(50) = NULL,
    @processStamp nvarchar(100),
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

    INSERT INTO VIEWER_TEMPLATE
        (DATE_TIME_STAMP,
         DETAIL_DATA_SOURCE,
         DETAIL_FIELD,
         ENGINE_TYPE,
         FORM_ID,
         HEADER_DATA_SOURCE,
         HEADER_FIELD,
         PROCESS_STAMP,
         SYSTEM_CREATED,
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
           @detailDataSource,
           @detailField,
           @engineType,
           @formId,
           @headerDataSource,
           @headerField,
           @processStamp,
           N'Y',
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
                        FROM VIEWER_TEMPLATE
                       WHERE FORM_ID = @formId);
-- end dbc_IViewerTemplate