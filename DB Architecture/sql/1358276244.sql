-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





   


CREATE PROCEDURE wm_RItemCrossReference02
	@Item nvarchar(50),
	@XRefItem nvarchar(50),
	@Company nvarchar(25)
AS
	SELECT * FROM ITEM_CROSS_REFERENCE
		WHERE ITEM = @Item
		AND X_REF_ITEM = @XRefItem
	    AND ISNULL(Company,N'<literal:1>') = ISNULL(@Company,N'<literal:2>') 

