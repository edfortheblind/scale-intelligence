/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	16313	| SMS	| 12/12/07	| Created
	85584   | KSS   |11/10/11   | Added the Close_date condition in where clause	

*/
	


CREATE PROCEDURE wm_RReceiptHeader08
	@ReceiptId nvarchar(25),
	@ReceiptIdType nvarchar(25),
	@Warehouse nvarchar(25)
AS
	SELECT *
    FROM RECEIPT_HEADER
	WHERE RECEIPT_ID = @ReceiptId
	AND RECEIPT_ID_TYPE = @ReceiptIdType
	AND WAREHOUSE = @Warehouse
	AND CLOSE_DATE  is null ;  




