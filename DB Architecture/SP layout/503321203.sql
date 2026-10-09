/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RCommentText01
	@InternalCommentId numeric(9)
AS
	SELECT * FROM COMMENT_TEXT
	 WHERE INTERNAL_COMMENT_ID = @InternalCommentId
