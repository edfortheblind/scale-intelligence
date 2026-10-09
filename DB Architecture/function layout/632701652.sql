/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	186026		| NRJ			| 08/25/16	| Created.

	Retrieves the description for the specified record_type and identifier 
*/	
CREATE FUNCTION DYNAMICCALLINGfn_RtrvDesc(
	@recordType nvarchar(10),
	@identifier nvarchar(25))
RETURNS nvarchar(50)
BEGIN
	-- local variables.
	declare @description nvarchar(50)

	-- select the description 
	SELECT @description = DESCRIPTION
	  FROM DYNAMIC_CALLING_DETAIL WHERE RECORD_TYPE =@recordType
	  AND IDENTIFIER = @identifier 
	
	return @description;
END -- end DYNAMICCALLINGfn_RtrvDesc