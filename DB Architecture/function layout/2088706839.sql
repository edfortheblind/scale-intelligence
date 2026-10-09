/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	204228		| DP			| 06/21/17	| Created.
	208593      | DP            | 07/14/17  | Modified to get description from resource file
*/	

CREATE FUNCTION LABORCONFIGfn_RtrvDesc(
	@identifier nvarchar(25))
RETURNS nvarchar(50)

BEGIN
	-- local variables.
	declare @description nvarchar(50)

	IF (@identifier not in (SELECT WORK_TYPE FROM WORK_TYPE))

	BEGIN
		SELECT @description = dbo.RSCMfn_RtrvResource(@identifier,N'Text', null)
    END

	ELSE

	BEGIN
	SELECT @description = DESCRIPTION
	  FROM WORK_TYPE WHERE WORK_TYPE = @identifier 
	END

	return @description;
END 
