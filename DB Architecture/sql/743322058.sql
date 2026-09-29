-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RDataRetrievalStmtDetail02
	@StmtHdrKeyNum numeric(9)
AS
	SELECT *
	FROM DATA_RETRIEVAL_STMT_DETAIL
	WHERE STMT_HEADER_KEY_NUM = @StmtHdrKeyNum
	AND ACTIVE = N'<literal:1>'
	ORDER BY DETAIL_DESC
