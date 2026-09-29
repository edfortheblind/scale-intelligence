-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE MetaTrans_GetItemsForTpmReceiptFromPO(
@poHeaderObjectId numeric(9),
@userName nvarchar(30),
 @culture nvarchar(10))
AS
	SET NOCOUNT ON;	
	select
		ITEM as N'<literal:1>',  
		COMPANY as N'<literal:2>',
		ITEM_DESC as N'<literal:3>', 
		TOTAL_QUANTITY AS N'<literal:4>', 
		OPEN_QUANTITY AS N'<literal:5>',
		OPEN_QUANTITY AS N'<literal:6>', 
		QUANTITY_UM as N'<literal:7>',
		LINE_NUMBER as N'<literal:8>',
		@poHeaderObjectId as N'<literal:9>',
		OBJECT_ID as N'<literal:10>' 
	from 
		PURCHASE_ORDER_DETAIL
	where 
		PURCHASE_ORDER_OBJECT_ID = @poHeaderObjectId
		and OPEN_QUANTITY > 0		
	order by 
		LINE_NUMBER, ITEM;