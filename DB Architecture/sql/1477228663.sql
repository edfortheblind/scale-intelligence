-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */












-- [comment omitted]


CREATE PROCEDURE PM_ReceiptContainer01
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
		COUNT(*) AS TOTAL_LICENSE_PLATES
	FROM
		RECEIPT_CONTAINER
	WHERE 
		STATUS = dbo.STSfn_RtrvSts(N'<literal:2>', N'<literal:3>')
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
		AND ((UP.WAREHOUSE_AUTH = N'<literal:4>')
			OR
				(UP.WAREHOUSE_AUTH = N'<literal:5>'
				 AND WA.USER_NAME = @USERNAME
				 AND WA.WAREHOUSE = WH.WAREHOUSE)
			));


END -- [comment omitted]
