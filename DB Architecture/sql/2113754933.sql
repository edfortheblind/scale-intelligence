-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */













	
CREATE FUNCTION STSfn_RtrvStsForAction(
	@stFunctionalArea nvarchar(25),
	@stAction nvarchar(50))
	
RETURNS numeric(3)
BEGIN
	
	-- [comment omitted]

	-- [comment omitted]
	declare @iStatus numeric(3);
	declare @stRecordType nvarchar(50);

	-- [comment omitted]
	if (@stFunctionalArea = N'<literal:1>')
		set @stRecordType = N'<literal:2>';
	else 
		set @stRecordType = N'<literal:3>';

	-- [comment omitted]
	SELECT @iStatus = STATUS
	  FROM FUNCTIONAL_AREA_STATUS_FLOW
	 WHERE FUNCTIONAL_AREA = @stFunctionalArea
	   AND SYSTEM_STS IN (SELECT SYS1VALUE
						    FROM GENERIC_CONFIG_DETAIL
						   WHERE RECORD_TYPE = @stRecordType
							 AND IDENTIFIER = @stAction);
	
	return @iStatus;
END -- [comment omitted]


