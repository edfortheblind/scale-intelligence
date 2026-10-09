/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	138166		| RJR			| 03/11/14	| Created.

	Retrieves the status name for the specified status.
*/	
CREATE FUNCTION STSfn_RtrvStsName(
	@functionalArea nvarchar(25),
	@status numeric(3))
RETURNS nvarchar(50)
BEGIN
	-- local variables.
	declare @statusName nvarchar(50);

	-- select the status name
	SELECT @statusName = STATUS_NAME
	  FROM FUNCTIONAL_AREA_STATUS_FLOW
	 WHERE FUNCTIONAL_AREA = @functionalArea
	   AND STATUS = @status;
	
	return @statusName;
END -- end STSfn_RtrvStsName