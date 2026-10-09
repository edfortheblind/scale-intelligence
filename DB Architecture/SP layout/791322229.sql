/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RDataRetrievalStmtToken02
	@IntTokenNum numeric(9)
AS
	SELECT *
	FROM DATA_RETRIEVAL_STMT_TOKEN
	WHERE INTERNAL_TOKEN_NUM = @IntTokenNum
