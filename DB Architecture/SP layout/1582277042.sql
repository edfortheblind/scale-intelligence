/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	17142	| SA	| 12/19/05	| Created
	17142   | SWB   | 12/28/05      | Added Order By Clause  
	18633	| VK	| 02/13/06	| Retrieve Line Number
	97512	| MJ	| 04/24/12	| Retrieve ITEM
*/
CREATE PROCEDURE wm_RPurchaseOrderDetail02
	@PurchaseOrderObjectId numeric(9)
AS
	SELECT 
		OBJECT_ID, LINE_NUMBER,ITEM
	FROM 
		PURCHASE_ORDER_DETAIL
	WHERE 
		PURCHASE_ORDER_OBJECT_ID = @PurchaseOrderObjectId
	ORDER BY 
		LINE_NUMBER,
		ITEM,
		COMPANY