-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */
















CREATE PROCEDURE RPT_YardVisibilityRcptDetails
(
	@internalReceiptNum numeric(9)
)
AS
BEGIN
	SELECT 
			ITEM N'<literal:1>', 
			TOTAL_QTY N'<literal:2>', 
			ITEM_DESC N'<literal:3>' 
	FROM	RECEIPT_DETAIL WITH (NOLOCK)
	WHERE	INTERNAL_RECEIPT_NUM = @InternalReceiptNum
END



