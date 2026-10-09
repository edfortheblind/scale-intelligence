/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	138902		| MDL			| 04/08/14	| Created.

	Retrieves the description for the specified record_type and identifier 
*/	
CREATE FUNCTION GENCONFIGfn_RtrvDesc(
	@recordType nvarchar(50),
	@identifier nvarchar(50))
RETURNS nvarchar(500)
BEGIN
	-- local variables.
	declare @description nvarchar(500)

	-- select the description 
	SELECT @description = DESCRIPTION
	  FROM GENERIC_CONFIG_DETAIL WHERE RECORD_TYPE =@recordType
	  AND IDENTIFIER = @identifier 
	
	return @description;
END -- end GENCONFIGfn_RtrvDesc