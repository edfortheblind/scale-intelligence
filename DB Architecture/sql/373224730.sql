-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE FUNCTION METAfn_GetScreenGroup(
	@groupName		nvarchar(50),
	@formId			numeric(5))
RETURNS numeric(9)
BEGIN

	declare @screenGroupId numeric(9);
	set @screenGroupId = 0;

	SELECT @screenGroupId = OBJECT_ID
	FROM SCREEN_GROUP
	WHERE SCREEN_PART_ID IN
	(
		SELECT OBJECT_ID 
		FROM SCREEN_PART
		WHERE SCREEN_ID IN 
		(
			SELECT OBJECT_ID 
			FROM MAIN_UI_SCREEN
			WHERE FORM_ID = @formId
		)
	)
	AND
	GROUP_NAME = @groupName
	
	return @screenGroupId;
END