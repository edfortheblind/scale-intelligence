/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/

	CREATE PROCEDURE wm_RReceiptContainer04
    	@InternalReceiptNum numeric(9)

AS
   SET NOCOUNT ON
   SELECT *
     FROM RECEIPT_CONTAINER
	WHERE INTERNAL_RECEIPT_NUM = @InternalReceiptNum
	AND (PARENT IS NULL OR PARENT = 0)	

