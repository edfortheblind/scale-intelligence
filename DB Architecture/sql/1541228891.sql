-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */













-- [comment omitted]


CREATE PROCEDURE PM_ShipmentHeader03
(
	@WAREHOUSE nvarchar(25) =  NULL,
	@USERNAME nvarchar(30)
)

AS
BEGIN
	SET NOCOUNT ON;

	IF @Warehouse = N'<literal:1>'
	SET @Warehouse = NULL;

	SELECT 
		SUM(TOTAL_LINES) AS TOTAL_LINES
	FROM
		SHIPMENT_HEADER_VIEW SHV
	WHERE 
		SHV.TRAILING_STS = dbo.STSfn_RtrvSts(N'<literal:2>', N'<literal:3>')
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
		AND ((UP.WAREHOUSE_AUTH = N'<literal:4>')
			OR
				(UP.WAREHOUSE_AUTH = N'<literal:5>'
				 AND WA.USER_NAME = @USERNAME
				 AND WA.WAREHOUSE = WH.WAREHOUSE)
			));



END -- [comment omitted]
