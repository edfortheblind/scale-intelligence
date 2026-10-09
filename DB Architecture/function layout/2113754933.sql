
/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9211		| RAB			| 05/31/02	| Created.
	9593		| RAB			| 10/09/02	| Modified for standards.

	Retrieves the status for the specified action.  
	
	Parameters
		String		stFunctionalArea	The functional area.
		String		stAction			Action being performed.
		
	Return Value
		int			iStatus				The resulting status.
*/	
CREATE FUNCTION STSfn_RtrvStsForAction(
	@stFunctionalArea nvarchar(25),
	@stAction nvarchar(50))
	
RETURNS numeric(3)
BEGIN
	
	-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;

	-- local variables
	declare @iStatus numeric(3);
	declare @stRecordType nvarchar(50);

	-- determine the correct GenericConfigDetail recordType.
	if (@stFunctionalArea = N'Outbound')
		set @stRecordType = N'STSACTOUT';
	else 
		set @stRecordType = N'STSACTIN';

	-- select the status.
	SELECT @iStatus = STATUS
	  FROM FUNCTIONAL_AREA_STATUS_FLOW
	 WHERE FUNCTIONAL_AREA = @stFunctionalArea
	   AND SYSTEM_STS IN (SELECT SYS1VALUE
						    FROM GENERIC_CONFIG_DETAIL
						   WHERE RECORD_TYPE = @stRecordType
							 AND IDENTIFIER = @stAction);
	
	return @iStatus;
END -- end STSfn_RtrvStsForAction


