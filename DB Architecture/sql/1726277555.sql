-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	



CREATE PROCEDURE wm_RReceiptDetail07
	@ReceiptId nvarchar(25),
	@ReceiptIdType nvarchar(25),
	@ReceiptType nvarchar(25),
	@ErpOrderNum nvarchar(25),
	@ErpOrderLineNum numeric(19,5),
	@Warehouse nvarchar(25)
AS
	SELECT *
		FROM RECEIPT_DETAIL RD,RECEIPT_HEADER RH
		WHERE 
			RD.INTERNAL_RECEIPT_NUM = RH.INTERNAL_RECEIPT_NUM
			AND RD.RECEIPT_ID = @ReceiptId
			AND ISNULL(RH.RECEIPT_ID_TYPE, N'<literal:1>')  = ISNULL(@ReceiptIdType, N'<literal:2>')
			AND ISNULL(RH.RECEIPT_TYPE, N'<literal:3>') = ISNULL(@ReceiptType, N'<literal:4>')
			AND ISNULL(RD.ERP_ORDER_NUM, N'<literal:5>') = ISNULL(@ErpOrderNum, N'<literal:6>')
			AND RD.ERP_ORDER_LINE_NUM = @ErpOrderLineNum
			AND RH.WAREHOUSE = @Warehouse
			AND RH.CLOSE_DATE is null;  




