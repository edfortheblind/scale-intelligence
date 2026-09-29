-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





	
CREATE FUNCTION STSfn_RtrvStsName(
	@functionalArea nvarchar(25),
	@status numeric(3))
RETURNS nvarchar(50)
BEGIN
	-- [comment omitted]
	declare @statusName nvarchar(50);

	-- [comment omitted]
	SELECT @statusName = STATUS_NAME
	  FROM FUNCTIONAL_AREA_STATUS_FLOW
	 WHERE FUNCTIONAL_AREA = @functionalArea
	   AND STATUS = @status;
	
	return @statusName;
END -- [comment omitted]