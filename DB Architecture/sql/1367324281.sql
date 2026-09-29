-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




   

CREATE PROCEDURE wm_RReceiptDetail03
    	@ReceiptId nvarchar(25),
	@Item nvarchar(50),
	@Company nvarchar(25)

AS
   SET NOCOUNT ON
   SELECT *
     FROM RECEIPT_DETAIL
	WHERE RECEIPT_ID = @ReceiptId
	AND ITEM = @Item
	AND COMPANY = @Company
	

