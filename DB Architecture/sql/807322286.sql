-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RFunctionalAreaStatusFlow01
	@FunctionalArea nvarchar(25),
	@SystemSts nvarchar(50)
AS
	SELECT * FROM FUNCTIONAL_AREA_STATUS_FLOW
	WHERE FUNCTIONAL_AREA = @FunctionalArea
	AND SYSTEM_STS = @SystemSts
	
