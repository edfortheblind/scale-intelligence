-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_DCommentText01
	@internalNum numeric(9),
	@internalLineNum numeric(9),
	@commentType nvarchar(25),
	@recordType nvarchar(10)
	
AS
	DELETE FROM COMMENT_TEXT
	WHERE INTERNAL_NUM = @internalNum AND
	INTERNAL_LINE_NUM = @internalLineNum AND
	COMMENT_TYPE = @commentType AND
	RECORD_TYPE = @recordType ;
	


 