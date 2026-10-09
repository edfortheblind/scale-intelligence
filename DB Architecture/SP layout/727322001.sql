/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RDataRetrievalStmtDetail01
	@StmtDtlKeyNum numeric(9)
AS
	SELECT *
	FROM DATA_RETRIEVAL_STMT_DETAIL
	WHERE STMT_DETAIL_KEY_NUM = @StmtDtlKeyNum
	AND ACTIVE = N'Y'
	ORDER BY DETAIL_DESC
