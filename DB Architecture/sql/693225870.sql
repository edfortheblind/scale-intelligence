-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE MetaTrans_GetItemsForReceiptFromPO(
@poHeaderObjectId numeric(9),
@userName nvarchar(30),
 @culture nvarchar(10))
AS
	SET NOCOUNT ON;

	Declare @compAuth nvarchar(50);   
	select @compAuth = COMPANY_AUTH from USER_PROFILE where USER_NAME  = @userName  

	select
		ITEM as N'<literal:1>',  
		COMPANY as N'<literal:2>',
		ITEM_DESC as N'<literal:3>', 
		TOTAL_QUANTITY AS N'<literal:4>', 
		OPEN_QUANTITY AS N'<literal:5>',
		OPEN_QUANTITY AS N'<literal:6>', 
		QUANTITY_UM as N'<literal:7>', 
		@poHeaderObjectId as N'<literal:8>',
		OBJECT_ID as N'<literal:9>',
		LINE_NUMBER as N'<literal:10>' 
	from 
		PURCHASE_ORDER_DETAIL
	where 
		PURCHASE_ORDER_OBJECT_ID = @poHeaderObjectId
		and OPEN_QUANTITY > 0
		and   
			(@compAuth = N'<literal:11>' OR  
			(@compAuth = N'<literal:12>' and COMPANY IN (SELECT COMPANY  FROM COMPANY_ACCESS WHERE USER_NAME  = @userName ))  
		OR COMPANY IS NULL  
			) 
	order by 
		LINE_NUMBER, ITEM;