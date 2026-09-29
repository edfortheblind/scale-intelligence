-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




	

CREATE FUNCTION LABORCONFIGfn_RtrvDesc(
	@identifier nvarchar(25))
RETURNS nvarchar(50)

BEGIN
	-- [comment omitted]
	declare @description nvarchar(50)

	IF (@identifier not in (SELECT WORK_TYPE FROM WORK_TYPE))

	BEGIN
		SELECT @description = dbo.RSCMfn_RtrvResource(@identifier,N'<literal:1>', null)
    END

	ELSE

	BEGIN
	SELECT @description = DESCRIPTION
	  FROM WORK_TYPE WHERE WORK_TYPE = @identifier 
	END

	return @description;
END 
