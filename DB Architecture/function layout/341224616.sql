/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	145348		| MMM			| 09/10/14	| Created.
	146663		| MJ			| 10/10/14	| Modified to get max sequence number

	Returns next screen control sequence for given form id and screen group
*/
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