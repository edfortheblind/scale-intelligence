/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9211		| RAB			| 05/31/02	| Created.
	9593		| RAB			| 10/09/02	| Modified for standards.

	Retrieves the system status for the specified status name.  
	
	Parameters
		String		stFunctionalArea	The functional area.
		String		stStatusName		Name of the status to retrieve.
		
	Return Value
		int			iStatus				The resulting system status.
*/	
CREATE FUNCTION STSfn_RtrvSts(
	@stFunctionalArea nvarchar(25),
	@stStatusName nvarchar(50))
RETURNS numeric(3)
BEGIN
	-- local variables.
	declare @iStatus numeric(3);

	-- select the status.
	SELECT @iStatus = STATUS
	  FROM FUNCTIONAL_AREA_STATUS_FLOW
	 WHERE FUNCTIONAL_AREA = @stFunctionalArea
	   AND SYSTEM_STS = @stStatusName;
	
	return @iStatus;
END -- end STSfn_RtrvSts