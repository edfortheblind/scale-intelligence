-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RDataRetrievalStmtToken02
	@IntTokenNum numeric(9)
AS
	SELECT *
	FROM DATA_RETRIEVAL_STMT_TOKEN
	WHERE INTERNAL_TOKEN_NUM = @IntTokenNum
