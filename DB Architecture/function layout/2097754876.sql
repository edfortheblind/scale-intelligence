
/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9211		| RAB			| 05/31/02	| Created.
	9593		| RAB			| 10/09/02	| Modified for standards.
	14473		| TDL			| 04/13/04	| Fixed Apostrophes

	Retrieves either the next or previous status from either the 
	CustomStatusFlowDetail or the FunctionalAreaStatusFlow tables.  
	
	Parameters
		String		stFunctionalArea	The functional area.  Only used when @stFlowName is null. 
		String		stFlowName			OPTIONAL - custom status flow. 
										defaults to null.
		int			iStatus				The base status used to find the next/previous status.
		int			iDirection			Either 0 or 1
		
	Return Value
		int			iResultSts			The next/previous status.
*/	
CREATE FUNCTION STSfn_RtrvAdjacentSts(
	@stFunctionalArea nvarchar(25),
	@stFlowName	nvarchar(25) = null,
	@iStatus numeric(3), 
	@iDirection numeric(1))
RETURNS numeric(3)
BEGIN
	
	-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;

	declare @iResultSts numeric(3);

	-- if a custom status flow name is specified, 
	-- get the next status from the CustomStatusFlowDetail
	if (@stFlowName is not null)
	begin
		if (@iDirection = 0)
		begin
			SELECT @iResultSts = MAX(STATUS)
			  FROM CUSTOM_STATUS_FLOW_DETAIL
			 WHERE FLOW_NAME = @stFlowName
			   AND STATUS < @iStatus;
		end -- end if previous status
		else
		begin
			SELECT @iResultSts = MIN(STATUS)
			  FROM CUSTOM_STATUS_FLOW_DETAIL
			 WHERE FLOW_NAME = @stFlowName
			   AND STATUS > @iStatus;
		end; -- end if next status
	end; -- end if custom flow specified.
	
	-- otherwise, use the functional areas flow
	else
	begin
		if (@iDirection = 0)
		begin
			SELECT @iResultSts = MAX(STATUS)
			  FROM FUNCTIONAL_AREA_STATUS_FLOW
			 WHERE FUNCTIONAL_AREA = @stFunctionalArea
			   AND IN_DEFAULT_FLOW = N'Y'
			   AND STATUS < @iStatus;
		end; -- end if previous status
		else
		begin
			SELECT @iResultSts = MIN(STATUS)
			  FROM FUNCTIONAL_AREA_STATUS_FLOW
			 WHERE FUNCTIONAL_AREA = @stFunctionalArea
			   AND IN_DEFAULT_FLOW = N'Y'
			   AND STATUS > @iStatus;
		end; -- end if next status
	end; -- end if functional areas flow used.
	
	return @iResultSts;
		
END -- end STSfn_RtrvAdjacentSts


