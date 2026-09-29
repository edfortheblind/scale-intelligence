-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */












-- [comment omitted]


CREATE PROCEDURE PM_WorkInstruction02
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
		COUNT(*) AS TOTAL_WORK_INSTRUCTIONS
	FROM
		WORK_INSTRUCTION
	WHERE 
		INSTRUCTION_TYPE = N'<literal:2>'
	AND
		CONDITION <> N'<literal:3>'
	AND
		INTERNAL_NUM_TYPE = N'<literal:4>'
	AND
		FROM_WHS = ISNULL(@Warehouse, FROM_WHS)
	AND 
		FROM_WHS in 
		(SELECT DISTINCT WH.WAREHOUSE from WAREHOUSE WH, USER_PROFILE UP, WAREHOUSE_ACCESS WA
		WHERE UP.USER_NAME = @USERNAME
		AND ((UP.WAREHOUSE_AUTH = N'<literal:5>')
			OR
				(UP.WAREHOUSE_AUTH = N'<literal:6>'
				 AND WA.USER_NAME = @USERNAME
				 AND WA.WAREHOUSE = WH.WAREHOUSE)
			));

END -- [comment omitted]
