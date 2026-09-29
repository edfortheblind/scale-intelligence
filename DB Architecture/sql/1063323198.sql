-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




   


CREATE PROCEDURE wm_RItemCrossReference03
	@Item nvarchar(50),
	@Company nvarchar(25)
AS
	SELECT * FROM ITEM_CROSS_REFERENCE
	WHERE ITEM = @Item
	AND IsNull(COMPANY,N'<literal:1>') = IsNull(@COMPANY,N'<literal:2>')

