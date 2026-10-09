/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RDataRetrievalStmtToken01
	@StmtHdrKeyNum numeric(9)
AS
	SELECT *
	FROM DATA_RETRIEVAL_STMT_TOKEN
	WHERE STMT_HEADER_KEY_NUM = @StmtHdrKeyNum
