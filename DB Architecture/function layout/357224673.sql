/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	146384		| MJ			| 12/02/14	| Created.
	191074		| DN			| 01/23/17	| Updated parameter types

	Returns screen group id for given form id and screen group name
*/
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