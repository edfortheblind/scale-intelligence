/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RCommentType01
	@CommentType nvarchar(25)
AS
	SELECT * FROM COMMENT_TYPE
	WHERE COMMENT_TYPE = @CommentType
