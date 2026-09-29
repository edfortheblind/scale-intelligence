-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE FUNCTION METAfn_GetNextScreenControlSequence(
	@groupName		nvarchar(50),
	@formId			numeric(5))
RETURNS numeric(9)
BEGIN

	declare @nextSequence numeric(9);	
	declare @sequenceIncrement numeric(9,0);

	set @sequenceIncrement = 25;

	SELECT @nextSequence = max(SEQUENCE) 
	FROM SCREEN_CONTROL SC
	WHERE SCREEN_GROUP_ID = dbo.METAfn_GetScreenGroup(@groupName, @formId)	
	
	return @nextSequence + @sequenceIncrement;
END