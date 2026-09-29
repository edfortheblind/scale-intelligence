-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RCommentText03
	@internalNum numeric(9),
	@internalLineNum numeric(9),
	@recordType nvarchar(10)
	
AS
	SELECT DISTINCT COMMENT_TYPE FROM COMMENT_TEXT
	WHERE INTERNAL_NUM = @internalNum AND
	INTERNAL_LINE_NUM = @internalLineNum AND
	RECORD_TYPE = @recordType ;
	


 