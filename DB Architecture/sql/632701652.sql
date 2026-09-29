-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





	
CREATE FUNCTION DYNAMICCALLINGfn_RtrvDesc(
	@recordType nvarchar(10),
	@identifier nvarchar(25))
RETURNS nvarchar(50)
BEGIN
	-- [comment omitted]
	declare @description nvarchar(50)

	-- [comment omitted]
	SELECT @description = DESCRIPTION
	  FROM DYNAMIC_CALLING_DETAIL WHERE RECORD_TYPE =@recordType
	  AND IDENTIFIER = @identifier 
	
	return @description;
END -- [comment omitted]