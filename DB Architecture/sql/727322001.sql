-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RDataRetrievalStmtDetail01
	@StmtDtlKeyNum numeric(9)
AS
	SELECT *
	FROM DATA_RETRIEVAL_STMT_DETAIL
	WHERE STMT_DETAIL_KEY_NUM = @StmtDtlKeyNum
	AND ACTIVE = N'<literal:1>'
	ORDER BY DETAIL_DESC
