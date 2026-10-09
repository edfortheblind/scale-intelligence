/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/

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
	

