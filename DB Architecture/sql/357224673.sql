-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE FUNCTION METAfn_GetScreenControl(
	@controlName	nvarchar(100),
	@groupName		nvarchar(50),
	@formId			numeric(5))
RETURNS numeric(9)
BEGIN
	
	DECLARE @screenControlId NUMERIC(9);
	DECLARE @screenGroupId NUMERIC(9);
	SET @screenControlId = 0;
	SET @screenGroupId = 0;
	

	SELECT @screenGroupId = dbo.METAfn_GetScreenGroup(@groupName,@formId);
	
	SELECT @screenControlId = OBJECT_ID
	FROM SCREEN_CONTROL 
	WHERE SCREEN_GROUP_ID = @screenGroupId
		AND CONTROL_NAME = @controlName
	
	
	RETURN @screenControlId;
END