-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RReceiptDetail01
    	@InternalReceiptLineNum numeric(9)

AS
   SET NOCOUNT ON
   SELECT *
     FROM RECEIPT_DETAIL
	WHERE INTERNAL_RECEIPT_LINE_NUM = @InternalReceiptLineNum
	

