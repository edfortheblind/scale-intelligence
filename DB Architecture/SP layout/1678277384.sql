/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	15478	| LJM	| 10/15/04	| added erp order num
    15114   | BTD   | 01/16/06  | Modified parameters for increased sizes
*/

CREATE PROCEDURE wm_RReceiptDetail02
	@ReceiptId nvarchar(25),
	@ErpOrderNum nvarchar(25),
	@ErpOrderLineNum numeric(19,5)
AS
	SET NOCOUNT ON
	SELECT *
	FROM RECEIPT_DETAIL
	WHERE RECEIPT_ID = @ReceiptId
	AND ISNULL(ERP_ORDER_NUM, N'!') = ISNULL(@ErpOrderNum, N'!')
	AND ERP_ORDER_LINE_NUM = @ErpOrderLineNum



