-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */












-- [comment omitted]


CREATE PROCEDURE PM_ShipmentHeader02
(
	@WAREHOUSE nvarchar(25) = NULL,
	@USERNAME nvarchar(30)
)

AS
BEGIN
	SET NOCOUNT ON;

	IF @Warehouse = N'<literal:1>'
	SET @Warehouse = NULL;
		
	SELECT 
		COUNT(*) AS TOTAL_SHIPMENTS_IN_POOL
	FROM
		SHIPMENT_HEADER SH
	WHERE 
		TRAILING_STS = dbo.STSfn_RtrvSts(N'<literal:2>', N'<literal:3>')
	AND
		SH.WAREHOUSE = ISNULL(@WAREHOUSE, SH.WAREHOUSE)
	AND 
		SH.WAREHOUSE in 
		(SELECT DISTINCT WH.WAREHOUSE from WAREHOUSE WH, USER_PROFILE UP, WAREHOUSE_ACCESS WA
		WHERE UP.USER_NAME = @USERNAME
		AND ((UP.WAREHOUSE_AUTH = N'<literal:4>')
			OR
				(UP.WAREHOUSE_AUTH = N'<literal:5>'
				 AND WA.USER_NAME = @USERNAME
				 AND WA.WAREHOUSE = WH.WAREHOUSE)
			));
	
END -- [comment omitted]
