-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */


















	
CREATE FUNCTION STSfn_RtrvAdjacentSts(
	@stFunctionalArea nvarchar(25),
	@stFlowName	nvarchar(25) = null,
	@iStatus numeric(3), 
	@iDirection numeric(1))
RETURNS numeric(3)
BEGIN
	
	-- [comment omitted]

	declare @iResultSts numeric(3);

	-- [comment omitted]
	-- [comment omitted]
	if (@stFlowName is not null)
	begin
		if (@iDirection = 0)
		begin
			SELECT @iResultSts = MAX(STATUS)
			  FROM CUSTOM_STATUS_FLOW_DETAIL
			 WHERE FLOW_NAME = @stFlowName
			   AND STATUS < @iStatus;
		end -- [comment omitted]
		else
		begin
			SELECT @iResultSts = MIN(STATUS)
			  FROM CUSTOM_STATUS_FLOW_DETAIL
			 WHERE FLOW_NAME = @stFlowName
			   AND STATUS > @iStatus;
		end; -- [comment omitted]
	end; -- [comment omitted]
	
	-- [comment omitted]
	else
	begin
		if (@iDirection = 0)
		begin
			SELECT @iResultSts = MAX(STATUS)
			  FROM FUNCTIONAL_AREA_STATUS_FLOW
			 WHERE FUNCTIONAL_AREA = @stFunctionalArea
			   AND IN_DEFAULT_FLOW = N'<literal:1>'
			   AND STATUS < @iStatus;
		end; -- [comment omitted]
		else
		begin
			SELECT @iResultSts = MIN(STATUS)
			  FROM FUNCTIONAL_AREA_STATUS_FLOW
			 WHERE FUNCTIONAL_AREA = @stFunctionalArea
			   AND IN_DEFAULT_FLOW = N'<literal:2>'
			   AND STATUS > @iStatus;
		end; -- [comment omitted]
	end; -- [comment omitted]
	
	return @iResultSts;
		
END -- [comment omitted]


