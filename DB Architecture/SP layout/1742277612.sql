/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	16106	| SSG	| 02/24/06	| Created
	85584   | KSS   |11/10/11   | Added the Close_date condition in where clause	
	146900	| NRJ	| 09/11/14	 | Added warehouse condition in the warehouse clause.
*/
	



CREATE PROCEDURE wm_RReceiptHeader07
	@ReceiptId nvarchar(25),
	@ReceiptIdType nvarchar(25),
	@ReceiptType nvarchar(25),
	@Warehouse nvarchar(25)
AS
	SELECT *
     	FROM RECEIPT_HEADER
	WHERE RECEIPT_ID = @ReceiptId
	AND RECEIPT_ID_TYPE = @ReceiptIdType
	AND RECEIPT_TYPE = @ReceiptType
	AND WAREHOUSE = @Warehouse
	AND CLOSE_DATE is null ;



