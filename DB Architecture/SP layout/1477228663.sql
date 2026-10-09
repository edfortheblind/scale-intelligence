/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	19524	| SSG	| 08/07/06	| Created.
	19524	| SSG	| 08/17/06	| Passed warehouse as parameter
	84295	| MMM	| 06/09/11	| Updated procedure to return records of warehouses for which user has access and removed Oracle code
	143144	| TDA	| 06/04/14	| Fixed warehouse access query

	Returns:
		Total License Plates Received Today

*/

-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE PM_ReceiptContainer01
(
	@WAREHOUSE nvarchar(25) = NULL,
	@USERNAME nvarchar(30)
)

AS
BEGIN
	SET NOCOUNT ON;

	IF @Warehouse = N''
	SET @Warehouse = NULL;

	SELECT 
		COUNT(*) AS TOTAL_LICENSE_PLATES
	FROM
		RECEIPT_CONTAINER
	WHERE 
		STATUS = dbo.STSfn_RtrvSts(N'Inbound', N'10')
	AND
		DATE_TIME_STAMP 
		BETWEEN
		CONVERT(datetime, CONVERT (CHAR(10), GETUTCDATE(), 101))
		AND
		CONVERT(datetime, CONVERT (CHAR(10), GETUTCDATE() + 1, 101))
	AND
		FROM_WAREHOUSE = ISNULL(@WAREHOUSE, FROM_WAREHOUSE)
	AND 
		FROM_WAREHOUSE in 
			(SELECT DISTINCT WH.WAREHOUSE from WAREHOUSE WH, USER_PROFILE UP, WAREHOUSE_ACCESS WA
		WHERE UP.USER_NAME = @USERNAME
		AND ((UP.WAREHOUSE_AUTH = N'All')
			OR
				(UP.WAREHOUSE_AUTH = N'List'
				 AND WA.USER_NAME = @USERNAME
				 AND WA.WAREHOUSE = WH.WAREHOUSE)
			));


END -- PM_ReceiptContainer01
