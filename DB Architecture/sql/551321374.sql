-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RCommentType02
	@CommentType nvarchar(25)
AS
	SELECT * 
     FROM comment_type
	 WHERE comment_type = @CommentType
      AND active = N'<literal:1>'
