-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RDataRetrievalStmtHeader01
	@StmtHdrKeyNum numeric(9)
AS
	SELECT *
	FROM DATA_RETRIEVAL_STMT_HEADER
	WHERE STMT_HEADER_KEY_NUM = @StmtHdrKeyNum
