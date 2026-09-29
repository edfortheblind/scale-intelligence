-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE wm_RReceiptDetail02
	@ReceiptId nvarchar(25),
	@ErpOrderNum nvarchar(25),
	@ErpOrderLineNum numeric(19,5)
AS
	SET NOCOUNT ON
	SELECT *
	FROM RECEIPT_DETAIL
	WHERE RECEIPT_ID = @ReceiptId
	AND ISNULL(ERP_ORDER_NUM, N'<literal:1>') = ISNULL(@ErpOrderNum, N'<literal:2>')
	AND ERP_ORDER_LINE_NUM = @ErpOrderLineNum



