-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RReceiptDetail04
    	@InternalReceiptNum numeric(9)

AS
   SET NOCOUNT ON
   SELECT *
     FROM RECEIPT_DETAIL
	WHERE INTERNAL_RECEIPT_NUM = @InternalReceiptNum
	

