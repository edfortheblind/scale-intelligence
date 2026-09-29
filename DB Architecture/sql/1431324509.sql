-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RReceiptHeader03
    	@ReceiptId nvarchar(25),
    	@Warehouse nvarchar(25)

AS
   SET NOCOUNT ON
   SELECT *
     FROM RECEIPT_HEADER
	WHERE 
	RECEIPT_ID = @ReceiptId
	AND
	WAREHOUSE = @Warehouse
	

