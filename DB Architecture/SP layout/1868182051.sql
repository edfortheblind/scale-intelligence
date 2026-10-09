/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	            | DBCGenerator  | 11/14/2003	| Created.
	4213        | WZ            | 05/10/2007    | Add additional parameters.
	224179		| SO			| 05/11/2018	| Modified to pass current utc date for datetimestamp.

	Inserts a record for dbChange scripts.
	Rerun PROCEDURE.
*/


CREATE PROCEDURE dbc_IDocument(
    @description nvarchar(50),
    @document nvarchar(25),
    @documentTemplate nvarchar(100),
    @documentType nvarchar(25),
    @internationalDocument nchar(1),
    @printedBy nvarchar(25) = NULL,
    @processStamp nvarchar(100),
    @produceInBatchFormat nchar(1),
    @language nvarchar(25),
    @printNestedContainers nchar(1),
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(19,5) = NULL,
    @userDef8 numeric(19,5) = NULL,
	@labelDocument nvarchar(25) = NULL,
	@printerDriverSymbol nvarchar(50) = NULL,
	@printerStockSymbol nvarchar(50) = NULL)
AS
    SET NOCOUNT ON;


    INSERT INTO DOCUMENT
        (DATE_TIME_STAMP,
         DESCRIPTION,
         DOCUMENT,
         DOCUMENT_TEMPLATE,
         DOCUMENT_TYPE,
         INTERNATIONAL_DOCUMENT,
         PRINTED_BY,
         PROCESS_STAMP,
         PRODUCE_IN_BATCH_FORMAT,
         SYSTEM_CREATED,
         LANGUAGE,
         PRINT_NESTED_CONTAINERS,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP,
		 LABEL_DOCUMENT,
		 PRINTER_DRIVER_SYMBOL,
		 PRINTER_STOCK_SYMBOL)
    SELECT getutcdate(),
           @description,
           @document,
           @documentTemplate,
           @documentType,
           @internationalDocument,
           @printedBy,
           @processStamp,
           @produceInBatchFormat,
           N'Y',
           @language,
           @printNestedContainers,
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'System',
		   @labelDocument,
		   @printerDriverSymbol,
		   @printerStockSymbol
     WHERE NOT EXISTS(SELECT *
                        FROM DOCUMENT
                       WHERE DOCUMENT = @document);

