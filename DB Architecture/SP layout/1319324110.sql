/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/

	CREATE PROCEDURE wm_RReceiptContainer03
    	@InternalRecContNum numeric(9)

AS
   SET NOCOUNT ON
   SELECT *
     FROM RECEIPT_CONTAINER
	WHERE PARENT = @InternalRecContNum	

