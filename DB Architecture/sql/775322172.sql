-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RDataRetrievalStmtToken01
	@StmtHdrKeyNum numeric(9)
AS
	SELECT *
	FROM DATA_RETRIEVAL_STMT_TOKEN
	WHERE STMT_HEADER_KEY_NUM = @StmtHdrKeyNum
