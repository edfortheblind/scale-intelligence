-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RReceiptContainer04
    	@InternalReceiptNum numeric(9)

AS
   SET NOCOUNT ON
   SELECT *
     FROM RECEIPT_CONTAINER
	WHERE INTERNAL_RECEIPT_NUM = @InternalReceiptNum
	AND (PARENT IS NULL OR PARENT = 0)	

