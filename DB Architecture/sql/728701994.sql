-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





	
CREATE FUNCTION GENCONFIGfn_RtrvDesc(
	@recordType nvarchar(50),
	@identifier nvarchar(50))
RETURNS nvarchar(500)
BEGIN
	-- [comment omitted]
	declare @description nvarchar(500)

	-- [comment omitted]
	SELECT @description = DESCRIPTION
	  FROM GENERIC_CONFIG_DETAIL WHERE RECORD_TYPE =@recordType
	  AND IDENTIFIER = @identifier 
	
	return @description;
END -- [comment omitted]