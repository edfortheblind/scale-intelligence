/*
	Mod Number  | Programmer    	| Date       	| Modification Description
	--------------------------------------------------------------------
	85584       | KSS               |11/10/11       | Added the Close_date condition in where clause	
	191074		| DN				| 01/23/17		| Updated parameter types
*/
CREATE PROCEDURE wm_RReceiptHeader02
    	@ReceiptId nvarchar(25),
	@ReceiptIdType nvarchar(25)

AS
   SET NOCOUNT ON
   SELECT *
     FROM RECEIPT_HEADER
	WHERE RECEIPT_ID = @ReceiptId
	AND RECEIPT_ID_TYPE = @ReceiptIdType
	AND CLOSE_DATE is null  
	
	

