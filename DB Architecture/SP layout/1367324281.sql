/*        
 Mod Number | Programmer | Date     | Modification Description        
 --------------------------------------------------------------------        
 140413     | NVS           | 04/23/14      | Change item length to 50
 191074		| DN			| 10/25/16		| UpdateD parameter type
*/   

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
	

