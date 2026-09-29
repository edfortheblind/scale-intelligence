-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */







	


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
	SELECT @Document_Type = DOCUMENT_TYPE FROM DOCUMENT_TYPE WITH(NOLOCK) WHERE DESCRIPTION = N'<literal:1>';
	SELECT @PrintProcess = IDENTIFIER FROM GENERIC_CONFIG_DETAIL WITH(NOLOCK) WHERE RECORD_TYPE = N'<literal:2>' AND DESCRIPTION = N'<literal:3>';

	INSERT INTO #PrintDetails VALUES ( 1, @InternalNum, @PrintProcess, @Document_Type);

	SELECT * FROM #PrintDetails;
	
END