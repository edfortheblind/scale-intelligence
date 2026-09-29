-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RReceiptHeader01
    	@InternalReceiptNum numeric(9)

AS
   SET NOCOUNT ON
   SELECT *
     FROM RECEIPT_HEADER
	WHERE INTERNAL_RECEIPT_NUM = @InternalReceiptNum
	

