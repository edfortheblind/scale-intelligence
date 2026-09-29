-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */













	
CREATE FUNCTION STSfn_RtrvSts(
	@stFunctionalArea nvarchar(25),
	@stStatusName nvarchar(50))
RETURNS numeric(3)
BEGIN
	-- [comment omitted]
	declare @iStatus numeric(3);

	-- [comment omitted]
	SELECT @iStatus = STATUS
	  FROM FUNCTIONAL_AREA_STATUS_FLOW
	 WHERE FUNCTIONAL_AREA = @stFunctionalArea
	   AND SYSTEM_STS = @stStatusName;
	
	return @iStatus;
END -- [comment omitted]