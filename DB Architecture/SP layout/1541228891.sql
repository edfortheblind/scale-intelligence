/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	19524	| SSG	| 08/07/06	| Created.
	19524	| SSG	| 08/17/06	| Passed warehouse as parameter
	5119	| MDL	| 07/06/07	| Modify to driven out of Shipment_Header_View
	84295	| MMM	| 06/09/11	| Updated procedure to return records of warehouses for which user has access and removed Oracle code
	143144	| TDA	| 06/04/14	| Fixed warehouse access query

	Returns:
		Total Lines Shipped Today

*/

-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE PM_ShipmentHeader03
(
	@WAREHOUSE nvarchar(25) =  NULL,
	@USERNAME nvarchar(30)
)

AS
BEGIN
	SET NOCOUNT ON;

	IF @Warehouse = N''
	SET @Warehouse = NULL;

	SELECT 
		SUM(TOTAL_LINES) AS TOTAL_LINES
	FROM
		SHIPMENT_HEADER_VIEW SHV
	WHERE 
		SHV.TRAILING_STS = dbo.STSfn_RtrvSts(N'Outbound', N'10')
	AND
		SHV.ACTUAL_SHIP_DATE_TIME
		BETWEEN
		CONVERT(datetime, CONVERT (CHAR(10), GETUTCDATE(), 101))
		AND
		CONVERT(datetime, CONVERT (CHAR(10), GETUTCDATE() + 1, 101))
	AND
		SHV.WAREHOUSE = ISNULL(@WAREHOUSE, SHV.WAREHOUSE)
	AND 
		SHV.WAREHOUSE in 
			(SELECT DISTINCT WH.WAREHOUSE from WAREHOUSE WH, USER_PROFILE UP, WAREHOUSE_ACCESS WA
		WHERE UP.USER_NAME = @USERNAME
		AND ((UP.WAREHOUSE_AUTH = N'All')
			OR
				(UP.WAREHOUSE_AUTH = N'List'
				 AND WA.USER_NAME = @USERNAME
				 AND WA.WAREHOUSE = WH.WAREHOUSE)
			));



END -- PM_ShipmentHeader03
