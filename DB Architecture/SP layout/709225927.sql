/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	216762	| SKT	| 03/03/20	| Created. 
*/

CREATE PROCEDURE MetaTrans_GetItemsForTpmReceiptFromPO(
@poHeaderObjectId numeric(9),
@userName nvarchar(30),
 @culture nvarchar(10))
AS
	SET NOCOUNT ON;	
	select
		ITEM as N'Item',  
		COMPANY as N'Company',
		ITEM_DESC as N'Description', 
		TOTAL_QUANTITY AS N'TotalQuantity', 
		OPEN_QUANTITY AS N'AvailableQuantity',
		OPEN_QUANTITY AS N'ReceiptQuantity', 
		QUANTITY_UM as N'QuantityUm',
		LINE_NUMBER as N'POLineNumber',
		@poHeaderObjectId as N'POHdrObjectId',
		OBJECT_ID as N'POLineObjectId' 
	from 
		PURCHASE_ORDER_DETAIL
	where 
		PURCHASE_ORDER_OBJECT_ID = @poHeaderObjectId
		and OPEN_QUANTITY > 0		
	order by 
		LINE_NUMBER, ITEM;