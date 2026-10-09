/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	207165	| RJR	| 06/21/17	| Created.
	230008	| PMB	| 12/24/18	| Modified to check @compAuth for all and list to validate company.
	
*/

CREATE PROCEDURE MetaTrans_GetItemsForReceiptFromPO(
@poHeaderObjectId numeric(9),
@userName nvarchar(30),
 @culture nvarchar(10))
AS
	SET NOCOUNT ON;

	Declare @compAuth nvarchar(50);   
	select @compAuth = COMPANY_AUTH from USER_PROFILE where USER_NAME  = @userName  

	select
		ITEM as N'Item',  
		COMPANY as N'Company',
		ITEM_DESC as N'Description', 
		TOTAL_QUANTITY AS N'TotalQuantity', 
		OPEN_QUANTITY AS N'AvailableQuantity',
		OPEN_QUANTITY AS N'ReceiptQuantity', 
		QUANTITY_UM as N'QuantityUm', 
		@poHeaderObjectId as N'POHdrObjectId',
		OBJECT_ID as N'POLineObjectId',
		LINE_NUMBER as N'POLineNumber' 
	from 
		PURCHASE_ORDER_DETAIL
	where 
		PURCHASE_ORDER_OBJECT_ID = @poHeaderObjectId
		and OPEN_QUANTITY > 0
		and   
			(@compAuth = N'All' OR  
			(@compAuth = N'List' and COMPANY IN (SELECT COMPANY  FROM COMPANY_ACCESS WHERE USER_NAME  = @userName ))  
		OR COMPANY IS NULL  
			) 
	order by 
		LINE_NUMBER, ITEM;