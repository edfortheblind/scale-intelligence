-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RCommentType01
	@CommentType nvarchar(25)
AS
	SELECT * FROM COMMENT_TYPE
	WHERE COMMENT_TYPE = @CommentType
