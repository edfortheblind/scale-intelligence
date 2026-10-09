/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	16313	| SMS	| 12/12/07	| Created
	85584   | KSS   |11/10/11   | Added the Close_date condition in where clause	

*/
	



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
			AND ISNULL(RH.RECEIPT_ID_TYPE, N'!')  = ISNULL(@ReceiptIdType, N'!')
			AND ISNULL(RH.RECEIPT_TYPE, N'!') = ISNULL(@ReceiptType, N'!')
			AND ISNULL(RD.ERP_ORDER_NUM, N'!') = ISNULL(@ErpOrderNum, N'!')
			AND RD.ERP_ORDER_LINE_NUM = @ErpOrderLineNum
			AND RH.WAREHOUSE = @Warehouse
			AND RH.CLOSE_DATE is null;  




