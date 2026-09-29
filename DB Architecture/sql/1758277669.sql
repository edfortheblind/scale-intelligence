-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	


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




