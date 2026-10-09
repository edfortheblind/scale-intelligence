/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/

	CREATE PROCEDURE wm_RReceiptDetail01
    	@InternalReceiptLineNum numeric(9)

AS
   SET NOCOUNT ON
   SELECT *
     FROM RECEIPT_DETAIL
	WHERE INTERNAL_RECEIPT_LINE_NUM = @InternalReceiptLineNum
	

