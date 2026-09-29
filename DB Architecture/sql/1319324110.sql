-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RReceiptContainer03
    	@InternalRecContNum numeric(9)

AS
   SET NOCOUNT ON
   SELECT *
     FROM RECEIPT_CONTAINER
	WHERE PARENT = @InternalRecContNum	

