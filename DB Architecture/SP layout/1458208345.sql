
/*
 Mod     | Programmer    | Date       | Modification Description
 --------------------------------------------------------------------
 EX01    | RP            | 03/10/2023 | Returns details for printing Label for Pack Size integration 

 exec [TRAV_EX01_GetPrintLabelDetails] '00004000000081957185', 'TRAVIS'

*/
	


CREATE PROCEDURE [dbo].[TRAV_EX01_GetPrintLabelDetails]
(
	@ContainerID NVARCHAR(25),
	@Warehouse NVARCHAR(25)

)
AS
BEGIN

	SET NOCOUNT ON

	CREATE TABLE #PrintDetails ( Id INT, InternalNum NUMERIC(9,0), PrintProcess VARCHAR(50), Document_Type VARCHAR(50))

	DECLARE @InternalNum NUMERIC(9,0);
	DECLARE @PrintProcess VARCHAR(50);
	DECLARE @Document_Type VARCHAR(50);

	SELECT @InternalNum = INTERNAL_CONTAINER_NUM FROM SHIPPING_CONTAINER WITH(NOLOCK) WHERE CONTAINER_ID = @ContainerID;
	SELECT @Document_Type = DOCUMENT_TYPE FROM DOCUMENT_TYPE WITH(NOLOCK) WHERE DESCRIPTION = N'Container Contents (Multiple Item)';
	SELECT @PrintProcess = IDENTIFIER FROM GENERIC_CONFIG_DETAIL WITH(NOLOCK) WHERE RECORD_TYPE = N'PRINT PROC' AND DESCRIPTION = N'Shipping Container';

	INSERT INTO #PrintDetails VALUES ( 1, @InternalNum, @PrintProcess, @Document_Type);

	SELECT * FROM #PrintDetails;
	
END