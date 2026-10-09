/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RCommentType02
	@CommentType nvarchar(25)
AS
	SELECT * 
     FROM comment_type
	 WHERE comment_type = @CommentType
      AND active = N'Y'
