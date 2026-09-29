-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RReceiptHeader02
    	@ReceiptId nvarchar(25),
	@ReceiptIdType nvarchar(25)

AS
   SET NOCOUNT ON
   SELECT *
     FROM RECEIPT_HEADER
	WHERE RECEIPT_ID = @ReceiptId
	AND RECEIPT_ID_TYPE = @ReceiptIdType
	AND CLOSE_DATE is null  
	
	

