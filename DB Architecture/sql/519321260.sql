-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RCommentText02
	@InternalCommentId numeric(9)
AS
	SELECT * FROM COMMENT_TEXT
	 WHERE INTERNAL_COMMENT_ID = @InternalCommentId
